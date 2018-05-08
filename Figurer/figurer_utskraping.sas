


/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=utskraping_p;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep med fraksjonert utskrapning per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2014-16.;
%let xlabel= Inngrep med fraksjonert utskrapning, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&rv1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&rv1._bohf);