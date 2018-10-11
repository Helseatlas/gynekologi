

%let tema=steril_p;



/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for sterilisering, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);

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
%let tittel=Innleggelser som andel av alle inngrep ved inngrep for sterilisering. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Innleggelser som andel av alle inngrep ved inngrep for sterilisering. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);

/*FIGUR: Todelt, andel ifm keisersnitt*/

%let tema=steril;

%let dsn1=&tema._ks_p_tot_bohf;
%let rv1=&tema._ks_p_tot;

%let dsn2=&tema._iks_p_tot_bohf;
%let rv2=&tema._iks_p_tot;
%merge(ant_datasett=2, dsn_ut=&tema._ks_bohf); 

%let fignavn=ks; 
%let type=inngr;   
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for sterilisering, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let label_1=Ifm. KS;
%let label_2=Andre;
%let tabellvariable= &tabellvar1 &tabellvar2 ;
%let labeltabell=&tabellvar1="Ifm. KS" &tabellvar2="Andre" ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%ratefig_todeltSoyle(datasett=&tema._ks_bohf);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_todeltSoyle(datasett=&tema._ks_bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;