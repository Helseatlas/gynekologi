

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

/*%let tema=endometriose_d;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%let dsn3=&tema._poli_unik_bohf;
%let rv3=&tema._poli_unik;


%merge(ant_datasett=3, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=tot_rate/rate_3;			
run;

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner for endometriose per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner for endometriose, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvar3=kons_pr_pers;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Personer" &tabellvar3="Kons./Person";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);*/

/*Lager rankingtabell*/
/*proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;*/

/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=endometriose;

%let dsn1=&tema._dp_tot_bohf;
%let rv1=&tema._dp_tot;

%let dsn2=&tema._h_dp_tot_bohf;
%let rv2=&tema._h_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._bohf);


%let fignavn=andelhyst;
%let type=inngr;
%let tittel=Antall inngrep for endometriose per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Inngrep for endometriose, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Andre inngrep;
%let label_2=Hysterektomi;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvar3=andel_rate2;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner" &tabellvar3="Andel hyst.";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLpct8.1;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

/*Lager rankingtabell*/
/*proc sort data=&tema._tot_bohf;
by decending rateSnitt;
run;

data rank_&tema;
set &tema._tot_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;*/

/***************************************************/
/* Lag figur andel innlagte, inngrep                 */
/***************************************************/


%let tema=endometriose_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep ved mindre inngrep for endometriose. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Innleggelser som andel av alle inngrep ved mindre inngrep for endometriose. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);

/***************************************************************/
/* Lag tredelt figur for teknikker - �pen, lapraskopi, hysterektomi */
/***************************************************************/



/*INPUT FOR HVER FIGUR:*/
%let fignavn=lap_aapen_hyst; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or unders�kelser;
%let tittel=Antall inngrep for endometriose per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Inngrep for endometriose, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tema=endometriose;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=Lap;
%let label_2=�pen;
%let label_3=Hyst;
%let labeltabell=&tabellvar1="Lap" &tabellvar2="�pen" &tabellvar3="Hyst";

%ratefig_tredeltSoyle(del1=endometriose_l_dp_tot, del2=endometriose_a_dp_tot, del3=endometriose_h_dp_tot);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_tredeltSoyle(del1=endometriose_l_dp_tot, del2=endometriose_a_dp_tot, del3=endometriose_h_dp_tot, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

/***************************************************/
/* Lag figur liggetid pr inngrep                 */
/***************************************************/


/*%let tema=endometriose_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._liggetid_bohf;
%let rv2=&tema._liggetid;
%merge(ant_datasett=2, dsn_ut=&tema._LT_bohf); 

data &tema._LT_bohf;
set &tema._LT_bohf;
ratesnitt2=andel_2_1;
snittrate=nrate_2/nrate_1;
run;

%let vis_aarsvar=0;
%let vis_ft=0;

%let fignavn=LT_pr_inngr;
%let type=inngr;
%let tittel=Liggetid per inngrep, kirurgisk behandling for endometriose. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Liggetid per inngrep, endometriose. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._LT_bohf);
%let vis_aarsvar=1;
%let vis_ft=1;*/

/*Lager rankingtabell*/
/*proc sort data=&tema._LT_bohf;
by decending rateSnitt2;
run;

data rank_&tema._LT;
set &tema._LT_bohf;
where BoHF ne 8888;
&tema._rank_LT+1;
keep &tema._rank_LT BoHF;
run;*/