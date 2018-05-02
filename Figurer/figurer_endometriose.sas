

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=endometriose_d;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%let dsn3=&tema._pers_bohf;
%let rv3=&tema._pers;


%merge(ant_datasett=3, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=tot_rate/rate_3;			/* (Rate kons off + Rate kons priv) / Rate pers tot*/
run;

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner for endometriose per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Polikliniske konsultasjoner for endometriose, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvar3=kons_pr_pers;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Personer" &tabellvar3="Kons./Person";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

