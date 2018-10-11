%let tema=Hyster;


/***************************************************************/
/* Lag tredelt figur for teknikker - åpen, lapraskopi, vaginal */
/***************************************************************/
/*INPUT FOR HVER FIGUR:*/
%let fignavn=kir_metode; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Hysterektomi, ikke-kreft, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tema=Hyster;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=Åpen;
%let label_2=Lap;
%let label_3=Vag;
%let labeltabell=&tabellvar1="Åpen" &tabellvar2="Lap" &tabellvar3="Vag";

%ratefig_tredeltSoyle(del1=Hyster_Aapen_dp_tot, del2=Hyster_Lap_dp_tot, del3=Hyster_Vaginal_dp_tot);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_tredeltSoyle(del1=Hyster_Aapen_dp_tot, del2=Hyster_Lap_dp_tot, del3=Hyster_Vaginal_dp_tot, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

/*************************************************/
/* Lag panel figur for å se på  trend i perioden */
/*************************************************/

%let tema=Hyster;

%let teknikk=_Aapen;
%Let aksetekst=Antall hysterektomier åpen inngrep per 10 000 innbyggere;
%panelfig;

%let teknikk=_Lap;
%Let aksetekst=Antall hysterektomier lapraskopi inngrep per 10 000 innbyggere;
%panelfig;

%let teknikk=_vaginal;
%Let aksetekst=Antall hysterektomier vaginal inngrep per 10 000 innbyggere;
%panelfig;

data panel_hyster_aapen;
set panel_hyster_aapen;
rate_aapen=RV_just_rate;
nrate_aapen=Nrate;
run;

proc sort data=panel_hyster_aapen;
by aar bohf;
run;

data panel_hyster_lap;
set panel_hyster_lap;
rate_lap=RV_just_rate;
nrate_lap=Nrate;
run;

proc sort data=panel_hyster_lap;
by aar bohf;
run;

data panel_hyster_vaginal;
set panel_hyster_vaginal;
rate_vaginal=RV_just_rate;
nrate_vaginal=Nrate;
run;

proc sort data=panel_hyster_vaginal;
by aar bohf;
run;

data panel_andel_aapen;
merge panel_hyster_aapen panel_hyster_lap panel_hyster_vaginal;
by aar bohf;

rate_total=rate_aapen+rate_vaginal+rate_lap;
nrate_total=nrate_aapen+nrate_vaginal+nrate_lap;

andel_aapen=rate_aapen/rate_total;
nandel_aapen=nrate_aapen/nrate_total;

run;

/*data panel_andel_aapen;
 set panel_andel_aapen;
  format bohf bohf_kort_dagkir.;
run;*/


/*PNG*/

ODS Graphics ON /reset=All imagename="Panel_&tema._andel_Aapen" imagefmt=png border=off;* width=7in height=3in;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
/*title "&tema &niva";*/
proc sgpanel data=panel_andel_aapen noautolegend sganno=&anno pad=(Bottom=5%);
PANELBY bohf / columns=7 rows=3 novarname spacing=2 HEADERATTRS=(Color=black Family=Arial Size=7);
series x=aar y=nandel_aapen /lineattrs=(color=darkgrey pattern=2) name="norge" legendlabel="Norge";
scatter X = aar Y = andel_aapen / filledoutlinedmarkers markerfillattrs=(color=black) markeroutlineattrs=(color=black)
   markerattrs=(symbol=circlefilled);
keylegend "Norge" / noborder position=top;
colaxis label='År' valueattrs=(size=5) labelattrs=(size=8 weight=bold);
rowaxis label="Andel åpne hysterektomier" valueattrs=(size=6) labelattrs=(size=8 weight=bold);
RUN; ods listing close;

/*PDF*/

%let mappe=Figurer\NPR\fig_pdf;

ODS Graphics ON /reset=All imagename="Panel_&tema._andel_Aapen" imagefmt=pdf border=off;* width=7in height=3in;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
/*title "&tema &niva";*/
proc sgpanel data=panel_andel_aapen noautolegend sganno=&anno pad=(Bottom=5%);
PANELBY bohf / columns=7 rows=3 novarname spacing=2 HEADERATTRS=(Color=black Family=Arial Size=7);
series x=aar y=nandel_aapen /lineattrs=(color=darkgrey pattern=2) name="norge" legendlabel="Norge";
scatter X = aar Y = andel_aapen / filledoutlinedmarkers markerfillattrs=(color=black) markeroutlineattrs=(color=black)
   markerattrs=(symbol=circlefilled);
keylegend "Norge" / noborder position=top;
colaxis label='År' valueattrs=(size=5) labelattrs=(size=8 weight=bold);
rowaxis label="Andel åpne hysterektomier" valueattrs=(size=6) labelattrs=(size=8 weight=bold);
RUN; ods listing close;

%let mappe=Figurer\NPR;

/*
%let tema=Hysterektomi;
%let teknikk=;
%Let aksetekst=Antall total hysterektomier inngrep per 10 000 innbyggere;
%panelfig;
*/

/*********************************************************/
/* Lag tredelt figur for tilstandskoder (diagnosegruppe) */
/*********************************************************/

/*INPUT FOR HVER FIGUR:*/
%let fignavn=diag; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Hysterektomi, diagnosegrupper, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tema=Hyster;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=Myom;
%let label_2=Blod;
%let label_3=Annen;
%let labeltabell=&tabellvar1="Myom" &tabellvar2="Blod" &tabellvar3="Annen";

%ratefig_tredeltSoyle(del1=Hyster_myom_dp_tot, del2=Hyster_blod_dp_tot, del3=Hyster_annen_dp_tot);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_tredeltSoyle(del1=Hyster_myom_dp_tot, del2=Hyster_blod_dp_tot, del3=Hyster_annen_dp_tot, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;


/***************************************************/
/* Lag figur andel innlagte, inngrep               */
/***************************************************/


%let tema=hysterektomi_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle hysterektomier. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Innleggelser som andel av alle hysterektomier. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);


/*********************************************************/
/* Lag todelt figur for robot assist                    */
/*********************************************************/


%let tema=hyster;

%let dsn1=&tema._robot_dp_tot_bohf;
%let rv1=&tema._robot_dp_tot;

%let dsn2=&tema._ikkerobot_dp_tot_bohf;
%let rv2=&tema._ikkerobot_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._robot_bohf); 



/*INPUT FOR HVER FIGUR:*/

%let fignavn=robot_ass; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Hysterektomi, robot assistert, pr. 10 000 innbyggere. Aldersjusterte rater.;

* variables to use, and column and label names for the table on the right of the figure;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=Innbyggere;
%let label_2=ikke robot;
%let label_1=robot assistert ;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="robot" &tabellvar2="ikke robot" &tabellvar3="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%ratefig_todeltSoyle(datasett=&tema._robot_bohf);


/*********************************************************/
/* Andelsfig robot assist                    */
/*********************************************************/

%let tema=hyster;

%let dsn1=&tema._robot_dp_tot_bohf;
%let rv1=&tema._robot_dp_tot;

%let dsn2=&tema._Lap_dp_tot_bohf;
%let rv2=&tema._Lap_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._Arobot_bohf); 

%Let nkrav=5;
%let vis_misstxt=1;

data &tema._Arobot_bohf;
set &tema._Arobot_bohf;
%if &vis_misstxt=1 %then %do;
if antall_1<&nkrav then do;
	antall_1=.;
	Misstxt="N<&nkrav";
end;
%end;
run;


%let Andel=andel_1_2;
%let fignavn=robot;
%let type=inngr;
%let tittel=Robotassisterte inngrep som andel av alle laparaskopiske hysterektomier. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Robotassisterte inngrep som andel av alle laparaskopiske hysterektomier. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Robotass." &tabellvar2="Lap. hysterektomier";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Arobot_bohf);


%let mappe=Figurer\NPR\fig_pdf;
%andelsfig(datasett=&tema._Arobot_bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;


%Let nkrav=15;
%let vis_misstxt=0;
