

/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=SpontanAbort_dp;
%let rv1=&tema;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep etter spontanabort per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Inngrep etter spontanabort, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf);