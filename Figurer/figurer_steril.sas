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
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let label_1=Åpne;
%let label_2=Lap./Vag.;
%let tabellvariable= &tabellvar1 &tabellvar2 ;
%let labeltabell=&tabellvar1="Åpne" &tabellvar2="Lap." ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._a_bohf);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._a_bohf, bildeformat=pdf );








/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=steril;

%let dsn1=&tema._p_tot_bohf;
%let rv1=&tema._p_tot;

%let dsn2=&tema._a_p_tot_bohf;
%let rv2=&tema._a_p_tot;

%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

data &tema._bohf;
set &tema._bohf;
/*Setter andel åpne lik missing for N<nkrav*/
if antall_1 lt &nkrav then andel_2_1=.;
run;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=&tema._p_tot;
%let tabellvar2=andel_2_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Andel åpne";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLpct8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf );


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


/*%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep ved inngrep for sterilisering. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);*/




/* Lager datasett for Instant Atlas */
%Let beskrivelse=steril_rate;
data helseatl.IA_gyn_&beskrivelse;
  set steril_p_tot_bohf (keep = bohf ratesnitt steril_p_tot innbyggere rename=(ratesnitt=Rate steril_p_tot=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva = 7;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;
