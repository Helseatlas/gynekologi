

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=spiral_p;


%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner med innsetting av spiral per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Polikliniske konsultasjoner med innsetting av spiral, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

/*Lager rankingtabell*/
proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;



/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

/**/
/*%let tema=spiral_p;*/
/*%let rv1=&tema;*/
/**/
/*%let fignavn=;*/
/*%let type=inngr;*/
/*%let tittel=Antall inngrep for spiral per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;*/
/*%let xlabel= Inngrep for spiral, pr. 100 000 innbyggere. Aldersjusterte rater.;*/
/*%let tabellvar1=&tema;*/
/*%let tabellvar2=Innbyggere;*/
/*%let tabellvariable= &tabellvar1 &tabellvar2;*/
/*%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innbyggere";*/
/*%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;*/
/*%let skala=;*/
/**/
/*%ratefig(datasett=&tema._bohf);*/