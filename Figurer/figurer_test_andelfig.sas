

%let tema=steril_p;



/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf, sprak = en);

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
%let xlabel= Number per 10,000 women.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._Ainn_bohf, sprak = en);


/*FIGUR: Todelt, andel åpne*/

%let tema=steril;

%let dsn1=&tema._a_p_tot_bohf;
%let rv1=&tema._a_p_tot;

%let dsn2=&tema._ia_p_tot_bohf;
%let rv2=&tema._ia_p_tot;
%merge(ant_datasett=2, dsn_ut=&tema._a_bohf); 

%let fignavn=a; 
%let type=inngr;   
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let label_1=Åpne;
%let label_2=Lap./Vag.;
%let tabellvariable= &tabellvar1 &tabellvar2 ;
%let labeltabell=&tabellvar1="Åpne" &tabellvar2="Lap./Vag." ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._a_bohf, sprak = en);


