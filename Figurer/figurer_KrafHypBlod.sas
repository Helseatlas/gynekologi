



/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=KrafHypBlod_dp;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf, sprak = en);


/***************************************************************/
/* Lag tredelt figur for hyst, utskr/destr, andre */
/***************************************************************/
%let tema=KrafHypBlod;

/*INPUT FOR HVER FIGUR:*/
%let fignavn=type; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let anno=ANNO;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del3.;/*fra forbruksmal*/
*%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar3=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=ER/EA;
%let label_2=Other;
%let label_3=Hysterectomy;
%let labeltabell=&tabellvar1="ER/EA" &tabellvar2="Hyst." &tabellvar3="Proc.";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=KHB_d_dp_tot, del2=KHB_dp_tot, del3=KHB_h_dp_tot);

%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=KHB_d_dp_tot, del2=KHB_dp_tot, del3=KHB_h_dp_tot, bildeformat=pdf );


/*FIGUR MED ANDEL FRA 0 TIL 100*/

%let tema=KHB;

%let dsn1=&tema._apen_dp_tot_bohf;
%let rv1=&tema._apen_dp_tot;
%let label_1=Open;

%let dsn2=&tema._Lap_dp_tot_bohf;
%let rv2=&tema._Lap_dp_tot;
%let label_12=Laparoscopic;

%let dsn3=&tema._Vag_dp_tot_bohf;
%let rv3=&tema._Vag_dp_tot;
%let label_alle=Vaginal;

%let fignavn=alv;
%let type=inngr;
%let xlabel=Proportion;
%let tabellvar1=tot_antall;
%let tabellvar2=;
%let tabellvariable=;*&tabellvar1;
%let labeltabell=;*&tabellvar1="Proc.";
%let formattabell=&tabellvar1 comma8.0;
%let plass_scat=0.5;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=3, text_a1=Open, sprak = en);

%let mappe=&mappe_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=Open, bildeformat=pdf, sprak = en);





/* Lager datasett for Instant Atlas */
%Let beskrivelse=KrafHyp_rate;
data helseatl.IA_gyn_&beskrivelse;
  set KrafHypBlod_bohf (keep = bohf Ratesnitt_tot tot_antall innbyggere rename=(Ratesnitt_tot=Rate tot_antall=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 3;
Niva = 13;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;



/***************************************************/
/* Lag figur inngrep todelt overlapp KHB                 */
/***************************************************/

/*%let tema=Overlapp2;


%let dsn1=KunKHB_dp_tot_bohf;
%let rv1=KunKHB_dp_tot;

%let dsn2=MyomKHB_dp_tot_bohf;
%let rv2=MyomKHB_dp_tot;
%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let fignavn=overlapp2;
%let type=inngr;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for kraftig og/eller hyppig menstruasjon, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Kun KHB;
%let label_2=Myom og KHB;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);*/

/***************************************************/
/* Lag figur inngrep kun KHB               */
/***************************************************/


/*%let tema=KunKHB_dp;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for KUN kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for KUN kraftig og/eller hyppig menstruasjon, per 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);*/

/***************************************************/
/* Lag figur inngrep todelt overlapp KHB                 */
/***************************************************/

/*%let tema=Overlapp3;


%let dsn1=KrafHypBlod_dp_tot_bohf;
%let rv1=KrafHypBlod_dp_tot;

%let dsn2=KunMyom_dp_tot_bohf;
%let rv2=KunMyom_dp_tot;
%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let fignavn=overlapp3;
%let type=inngr;
%let tittel=Antall inngrep for KHB og myom per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for KHB og myom, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=KHB inkl overlapp;
%let label_2=Kun myom;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);*/