


/***************************************************************/
/* Lag tredelt figur for teknikker - åpen, lapraskopi, vaginal */
/***************************************************************/

%let fignavn=kir_metode; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let anno=ANNO;
%let tema=Hyster_alv;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
*%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
*%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar2=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2;
%let label_1=Open;
%let label_2=Lap;
%let label_3=Vag;
%let labeltabell=&tabellvar1="Open" &tabellvar2="Proc.";
%let formattabell=;

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=Hyster_Aapen_dp_tot, del2=Hyster_Lap_dp_tot, del3=Hyster_Vaginal_dp_tot, sprak=en);

%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=Hyster_Aapen_dp_tot, del2=Hyster_Lap_dp_tot, del3=Hyster_Vaginal_dp_tot, bildeformat=pdf, sprak=en);


/*FIGUR MED ANDEL FRA 0 TIL 100, delt på: åpen, lap, vag*/

%let tema=Hyster;

%let dsn1=&tema._Aapen_dp_tot_bohf;
%let rv1=&tema._Aapen_dp_tot;
%let label_1=Open;

%let dsn2=&tema._Lap_dp_tot_bohf;
%let rv2=&tema._Lap_dp_tot;
%let label_12=Laparoscopic;

%let dsn3=&tema._Vaginal_dp_tot_bohf;
%let rv3=&tema._Vaginal_dp_tot;
%let label_alle=Vaginal;

%let fignavn=alv;
%let type=inngr;
%let xlabel=Proportion;
*%let tabellvar1=tot_antall;
*%let tabellvar2=;
%let tabellvariable=;
%let labeltabell=;
%let formattabell=;
%let plass_scat=0.05;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=3, text_a1=Open,sprak=en);


%let mappe=&mappe_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=Open, bildeformat=pdf ,sprak=en);


/*************************************************/
/* Lag panel figur for å se på  trend i perioden */
/*************************************************/

%let tema=Hyster;

%let teknikk=_Aapen;
%Let aksetekst=Number per 10,000 women;
%let mappe=&mappe_png;
%panelfig;

%let teknikk=_Lap;
%Let aksetekst=Number per 10,000 women;
%let mappe=&mappe_png;
%panelfig;

%let teknikk=_vaginal;
%Let aksetekst=Number per 10,000 women;
%let mappe=&mappe_png;
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



/*PNG*/

%let mappe=&mappe_png;

ODS Graphics ON /reset=All imagename="Panel_&tema._andel_Aapen" imagefmt=png border=off;* width=7in height=3in;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
/*title "&tema &niva";*/
proc sgpanel data=panel_andel_aapen noautolegend sganno=&anno pad=(Bottom=5%);
PANELBY bohf / columns=7 rows=3 novarname spacing=2 HEADERATTRS=(Color=black Family=Arial Size=7);
series x=aar y=nandel_aapen /lineattrs=(color=darkgrey pattern=2) name="norge" legendlabel="Norway";
scatter X = aar Y = andel_aapen / filledoutlinedmarkers markerfillattrs=(color=black) markeroutlineattrs=(color=black)
   markerattrs=(symbol=circlefilled);
keylegend "Norway" / noborder position=top;
colaxis label='Year' valueattrs=(size=5) labelattrs=(size=8 weight=bold);
rowaxis label="Proportion" valueattrs=(size=6) labelattrs=(size=8 weight=bold);
RUN; ods listing close;

/*PDF*/

%let mappe=&mappe_pdf;

ODS Graphics ON /reset=All imagename="Panel_&tema._andel_Aapen" imagefmt=pdf border=off;* width=7in height=3in;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
/*title "&tema &niva";*/
proc sgpanel data=panel_andel_aapen noautolegend sganno=&anno pad=(Bottom=5%);
PANELBY bohf / columns=7 rows=3 novarname spacing=2 HEADERATTRS=(Color=black Family=Arial Size=7);
series x=aar y=nandel_aapen /lineattrs=(color=darkgrey pattern=2) name="norge" legendlabel="Norway";
scatter X = aar Y = andel_aapen / filledoutlinedmarkers markerfillattrs=(color=black) markeroutlineattrs=(color=black)
   markerattrs=(symbol=circlefilled);
keylegend "Norway" / noborder position=top;
colaxis label='Year' valueattrs=(size=5) labelattrs=(size=8 weight=bold);
rowaxis label="Proportion" valueattrs=(size=6) labelattrs=(size=8 weight=bold);
RUN; ods listing close;


/*********************************************************/
/* Lag tredelt figur for tilstandskoder (diagnosegruppe) */
/*********************************************************/

%let fignavn=diag; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let anno=ANNO;
%let tema=Hyster;
%let tabellvar1=Andel&del2.;/*fra forbruksmal*/
*%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
*%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar2=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2;
%let label_1=D25;
%let label_2=N92;
%let label_3=Other;
%let labeltabell=&tabellvar1="N92" &tabellvar2="Proc.";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=Hyster_myom_dp_tot, del2=Hyster_blod_dp_tot, del3=Hyster_annen_dp_tot, sprak=en);

%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=Hyster_myom_dp_tot, del2=Hyster_blod_dp_tot, del3=Hyster_annen_dp_tot, bildeformat=pdf , sprak=en);


/*FIGUR MED ANDEL FRA 0 TIL 100, delt på: tilstandskoder*/

%let tema=Hyster;

%let dsn1=&tema._blod_dp_tot_bohf;
%let rv1=&tema._blod_dp_tot;
%let label_1=N92;

%let dsn2=&tema._myom_dp_tot_bohf;
%let rv2=&tema._myom_dp_tot;
%let label_12=D25;

%let dsn3=&tema._annen_dp_tot_bohf;
%let rv3=&tema._annen_dp_tot;
%let label_alle=Other;

%let fignavn=diag;
%let type=inngr;
%let xlabel=Proportion;
%let tabellvar1=tot_antall;
%let tabellvar2=;
%let tabellvariable=&tabellvar1;
%let labeltabell=&tabellvar1="Proc.";
%let formattabell=&tabellvar1 comma8.0;
%let plass_scat=0.05;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=3, text_a1=N92, sprak=en);


%let mappe=&mappe_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=N92, bildeformat=pdf, sprak=en);



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
%let xlabel=Proportion;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Robotass." &tabellvar2="Lap. hysterektomier";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._Arobot_bohf, sprak = en);


%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._Arobot_bohf, bildeformat=pdf, sprak = en);



%Let nkrav=15;
%let vis_misstxt=0;

/* Lager datasett for Instant Atlas */
%Let beskrivelse=hyster_rate;
data helseatl.IA_gyn_&beskrivelse;
  set Hyster_alv_bohf (keep = bohf Ratesnitt_tot tot_antall innbyggere rename=(Ratesnitt_tot=Rate tot_antall=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 3;
Niva = 14;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/* Lager datasett for Instant Atlas */
%Let beskrivelse=hyster_andelA;
data helseatl.IA_gyn_&beskrivelse;
  set Hyster_alv_bohf (keep = bohf AndelHyster_Aapen_dp_tot Hyster_Aapen_dp_tot tot_antall rename=(AndelHyster_Aapen_dp_tot=Andel Hyster_Aapen_dp_tot=Antall tot_antall=innbyggere)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 3;
Niva = 15;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;
