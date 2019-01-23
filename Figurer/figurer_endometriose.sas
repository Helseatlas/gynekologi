/***************************************************/
/* Lag figur inngrep, todelt hysterektomi/andre                 */
/***************************************************/

%let tema=endometriose;

%let dsn1=&tema._dp_tot_bohf;
%let rv1=&tema._dp_tot;

%let dsn2=&tema._h_dp_tot_bohf;
%let rv2=&tema._h_dp_tot;


%merge(ant_datasett=2, dsn_ut=&tema._bohf);


%let fignavn=andelhyst;
%let type=inngr;
%let tittel=Antall inngrep for endometriose per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let label_1=Andre inngrep;
%let label_2=Hysterektomi;
%let tabellvar1=tot_antall;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep";* &tabellvar2="Hyst." ;
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf, bildeformat=pdf );



/*FIGUR MED ANDEL FRA 0 TIL 100, delt på: åpen, lap, vag*/

%let tema=Endometriose;

%let dsn1=&tema._a_dp_tot_bohf;
%let rv1=&tema._a_dp_tot;
%let label_1=Åpne;

%let dsn2=&tema._l_dp_tot_bohf;
%let rv2=&tema._l_dp_tot;
%let label_12=Laparaskopiske;

%let dsn3=&tema._v_dp_tot_bohf;
%let rv3=&tema._v_dp_tot;
%let label_alle=Vaginale;

%let fignavn=alv;
%let type=inngr;
%let xlabel=Andel;
%let tabellvar1=tot_antall;
%let tabellvar2=;
%let tabellvariable=;*&tabellvar1;
%let labeltabell=&tabellvar1="Inngrep";
%let formattabell=&tabellvar1 NLnum8.0;
%let plass_scat=0.33;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=3, text_a1=Åpne);


%let mappe=&mappe_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=Åpne, bildeformat=pdf );


/* Lager datasett for Instant Atlas */
%Let beskrivelse=endom_rate;
data helseatl.IA_gyn_&beskrivelse;
  set endometriose_bohf (keep = bohf tot_rate tot_antall innbyggere rename=(tot_rate=Rate tot_antall=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 3;
Niva = 11;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

