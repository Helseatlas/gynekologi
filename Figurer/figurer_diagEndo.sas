

/***************************************************/
/* Lag figur todelt LCA10/LCA06                */
/***************************************************/

%let tema=diagEndo;


%let dsn1=&tema.B_p_bohf;
%let rv1=&tema.B_p;

%let dsn2=&tema.U_p_bohf;
%let rv2=&tema.U_p;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=BiopsiAbrasio;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og fraksjonert utskraping per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Polikliniske undersøkelser med endometriebiopsi og fraksjonert utskraping, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let label_1=Endometriebiopsi;
%let label_2=Fraksjonert utskraping;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Totalt" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

