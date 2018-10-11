/*Datasett til telling av kontakter i barseltida*/
%Let dsn=polibarsel;
/*Registrere dato, alder og bosted i egne variabler for alle fødsler*/
data &dsn;
set kontakter_fodende;
if &ftype=1 then do;
fodedato=EoC_inndato;
fodealder=alder;
fodekomnr=komnr;
fodebydel=bydel;
end;
format fodedato date10.;
run;

/*Sorterer slik at fødselen kommer før/over tilhørende kontakter i barseltid*/
proc sort data=&dsn;
by pid EoC_inndato fodedato;
run;

/*Kopierer dato for fødsel (fodedato) +++ til alle kontakter under helt til man kommer til en ny fødsel eller en ny PID*/
/*Alle kontroller som ikke følges (i tid) av en fødsel vil få fodedato+++ lik missing*/
data &dsn(drop = tmp_fodedato tmp_fodealder tmp_fodekomnr tmp_fodebydel);
set &dsn;
by pid EoC_inndato fodedato;

if Levende_fodt=1 then do;
	tmp_fodedato = fodedato;
	tmp_fodealder = fodealder;
	tmp_fodekomnr = fodekomnr;
	tmp_fodebydel = fodebydel;
end;
else do;
	if tmp_fodedato ne . then do;
		if first.pid then do;
			tmp_fodedato = fodedato;
			tmp_fodealder = fodealder;
			tmp_fodekomnr = fodekomnr;
			tmp_fodebydel = fodebydel;
		end;
		else do;
			fodedato = tmp_fodedato;
			fodealder = tmp_fodealder;
			fodekomnr= tmp_fodekomnr;
			fodebydel = tmp_fodebydel;
			tmp_fodedato = fodedato;
			tmp_fodealder = fodealder;
			tmp_fodekomnr = fodekomnr;
			tmp_fodebydel = fodebydel;
		end;
	end;
	else do;
		tmp_fodedato = fodedato;
		tmp_fodealder = fodealder;
		tmp_fodekomnr = fodekomnr;
		tmp_fodebydel = fodebydel;
	end;
end;	

retain tmp_fodedato	tmp_fodealder tmp_fodekomnr tmp_fodebydel;


run;

/*Teller antall fødsler og lagrer innbyggerfil på server.*/
proc sql;
   create table &dsn._allefodsler as 
   select distinct pid, fodedato, fodealder, fodekomnr, fodebydel
   from &dsn
   group by pid, fodedato;
quit;

data &dsn._allefodsler;
set &dsn._allefodsler;
fodsel=1;
aar=year(fodedato);
run;

proc sql;
   create table &dsn._fodsler as 
   select distinct aar, fodealder, fodekomnr, fodebydel, sum(fodsel) as innbyggere
   from &dsn._allefodsler
   group by aar, fodealder, fodekomnr, fodebydel;
quit;

data helseatl.&dsn._fodsler;
set &dsn._fodsler;
ermann=0;
alder=fodealder;
komnr=fodekomnr;
bydel=fodebydel;

drop fodealder fodekomnr fodebydel;
run;


/*Regner ut hvor lenge etter fødselen den aktuelle kontakten var. */
/*Hvis kontakten ikke er knyttet til en fødsel (har fodedato = .) får variabelen dager_etter_fodsel verdien missing*/
data &dsn._kont;
set &dsn;

if Levende_fodt=. and fodedato ne . then do;			/*Sikrer at vi ikke tar med selve fødselen*/
	dager_etter_fodsel = EoC_inndato - fodedato;
	if dager_etter_fodsel ge 1 and dager_etter_fodsel le 42 and EoC_liggetid=0 then barselkont=1;		/*Kun opphold fom dagen etter inndato for fødselsoppholdet telles med, tar bare med opphold med liggetid=0*/
	if dager_etter_fodsel ge 1 and dager_etter_fodsel le 7 and EoC_liggetid=0 then barselkont7d=1;
end;

run;

/*Klassifiserer en del tilstandskoder som spesielt relevante for barselkvinner*/
/*data &dsn._koder;
set &dsn._kontakter;
where barselkont=1;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);
         if substr(diagnose{i},1,2) in ('O1','O2','O3','O4','O7','O8') then barsel_kode=1;
		 if substr(diagnose{i},1,3) in ('O90','O91','O92','O94') then barsel_kode=1;
		 if substr(diagnose{i},1,3) in ('O98','O99') then barsel_kode=1;
		 if substr(diagnose{i},1,3) in ('Z39','Z48') then barsel_kode=1;
		 if substr(diagnose{i},1,3) in ('N61','T81') then barsel_kode=1;		/*N61 Betennelsestilstander i bryst, T81 Komplikasjoner til kirurgiske og medisinske prosedyrer, i kl annet sted
		 if substr(diagnose{i},1,4) in ( 'N390') then barsel_kode=1;		/*N39 Urinveisinfeksjon md uspes. lokalisasjon
		 
     end;
	 
if barselkont7d=1 and barsel_kode=1 then barsel_kode7d=1;

run;*/

/*Aggregerer*/
%Let tema=barselkont;
%aggreger(inndata=&dsn._kont, utdata=k_u_&tema._18, agg_var=&tema, mappe=helseatl);
%Let tema=barselkont7d;
%aggreger(inndata=&dsn._kont, utdata=k_u_&tema._18, agg_var=&tema, mappe=helseatl);
/*%Let tema=barsel_kode;
%aggreger(inndata=&dsn._koder, utdata=k_u_&tema, agg_var=&tema, mappe=helseatl);
%Let tema=barsel_kode7d;
%aggreger(inndata=&dsn._koder, utdata=k_u_&tema, agg_var=&tema, mappe=helseatl);*/


proc sort data=&dsn._kont(keep=EoC_Id barselkont) out=flagg_barselkont;
  by EOC_Id;
quit;

