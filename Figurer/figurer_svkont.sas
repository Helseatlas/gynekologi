/*ENKEL RATEFIGUR, ALLE KONSULTASJONER*/

%let tema=svkontakt;
%let rv1=&tema._tot;

%let fignavn=;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner i svangerskapet pr fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 13.9.2014-31.12.2016.;
%let xlabel= Polikliniske konsultasjoner i svangerskapet pr. fødsel. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);

/*Lager rankingtabell*/
proc sort data=&tema._tot_bohf;
by decending rateSnitt;
run;

data rank_&tema;
set &tema._tot_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;


/*ANDEL MED KODE FOR KONTROLL/UL*/

%let tema=svkont;

%let dsn1=&tema.akt_tot_bohf;
%let rv1=&tema.akt_tot;

%let dsn2=&tema._aUL_tot_bohf;
%let rv2=&tema._aUL_tot;

%merge(ant_datasett=2, dsn_ut=&tema._akode_bohf);

%let Andel=andel_2_1;
%let fignavn=kontrUL;
%let type=kons;
%let tittel=Andel polikliniske konsultasjoner i svangerskapet med utvalgte koder. Gjennomsnitt for perioden 13.9.2014-31.12.2016.;
%let xlabel= Andel konsultasjoner med utvalgte koder;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Alle" &tabellvar2="Utvalgte koder" &tabellvar3="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let vis_ft=0;
%andelsfig(datasett=&tema._akode_bohf);
/*Setter tilbake til default-verdi*/
%let vis_ft=1;


/*ENKEL RATEFIGUR, ALLE UL*/

%let tema=svkontUL;
%let rv1=&tema._tot;

%let fignavn=;
%let type=unders;
%let tittel=Antall ultralydundersøkelser i svangerskapet pr fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 13.9.2014-31.12.2016.;
%let xlabel= Ultralydundersøkelser i svangerskapet pr. fødsel. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="UL" &tabellvar2="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);

/*Lager rankingtabell*/
proc sort data=&tema._tot_bohf;
by decending rateSnitt;
run;

data rank_&tema;
set &tema._tot_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;

/*Sammensatt figur med alle UL i de tre trimestrene*/

%let tema=UL;

data &tema.1T_bohf2;
set &tema.1T_tot_bohf;
RateSnitt1T=RateSnitt;
rate1T2014=rate2014;
rate1T2015=rate2015;
rate1T2016=rate2016;
if bohf=8888 then do;
RateSnittN1T=RateSnitt;
end;

keep BoHF RateSnitt1T RateSnittN1T &tema.1T_tot Innbyggere rate1T2014 rate1T2015 rate1T2016;

run;

data &tema.2T_bohf2;
set &tema.2T_tot_bohf;
RateSnitt2T=RateSnitt;
rate2T2014=rate2014;
rate2T2015=rate2015;
rate2T2016=rate2016;
if bohf=8888 then do;
RateSnittN2T=RateSnitt;
end;

keep BoHF RateSnitt2T RateSnittN2T &tema.2T_tot Innbyggere rate2T2014 rate2T2015 rate2T2016;

run;

data &tema.3T_bohf2;
set &tema.3T_tot_bohf;
RateSnitt3T=RateSnitt;
rate3T2014=rate2014;
rate3T2015=rate2015;
rate3T2016=rate2016;
if bohf=8888 then do;
RateSnittN3T=RateSnitt;
end;

keep BoHF RateSnitt3T RateSnittN3T &tema.3T_tot Innbyggere rate3T2014 rate3T2015 rate3T2016;

run;

proc sort data=&tema.1T_bohf2;
by bohf;
quit;

proc sort data=&tema.2T_bohf2;
by bohf;
quit;

proc sort data=&tema.3T_bohf2;
by bohf;
quit;



options locale=NB_no;
data &tema._BOHF;
merge &tema.1T_bohf2 &tema.2T_bohf2 &tema.3T_bohf2;
by BoHF;
Antall_tot=&tema.1T_tot + &tema.2T_tot + &tema.3T_tot;
RateSnitt_tot = RateSnitt1T + RateSnitt2T + RateSnitt3T;
RateSnitt_1T2T = RateSnitt1T + RateSnitt2T;
Rate2014_tot = rate1T2014 + rate2T2014 + rate3T2014;
Rate2015_tot = rate1T2015 + rate2T2015 + rate3T2015;
Rate2016_tot = rate1T2016 + rate2T2016 + rate3T2016;
Andel1T=RateSnitt1T/RateSnitt_tot;
pros_plass= + 0.3;/* avstand fra x=0, eventuelt RateSnitt_tot -0.02 hvis ETTER søylen */;
if bohf=8888 then do;
RateSnittN_tot = RateSnittN1T + RateSnittN2T + RateSnittN3T;
RateSnittN_1T2T = RateSnittN1T + RateSnittN2T;
format Antall_tot nlnum8.0;
end;
max=max(of rate201:);
min=min(of rate201:);
run;

proc sort data=&tema._BOHF;
by descending RateSnitt_tot;
run;


/*INPUT FOR HVER FIGUR:*/
%let fignavn=tredelt_trimester; *additional info for figure name, can be empty;
%let type=unders;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall ultralydundersøkelser per fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 13.9.2014-31.12.2016.;
%let xlabel=Ultralydundersøkelser pr. fødsel. Aldersjusterte rater.;
%let anno=ANNO;
%let tabellvar1=Antall_tot;/*fra forbruksmal*/
%let tabellvar2=Innbyggere;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="UL" &tabellvar2="Fødsler";
%let dsn_fig=&tema._BOHF;
%let skala=/*values=(0 to 1.5 by 0.5)*/;

ODS Graphics ON /reset=All imagename="&tema._&type._&fignavn" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&dsn_fig noborder noautolegend sganno=&anno pad=(Bottom=5%);
hbarparm category=bohf response=RateSnitt_tot / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp1" legendlabel="3 trimester";
hbarparm category=bohf response=RateSnitt_1T2T / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="2 trimester" ;
hbarparm category=bohf response=RateSnitt1T / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="1 trimester" ; 
hbarparm category=bohf response=RateSnittN_tot / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C); 
/*hbarparm category=bohf response=RateSnittN_hrnod / fillattrs=(color=CX969696) outlineattrs=(color=black);
hbarparm category=bohf response=RateSnittN_hrn / fillattrs=(color=CX4C4C4C) outlineattrs=(color=black);
hbarparm category=bohf response=RateSnittNn / fillattrs=(color=CX4C4C4C) outlineattrs=(color=black);*/
/*scatter x=pros_plass y=bohf /datalabel=Andel1T datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);*/


	keylegend "hp3" "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	 Yaxistable &tabellvar1 &tabellvar2 /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 &skala valueattrs=(size=7) label="&xlabel" labelattrs=(size=7 weight=bold);
		Label &labeltabell;
		Format Andel1T nlpct8.1;

run;
Title; 
ods listing close;



* 1 trimester;

%let tabellvar1=&tema.1T_tot;/*fra forbruksmal*/

proc sort data=&tema._BOHF;
by descending RateSnitt1T;
run;

ODS Graphics ON /reset=All imagename="&tema._&type._1trimester" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title1 "&tittel";
title2 "1 trimester";
proc sgplot data=&dsn_fig noborder noautolegend sganno=&anno pad=(Bottom=5%);

hbarparm category=bohf response=RateSnitt1T / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="1 trimester" ; 
hbarparm category=bohf response=RateSnittN1T / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C); 


	keylegend "hp3"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	 Yaxistable &tabellvar1 &tabellvar2 /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 &skala valueattrs=(size=7) label="&xlabel" labelattrs=(size=7 weight=bold);
		Label &labeltabell;
		
run;
Title1; title2;
ods listing close;

* 2 trimester;

%let tabellvar1=&tema.2T_tot;/*fra forbruksmal*/

proc sort data=&tema._BOHF;
by descending RateSnitt2T;
run;

ODS Graphics ON /reset=All imagename="&tema._&type._2trimester" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title1 "&tittel";
title2 "2 trimester";
proc sgplot data=&dsn_fig noborder noautolegend sganno=&anno pad=(Bottom=5%);

hbarparm category=bohf response=RateSnitt2T / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp3" legendlabel="2 trimester" ; 
hbarparm category=bohf response=RateSnittN2T / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C); 


	keylegend "hp3"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	 Yaxistable &tabellvar1 &tabellvar2 /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 &skala valueattrs=(size=7) label="&xlabel" labelattrs=(size=7 weight=bold);
		Label &labeltabell;
		
run;
Title1; title2;
ods listing close;

* 3 trimester;

%let tabellvar1=&tema.3T_tot;/*fra forbruksmal*/

proc sort data=&tema._BOHF;
by descending RateSnitt3T;
run;

ODS Graphics ON /reset=All imagename="&tema._&type._3trimester" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title1 "&tittel";
title2 "3 trimester";
proc sgplot data=&dsn_fig noborder noautolegend sganno=&anno pad=(Bottom=5%);

hbarparm category=bohf response=RateSnitt3T / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp3" legendlabel="3 trimester" ; 
hbarparm category=bohf response=RateSnittN3T / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C); 


	keylegend "hp3"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	 Yaxistable &tabellvar1 &tabellvar2 /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 &skala valueattrs=(size=7) label="&xlabel" labelattrs=(size=7 weight=bold);
		Label &labeltabell;
		
run;
Title1; title2;
ods listing close;

/*Sammensatt figur med alle kontroller*/

%let tema=svkontr;

data &tema._n_bohf2;
set &tema._n_tot_bohf;
RateSnittn=RateSnitt;
raten2014=rate2014;
raten2015=rate2015;
raten2016=rate2016;
if bohf=8888 then do;
RateSnittNn=RateSnitt;
end;

keep BoHF RateSnittn RateSnittNn &tema._n_tot Innbyggere raten2014 raten2015 raten2016;

run;

data &tema._hr_bohf2;
set &tema._hr_tot_bohf;
RateSnitthr=RateSnitt;
ratehr2014=rate2014;
ratehr2015=rate2015;
ratehr2016=rate2016;
if bohf=8888 then do;
RateSnittNhr=RateSnitt;
end;

keep BoHF RateSnitthr RateSnittNhr &tema._hr_tot Innbyggere ratehr2014 ratehr2015 ratehr2016;

run;

data &tema._od_bohf2;
set &tema._od_tot_bohf;
RateSnittod=RateSnitt;
rateod2014=rate2014;
rateod2015=rate2015;
rateod2016=rate2016;
if bohf=8888 then do;
RateSnittNod=RateSnitt;
end;

keep BoHF RateSnittod RateSnittNod &tema._od_tot Innbyggere rateod2014 rateod2015 rateod2016;

run;

data &tema._t_bohf2;
set &tema._t_tot_bohf;
RateSnittt=RateSnitt;
ratet2014=rate2014;
ratet2015=rate2015;
ratet2016=rate2016;
if bohf=8888 then do;
RateSnittNt=RateSnitt;
end;

keep BoHF RateSnittt RateSnittNt &tema._t_tot Innbyggere ratet2014 ratet2015 ratet2016;

run;

proc sort data=&tema._hr_bohf2;
by bohf;
quit;

proc sort data=&tema._od_bohf2;
by bohf;
quit;

proc sort data=&tema._n_bohf2;
by bohf;
quit;

proc sort data=&tema._t_bohf2;
by bohf;
quit;


options locale=NB_no;
data &tema._BOHF;
merge &tema._hr_bohf2 &tema._od_bohf2 &tema._n_bohf2 &tema._t_bohf2;
by BoHF;
Antall_tot=&tema._n_tot + &tema._hr_tot + &tema._od_tot + &tema._t_tot;
RateSnitt_tot = RateSnittn + RateSnitthr + RateSnittod + RateSnittt;
RateSnitt_hrnod = RateSnittn + RateSnitthr + RateSnittod;
RateSnitt_hrn = RateSnittn + RateSnitthr;
Rate2014_tot = raten2014 + ratehr2014 + rateod2014 + ratet2014;
Rate2015_tot = raten2015 + ratehr2015 + rateod2015 + ratet2015;
Rate2016_tot = raten2016 + ratehr2016 + rateod2016 + ratet2016;
Andeln=RateSnittn/RateSnitt_tot;
pros_plass= + 0.01;/* avstand fra x=0, eventuelt RateSnitt_tot -0.02 hvis ETTER søylen */;
if bohf=8888 then do;
RateSnittN_tot = RateSnittNn + RateSnittNhr + RateSnittNod + RateSnittNt;
RateSnittN_hrnod = RateSnittNn + RateSnittNhr + RateSnittNod;
RateSnittN_hrn = RateSnittNn + RateSnittNhr;
format Antall_tot nlnum8.0;
end;
max=max(of rate201:);
min=min(of rate201:);
run;

proc sort data=&tema._BOHF;
by descending RateSnitt_tot;
run;


/*INPUT FOR HVER FIGUR:*/
%let fignavn=firedelt_kode; *additional info for figure name, can be empty;
%let type=kons;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall svangerskapskontroller per fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 13.9.2014-31.12.2016.;
%let xlabel=Svangerskapskontroller pr. fødsel. Aldersjusterte rater.;
%let anno=ANNO;
%let tabellvar1=Antall_tot;/*fra forbruksmal*/
%let tabellvar2=Innbyggere;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontroller" &tabellvar2='Fødsler';
%let dsn_fig=&tema._BOHF;
%let skala=/*values=(0 to 1.5 by 0.5)*/;

ODS Graphics ON /reset=All imagename="&tema._&type._&fignavn" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&dsn_fig noborder noautolegend sganno=&anno pad=(Bottom=5%);
hbarparm category=bohf response=RateSnitt_tot / fillattrs=(color=CXCCCCCC) outlineattrs=(color=black) missing name="hp1" legendlabel="Takst";
hbarparm category=bohf response=RateSnitt_hrnod / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="O-diagnose" ;
hbarparm category=bohf response=RateSnitt_hrn / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp3" legendlabel="Høyrisiko" ; 
hbarparm category=bohf response=RateSnittn / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp4" legendlabel="Normal" ; 

hbarparm category=bohf response=RateSnittN_tot / fillattrs=(color=CXC3C3C3) outlineattrs=(color=black); 
/*hbarparm category=bohf response=RateSnittN_hrnod / fillattrs=(color=CX969696) outlineattrs=(color=black);
hbarparm category=bohf response=RateSnittN_hrn / fillattrs=(color=CX4C4C4C) outlineattrs=(color=black);
hbarparm category=bohf response=RateSnittNn / fillattrs=(color=CX4C4C4C) outlineattrs=(color=black);*/
scatter x=pros_plass y=bohf /datalabel=Andeln datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);


	keylegend "hp4" "hp3" "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	 Yaxistable &tabellvar1 &tabellvar2 /Label location=inside labelpos=top position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 &skala valueattrs=(size=7) label="&xlabel" labelattrs=(size=7 weight=bold);
		Label &labeltabell;
		Format Andeln nlpct8.1;

run;
Title; 
ods listing close;


