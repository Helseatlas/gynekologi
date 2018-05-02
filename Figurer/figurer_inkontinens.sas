
/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=inkontinens_d;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner for urininkontinens per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Polikliniske konsultasjoner for urininkontinens, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);




/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=inkontinens_dp;
%let rv1=&tema;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for urininkontinens per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Inngrep for urininkontinens, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf);