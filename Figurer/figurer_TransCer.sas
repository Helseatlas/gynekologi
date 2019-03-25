/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=TransCer_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall transcervikale inngrep per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=&tema._tot;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Proc.";* &tabellvar2="Patients";
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf, sprak =en);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._tot_bohf, bildeformat=pdf, sprak =en);
%let mappe=&mappe_png;

/*********************************************************/
/* Lag tredelt figur for tilstandskoder (diagnosegruppe) */
/*********************************************************/

/*INPUT FOR HVER FIGUR:*/
%let fignavn=diag; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall transcervikale inngrep per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let anno=ANNO;
%let tema=TransCer;
%let tabellvar1=Andel&del1.;/*andel N92*/
*%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
*%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar2=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2;
%let label_1=N92;
%let label_2=N84;
%let label_3=Other;
%let labeltabell=&tabellvar1="N92" &tabellvar2="Proc.";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=TC_blod_dp_tot, del2=TC_polypp_dp_tot, del3=TC_annen_dp_tot, sprak =en);

%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=TC_blod_dp_tot, del2=TC_polypp_dp_tot, del3=TC_annen_dp_tot, bildeformat=pdf, sprak =en);
%let mappe=&mappe_png;

/***************************************************/
/* Lag figur inngrep    TransCer + hysterektomi         */
/***************************************************/

%let tema=Hyst_TransCer;

%let dsn1=Hysterektomi_dp_tot_bohf;
%let rv1=Hysterektomi_dp_tot;

%let dsn2=TransCer_dp_tot_bohf;
%let rv2=TransCer_dp_tot;


%merge(ant_datasett=2, dsn_ut=&tema._bohf);


%let fignavn=;
%let type=inngr;
%let tittel=Antall hysterektomier og transcervikale inngrep per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let label_1=Hysterectomy;
%let label_2=Transcervical;
%let tabellvar1=tot_antall;
*%let tabellvar2=pas_antall;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Proc.";* &tabellvar2="Patients";
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf, sprak =en);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf, bildeformat=pdf, sprak =en);

/* Lager datasett for Instant Atlas */
%Let beskrivelse=transcer_rate;
data helseatl.IA_gyn_&beskrivelse;
  set TransCer_dp_tot_bohf (keep = bohf Ratesnitt TransCer_dp_tot innbyggere rename=(Ratesnitt=Rate TransCer_dp_tot=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 3;
Niva = 16;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;
