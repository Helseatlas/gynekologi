%let tema=Hyster;

data &tema._Lap_dp_bohf2;
set &tema._Lap_dp_bohf;
RateSnittLap=RateSnitt;
rateLap2014=rate2014;
rateLap2015=rate2015;
rateLap2016=rate2016;
if bohf=8888 then do;
RateSnittNlap=RateSnitt;
end;

keep BoHF RateSnittLap RateSnittNlap &tema._Lap_dp Innbyggere rateLap2014 rateLap2015 rateLap2016;

run;

data &tema._Aapen_dp_bohf2;
set &tema._Aapen_dp_bohf;
RateSnittApen=RateSnitt;
rateApen2014=rate2014;
rateApen2015=rate2015;
rateApen2016=rate2016;
if bohf=8888 then do;
RateSnittNapen=RateSnitt;
end;

keep BoHF RateSnittApen RateSnittNapen &tema._Aapen_dp Innbyggere rateApen2014 rateApen2015 rateApen2016;

run;

data &tema._Vaginal_dp_bohf2;
set &tema._Vaginal_dp_bohf;
RateSnittVag=RateSnitt;
rateVag2014=rate2014;
rateVag2015=rate2015;
rateVag2016=rate2016;
if bohf=8888 then do;
RateSnittNvag=RateSnitt;
end;

keep BoHF RateSnittVag RateSnittNvag &tema._Vaginal_dp Innbyggere rateVag2014 rateVag2015 rateVag2016;

run;

proc sort data=&tema._Aapen_dp_bohf2;
by bohf;
quit;

proc sort data=&tema._Vaginal_dp_bohf2;
by bohf;
quit;

proc sort data=&tema._Lap_dp_bohf2;
by bohf;
quit;



data &tema._dp_BOHF;
merge &tema._Aapen_dp_bohf2 &tema._Vaginal_dp_bohf2 &tema._Lap_dp_bohf2;
by BoHF;
RateSnitt_tot = RateSnittLap + RateSnittApen + RateSnittVag;
RateSnitt_apenlap = RateSnittLap + RateSnittApen;
Rate2014_tot = rateLap2014 + rateApen2014 + rateVag2014;
Rate2015_tot = rateLap2015 + rateApen2015 + rateVag2015;
Rate2016_tot = rateLap2016 + rateApen2016 + rateVag2016;
AndelLap=RateSnittLap/RateSnitt_tot;
pros_plass= + 0.01;/* avstand fra x=0, eventuelt RateSnitt_tot -0.02 hvis ETTER søylen */;
if bohf=8888 then do;
RateSnittN_tot = RateSnittNlap + RateSnittNapen + RateSnittNvag;
RateSnittN_Apenlap = RateSnittNlap + RateSnittNapen;

end;
max=max(of rate201:);
min=min(of rate201:);
run;

proc sort data=&tema._dp_BOHF;
by descending RateSnitt_tot;
run;


/*INPUT FOR HVER FIGUR:*/
%let fignavn=tredelt_kir_metode; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel=Hysterektomi, ikke-kreft, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tabellvar1=&tema._Lap_dp;/*fra forbruksmal*/
%let tabellvar2=&tema._Aapen_dp;/*fra forbruksmal*/
%let tabellvar3=&tema._Vaginal_dp;/*fra forbruksmal*/
%let tabellvar4=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3 &tabellvar4;
%let labeltabell=&tabellvar1="Lap" &tabellvar2="Apen" &tabellvar3="Vaginal" &tabellvar4="Innbyggere";
%let dsn_fig=&tema._dp_BOHF;
%let skala=/*values=(0 to 1.5 by 0.5)*/;

ODS Graphics ON /reset=All imagename="&tema._&type._&fignavn" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&dsn_fig noborder noautolegend sganno=&anno pad=(Bottom=5%);
hbarparm category=bohf response=RateSnitt_tot / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp1" legendlabel="Vaginal";
hbarparm category=bohf response=RateSnitt_apenlap / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="Åpen" ;
hbarparm category=bohf response=RateSnittLap / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="Lapraskop." ; 

hbarparm category=bohf response=RateSnittN_tot / fillattrs=(color=CXC3C3C3) outlineattrs=(color=black); 
hbarparm category=bohf response=RateSnittN_Apenlap / fillattrs=(color=CX969696) outlineattrs=(color=black);
hbarparm category=bohf response=RateSnittNlap / fillattrs=(color=CX4C4C4C) outlineattrs=(color=black);
scatter x=pros_plass y=bohf /datalabel=AndelLap datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
/*	scatter x=rate2014_tot y=Bohf / markerattrs=(symbol=squarefilled color=black) legendlabel="2014";*/
/*	scatter x=rate2015_tot y=Bohf / markerattrs=(symbol=circlefilled color=black) legendlabel="2015";*/
/*	scatter x=rate2016_tot y=Bohf / markerattrs=(symbol=trianglefilled color=black)legendlabel="2016";*/
/*	Highlow Y=Bohf low=min high=max / type=line name="hl2" lineattrs=(color=black thickness=1 pattern=1);*/
/*	inset (*/
/*                "(*ESC*){unicode'25a0'x}"="   2014"  */
/*                "(*ESC*){unicode'25cf'x}"="   2015"*/
/*                "(*ESC*){unicode'25b2'x}"="   2016")*/
/*	/ position=bottomright textattrs=(size=7);*/

	keylegend "hp3" "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	 Yaxistable &tabellvar1 &tabellvar2 &tabellvar3 /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 &skala valueattrs=(size=7) label="&xlabel" labelattrs=(size=7 weight=bold);
		Label &labeltabell;
		Format AndelLap nlpct8.1;

run;
Title; 
ods listing close;