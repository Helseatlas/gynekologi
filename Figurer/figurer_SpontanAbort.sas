

/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=SpontanAbort_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._tot_unik_bohf;
%let rv2=&tema._tot_unik;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 


%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep etter spontanabort per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep etter spontanabort, pr. 10 000 innbyggere. Aldersjusterte rater.;
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

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep ved inngrep etter spontanabort. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Innleggelser som andel av alle inngrep ved inngrep etter spontanabort. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);