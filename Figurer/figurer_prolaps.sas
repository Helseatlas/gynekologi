

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

/*%let tema=prolaps_d;


%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner for genitalt prolaps per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner for genitalt prolaps, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
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


%let tema=prolaps_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._tot_unik_bohf;
%let rv2=&tema._tot_unik;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for genitalt prolaps per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for genitalt prolaps, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

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


%let tema=prolaps_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep for genitalt prolaps. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Innleggelser som andel av alle inngrep for genitalt prolaps. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);

/***************************************************/
/* Lag figur liggetid pr inngrep                 */
/***************************************************/


/*%let tema=prolaps_dp;

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
%let tittel=Liggetid per inngrep, kirurgisk behandling for genitalt prolaps. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Liggetid per inngrep, genitalt prolaps. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Liggedøgn";
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

/***************************************************/
/* Lag figur inngrep todelt dag/døgn                 */
/***************************************************/

/*%let tema=prolaps_dp;


%let dsn1=&tema._poli_bohf;
%let rv1=&tema._poli;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._dagdogn_bohf);

%let fignavn=dagdogn;
%let type=inngr;
%let tittel=Antall inngrep for genitalt prolaps per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for genitalt prolaps, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Dagkirurgi;
%let label_2=Innleggelser;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Dagkir." &tabellvar2="Innlegg.";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._dagdogn_bohf);*/
