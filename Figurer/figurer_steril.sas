/*FIGUR: Todelt, andel �pne*/

%let tema=steril;

%let dsn1=&tema._a_p_tot_bohf;
%let rv1=&tema._a_p_tot;

%let dsn2=&tema._ia_p_tot_bohf;
%let rv2=&tema._ia_p_tot;
%merge(ant_datasett=2, dsn_ut=&tema._a_bohf); 

%let fignavn=a; 
%let type=inngr;   
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let label_1=Open;
%let label_2=Lap./Vag.;
%let tabellvariable= &tabellvar1 &tabellvar2 ;
%let labeltabell=&tabellvar1="Open" &tabellvar2="Lap." ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._a_bohf, sprak = en);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._a_bohf, bildeformat=pdf, sprak = en);








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
/*Setter andel �pne lik missing for N<nkrav*/
if antall_1 lt &nkrav then andel_2_1=.;
run;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for sterilisering per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=&tema._p_tot;
%let tabellvar2=andel_2_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Prop. open";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 percent8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf, sprak = en);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf, sprak = en);



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
