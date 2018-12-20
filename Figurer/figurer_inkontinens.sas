
/************************************************************************************/
/* Lag figur konsultasjoner todelt e. type inkontinens: stress/annen                 */
/************************************************************************************/

%let tema=inkontinens_dp;

%let dsn1=S_&tema._tot_bohf;
%let rv1=S_&tema._tot;

%let dsn2=A_&tema._tot_bohf;
%let rv2=A_&tema._tot;
%merge(ant_datasett=2, dsn_ut=&tema._SA_bohf); 

%let fignavn=SA;
%let type=inngr;
%let tittel=Antall inngrep for urininkontinens per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Antall pr. 10 000 kvinner;
%let label_1=Stress;
%let label_2=Annen;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Stress" &tabellvar2="Annen";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._SA_bohf);

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

%let tema=inkontinens_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._tot_unik_bohf;
%let rv2=&tema._tot_unik;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for urininkontinens per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=antall_1;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep";* &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf );


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


/*%let tema=inkontinens_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep for urininkontinens. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._Ainn_bohf);*/

/***************************************************/
/* Lag figur liggetid pr inngrep                 */
/***************************************************/


/*%let tema=inkontinens_dp;

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
%let tittel=Liggetid per inngrep, kirurgisk behandling for urininkontinens. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Liggetid per inngrep, urininkontinens. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Liggedøgn";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
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


/* Lager datasett for Instant Atlas */
%Let beskrivelse=Inkont_rate;
data helseatl.IA_gyn_&beskrivelse;
  set inkontinens_dp_bohf (keep = bohf RateSnitt antall_1 innbyggere rename=(rateSnitt=Rate antall_1=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 4;
Niva = 17;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "to";
run;