
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
%let tittel=Antall inngrep for urininkontinens per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2014-16.;
%let xlabel= Number per 10,000 women;
%let label_1=Stress;
%let label_2=Other;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Stress" &tabellvar2="Other";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._SA_bohf, sprak = en);



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
%let tittel=Antall inngrep for urininkontinens per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=antall_1;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Proc.";* &tabellvar2="Patients";
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf, sprak = en);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf, sprak = en);



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