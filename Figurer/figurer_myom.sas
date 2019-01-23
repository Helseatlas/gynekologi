

/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=myom;

%let dsn1=&tema._dp_tot_bohf;
%let rv1=&tema._dp_tot;

%let dsn2=&tema._h_dp_tot_bohf;
%let rv2=&tema._h_dp_tot;

%let dsn3=&tema._dp_tot_unik_bohf;
%let rv3=&tema._dp_tot_unik;

%let dsn4=&tema._h_dp_tot_unik_bohf;
%let rv4=&tema._h_dp_tot_unik;

%merge(ant_datasett=4, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
pas_rate=rate_3+rate_4;
pas_antall=antall_3+antall_4;
i_pr_pas=tot_rate/pas_rate;
run;


%let fignavn=andelhyst;
%let type=inngr;
%let tittel=Antall inngrep for myom i livmor per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let label_1=Andre inngrep;
%let label_2=Hysterektomi;
%let tabellvar1=tot_antall;
*%let tabellvar2=pas_antall;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep";* &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf, bildeformat=pdf );


/*FIGUR MED ANDEL FRA 0 TIL 100*/

%let tema=myom;

%let dsn1=&tema._apen_dp_tot_bohf;
%let rv1=&tema._apen_dp_tot;
%let label_1=Åpne;

%let dsn2=&tema._Lap_dp_tot_bohf;
%let rv2=&tema._Lap_dp_tot;
%let label_12=Laparaskopiske;

%let dsn3=&tema._Vag_dp_tot_bohf;
%let rv3=&tema._Vag_dp_tot;
%let label_alle=Vaginale;

%let fignavn=alv;
%let type=inngr;
%let xlabel=Andel;
%let tabellvar1=tot_antall;
%let tabellvar2=;
%let tabellvariable=;*&tabellvar1;
%let labeltabell=&tabellvar1="Inngrep";
%let formattabell=&tabellvar1 NLnum8.0;
%let plass_scat=0.05;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=3, text_a1=Åpne);

%let mappe=&mappe_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=Åpne, bildeformat=pdf );



/* Lager datasett for Instant Atlas */
%Let beskrivelse=myom_rate;
data helseatl.IA_gyn_&beskrivelse;
  set myom_bohf (keep = bohf tot_rate tot_antall innbyggere rename=(tot_rate=Rate tot_antall=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 3;
Niva = 12;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/***************************************************/
/* Lag figur inngrep todelt overlapp KHB                 */
/***************************************************/

/*%let tema=Overlapp;


%let dsn1=KunMyom_dp_tot_bohf;
%let rv1=KunMyom_dp_tot;

%let dsn2=MyomKHB_dp_tot_bohf;
%let rv2=MyomKHB_dp_tot;
%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let fignavn=overlapp;
%let type=inngr;
%let tittel=Antall inngrep for myom i livmor per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for myom i livmor, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Kun Myom;
%let label_2=Myom og KHB;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);*/

/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


/*%let tema=KunMyom_dp;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for KUN myom i livmor per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for KUN myom i livmor, per 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);*/
