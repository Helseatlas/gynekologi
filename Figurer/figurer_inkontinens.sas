
/************************************************************************************/
/* Lag figur konsultasjoner todelt e. type inkontinens: stress/annen                 */
/************************************************************************************/

%let tema=inkontinens_dp;

%let dsn1=S_&tema._tot_bohf;
%let rv1=S_&tema._tot;

%let dsn2=A_&tema._tot_bohf;
%let rv2=A_&tema._tot;
%merge(ant_datasett=2, dsn_ut=&tema._SA_bohf); 

%let fignavn=SA;
%let type=inngr;
%let tittel=Antall inngrep for urininkontinens per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Antall pr. 10 000 kvinner;
%let label_1=Stress;
%let label_2=Annen;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Stress" &tabellvar2="Annen";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._SA_bohf);



/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=inkontinens_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._tot_unik_bohf;
%let rv2=&tema._tot_unik;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for urininkontinens per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=antall_1;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep";* &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf );



/* Lager datasett for Instant Atlas */
%Let beskrivelse=Inkont_rate;
data helseatl.IA_gyn_&beskrivelse;
  set inkontinens_dp_bohf (keep = bohf RateSnitt antall_1 innbyggere rename=(rateSnitt=Rate antall_1=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 4;
Niva = 18;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "to";
run;