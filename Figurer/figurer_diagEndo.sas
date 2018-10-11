

/***************************************************/
/* Lag figur todelt LCA10/LCA06                */
/***************************************************/

%let tema=diagEndo;

%let dsn1=&tema.B_p_poli_bohf;
%let rv1=&tema.B_p_poli;


%let dsn2=&tema.U_p_tot_bohf;
%let rv2=&tema.U_p_tot;

%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=BiopsiAbrasio;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og fraksjonert utskraping per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med endometriebiopsi og fraksjonert utskraping, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Endometriebiopsi;
%let label_2=Fraksjonert utskraping;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Biopsi" &tabellvar2="Utskraping";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

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
/* Lag figur todelt endombiopsi off/priv                */
/***************************************************/

%let tema=diagEndoB_p;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;


%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med endometriebiopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Offentlig" &tabellvar2="Privat";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

/***************************************************/
/* Lag figur utskraping                 */
/***************************************************/


%let tema=diagEndoU_p;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep med fraksjonert utskraping per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep med fraksjonert utskraping, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&rv1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&rv1._bohf);
