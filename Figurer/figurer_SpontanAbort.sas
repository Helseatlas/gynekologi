

/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=SpontanAbort_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._tot_unik_bohf;
%let rv2=&tema._tot_unik;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 


%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep etter spontanabort per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=antall_1;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Proc.";* &tabellvar2="Patients";
%let formattabell=&tabellvar1 comma8.0 ;*&tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf, sprak = en);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf, sprak = en);


/* Lager datasett for Instant Atlas */
%Let beskrivelse=sponabort_rate;
data helseatl.IA_gyn_&beskrivelse;
  set SpontanAbort_dp_tot_bohf (keep = bohf ratesnitt SpontanAbort_dp_tot innbyggere rename=(ratesnitt=Rate SpontanAbort_dp_tot=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva = 8;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;