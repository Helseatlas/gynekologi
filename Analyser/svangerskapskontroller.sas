%Let sv_lengde=255;
%Let forste_trim_grense=199;
%Let andre_trim_grense=87;
%Let sv_dato="13SEP2014"d;
%Let gj_aar=2016;

/*Datasett til telling av kontakter i svangerskapet*/
%Let dsn=svkont;
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

/*Sorterer slik at fødselen kommer før/over tilhørende svangerskapskontroller*/
proc sort data=&dsn;
by pid descending EoC_inndato descending fodedato;
run;

/*Kopierer dato for fødsel (fodedato) +++ til alle kontakter under helt til man kommer til en ny fødsel eller en ny PID*/
/*Alle kontroller som ikke følges (i tid) av en fødsel vil få fodedato+++ lik missing*/
data &dsn(drop = tmp_fodedato tmp_fodealder tmp_fodekomnr tmp_fodebydel);
set &dsn;
by pid descending EoC_inndato descending fodedato;

if &ftype=1 then do;
	tmp_fodedato = fodedato;
	tmp_fodealder = fodealder;
	tmp_fodekomnr = fodekomnr;
	tmp_fodebydel = fodebydel;
end;
else do;
	if first.pid then do;	/*Hvis man kommer til ny PID og første kontakt for ny PID ikke er en fødsel, så settes fodedato +++ til missing*/
		fodedato = . ;
		fodealder = . ;
		fodekomnr= . ;
		fodebydel= . ;
		tmp_fodedato = . ;
		tmp_fodealder = . ;
		tmp_fodekomnr = . ;
		tmp_fodebydel = . ;
	end;
	else do;
		fodedato = tmp_fodedato;
		fodealder = tmp_fodealder;
		fodekomnr= tmp_fodekomnr;
		fodebydel = tmp_fodebydel;
	end;
end;	

retain tmp_fodedato	tmp_fodealder tmp_fodekomnr tmp_fodebydel;
run;

/*Regner ut hvor lenge før fødselen den aktuelle kontakten var. */
/*Hvis kontakten ikke er knyttet til en fødsel (har fodedato = .) får variabelen dager_for_fodsel verdien missing*/
data &dsn;
set &dsn;
by pid descending EoC_inndato descending fodedato;

if &ftype = . and fodedato ne . then do;
	dager_for_fodsel=fodedato-EoC_inndato;
end;

run;


/*Teller kontakter, ultralyder og kontroller i svangerskapet*/
data &dsn;
set &dsn;
by pid descending EoC_inndato descending fodedato;

if dager_for_fodsel ne . then do;
/*Tar med alle kontakter fom: fødselsdato - &sv_lengde. Tar ikke med kontroller som er en del av et døgnopphold.*/	
	if EoC_aktivitetskategori3 ne 1 and dager_for_fodsel le &sv_lengde then svkontakt=1;
end;

if Kontroll=1 and svkontakt=1 then svkontr_a=1;
if Kontroll_normal=1 and svkontakt=1 then svkontr_n=1;
if Kontroll_hoyrisk=1 and svkontakt=1 then svkontr_hr=1;
if Kontroll_Odiag=1 and svkontakt=1 then svkontr_od=1;
if Kontroll_takst=1 and svkontakt=1 then svkontr_t=1;

if UL=1 and svkontakt=1 then svkontUL=1;

if svkontr_a=1 or svkontUL=1 then svkont_aUL=1;

if dager_for_fodsel gt &forste_trim_grense then forste_trim=1;
else if dager_for_fodsel le &forste_trim_grense and dager_for_fodsel gt &andre_trim_grense then andre_trim=1;
else if dager_for_fodsel le &andre_trim_grense then tredje_trim=1;

if svkontUL=1 and forste_trim=1 then UL1T=1;
if svkontUL=1 and andre_trim=1 then UL2T=1;
if svkontUL=1 and tredje_trim=1 then UL3T=1;

run;

/*Velger ut aktuelle kontakter for videre analyse. Tar med bare de som er knyttet til en fødsel som forekommer etter &sv_dato*/
data &dsn._utvalg;
set &dsn;
by pid descending EoC_inndato descending fodedato;
where fodedato ne . and fodedato gt &sv_dato;				
run;

/*Teller antall kontakter i hvert svangerskap*/
proc sql;
   create table &dsn._allekont as 
   select distinct pid, fodedato, fodealder, fodekomnr, fodebydel, SUM(svkontakt) as ant_svkontakt
   from &dsn._utvalg
   group by pid, fodedato;
quit;

/*Teller antall kontakter i hvert svangerskap*/
proc sql;
   create table &dsn._alleUL as 
   select distinct pid, fodedato, fodealder, fodekomnr, fodebydel, SUM(svkontUL) as ant_UL
   from &dsn._utvalg
   group by pid, fodedato;
quit;

/*Teller antall fødsler og lagrer til innbyggerfil.*/
proc sql;
   create table &dsn._allefodsler as 
   select distinct pid, fodedato, fodealder, fodekomnr, fodebydel
   from &dsn._utvalg
   group by pid, fodedato;
quit;

data &dsn._allefodsler;
set &dsn._allefodsler;
fodsel=1;
run;

proc sql;
   create table &dsn._fodsler as 
   select distinct fodealder, fodekomnr, fodebydel, sum(fodsel) as innbyggere
   from &dsn._allefodsler
   group by fodealder, fodekomnr, fodebydel;
quit;

/*Setter aar=&gj_aar for alle fødslene. Raten blir dermed gjennomsnittsrate for perioden &sv_dato - 31.12 &gj_aar.*/
data helseatl.&dsn._fodsler;
set &dsn._fodsler;
aar=&gj_aar;
ermann=0;
alder=fodealder;
komnr=fodekomnr;
bydel=fodebydel;

drop fodealder fodekomnr fodebydel;
run;

/*Lager index for å gjøre aggregering raskere*/
proc datasets library=work;
	modify &dsn._utvalg;
	index create pid;
run;

/*Makro for å sette aar=&gj_aar og lagre på server*/
%macro settAar_lagre;

/*Setter aar=&gj_aar i alle rader i det aggregerte datasettet*/
data &tema._agg;
set &tema._agg;
aar=&gj_aar;
run;

/*Aggregerer på nytt slik at alle kontakter i perioden &sv_dato - 31.12 &gj_aar skrives til året &gj_aar*/
proc sql;
   create table helseatl.k_u_&tema as 
   select distinct aar, ermann, alder, komnr, bydel, 
   SUM(tot) as tot, SUM(tot_unik) as tot_unik, sum(tot_unik_alleaar) as tot_unik_alleaar,
   SUM(off) as off, SUM(off_unik) as off_unik,
   SUM(priv) as priv, SUM(priv_unik) as priv_unik,
   SUM(elek) as elek, SUM(elek_unik) as elek_unik,
   SUM(ohj) as ohj, SUM(ohj_unik) as ohj_unik,
   SUM(inn) as inn, SUM(inn_unik) as inn_unik,
   SUM(inn_elek) as inn_elek, SUM(inn_elek_unik) as inn_elek_unik,
   SUM(inn_ohj) as inn_ohj, SUM(inn_ohj_unik) as inn_ohj_unik,
   SUM(poli) as poli, SUM(poli_unik) as poli_unik,
   SUM(poli_off) as poli_off, SUM(poli_off_unik) as poli_off_unik,
   SUM(poli_priv) as poli_priv, SUM(poli_priv_unik) as poli_priv_unik,
   SUM(eoc_liggetid) as eoc_liggetid
   from &tema._agg
   group by aar, ermann, alder, komnr, bydel;
quit;

/*Sletter midlertidige datasett så ikke det blir for mange datasett*/
proc datasets nolist;
delete &tema._agg;
run;

%mend settAar_lagre;


/*Aggregerer*/
%Let tema=svkontakt;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

/*%Let tema=svkontr_a;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;*/

%Let tema=svkontr_n;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=svkontr_hr;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=svkontr_od;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=svkontr_t;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=svkontUL;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=UL1T;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=UL2T;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=UL3T;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;

%Let tema=svkont_aUL;
%aggreger(inndata=&dsn._utvalg, utdata=&tema._agg, agg_var=&tema);
%settAar_lagre;



