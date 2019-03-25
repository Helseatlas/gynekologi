
/***************************************************/
/* Lag figur todelt LCA10/LCA06  (utskraping, endometriebiopsi)              */
/***************************************************/

%let tema=diagEndo;

%let dsn1=&tema.B_p_poli_bohf;
%let rv1=&tema.B_p_poli;


%let dsn2=&tema.U_p_tot_bohf;
%let rv2=&tema.U_p_tot;

%merge(ant_datasett=2, dsn_ut=&tema._BU_bohf); 

%let fignavn=BiopsiAbrasio;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og utskrapning per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Number per 10,000 women;
%let label_1=Endometriebiopsi;
%let label_2=Utskrapning;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Biopsi" &tabellvar2="Utskrapning";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._BU_bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._BU_bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );


/***************************************************/
/* Lag figur todelt LCA10/LCA06    under 50            */
/***************************************************/

%let tema=diagEndo;

%let dsn1=&tema.B_p_poli_u50_bohf;
%let rv1=&tema.B_p_poli_u50;


%let dsn2=&tema.U_p_tot_u50_bohf;
%let rv2=&tema.U_p_tot_u50;

%merge(ant_datasett=2, dsn_ut=&tema._BU_u50_bohf); 

%let fignavn=BiopsiAbrasio_u50;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og utskrapning per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let label_1=Endometriebiopsi;
%let label_2=utskrapning;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Biopsi" &tabellvar2="utskrapning";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._BU_u50_bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._BU_u50_bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );


/***************************************************/
/* Lag figur todelt LCA10/LCA06    over 50            */
/***************************************************/

%let tema=diagEndo;

%let dsn1=&tema.B_p_poli_o50_bohf;
%let rv1=&tema.B_p_poli_o50;


%let dsn2=&tema.U_p_tot_o50_bohf;
%let rv2=&tema.U_p_tot_o50;

%merge(ant_datasett=2, dsn_ut=&tema._BU_o50_bohf); 

%let fignavn=BiopsiAbrasio_o50;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og utskrapning per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let label_1=Endometriebiopsi;
%let label_2=utskrapning;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Biopsi" &tabellvar2="utskrapning";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._BU_o50_bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._BU_o50_bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );


/***************************************************/
/* Lag figur todelt LCA10/LCA06    PostmenBlod       */
/***************************************************/

%let tema=PostmenBlod;

%let dsn1=&tema.B_dp_poli_bohf;
%let rv1=&tema.B_dp_poli;


%let dsn2=&tema.U_dp_tot_bohf;
%let rv2=&tema.U_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._BU_pmb_bohf); 

%let fignavn=BiopsiAbrasio;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og utskrapning per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let label_1=Endometriebiopsi;
%let label_2=utskrapning;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Biopsi" &tabellvar2="utskrapning";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._BU_pmb_bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._BU_pmb_bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );


/***************************************************/
/* Lag figur todelt LCA10/LCA06    Premenopausale       */
/***************************************************/

%let tema=diagEndo;

%let dsn1=&tema.B_A_dp_poli_bohf;
%let rv1=&tema.B_A_dp_poli;


%let dsn2=&tema.U_A_dp_tot_bohf;
%let rv2=&tema.U_A_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._BU_A_bohf); 

%let fignavn=BiopsiAbrasio_Premen;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi og utskrapning per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let label_1=Endometriebiopsi;
%let label_2=utskrapning;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Biopsi" &tabellvar2="utskrapning";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._BU_A_bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._BU_A_bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );



/***************************************************/
/* Lag figur todelt endombiopsi off/priv                */
/***************************************************/

%let tema=diagEndoB_p;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;


%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med endometriebiopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let label_1=Publ. hospital;
%let label_2=Priv. practice;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Publ. hosp." &tabellvar2="Priv. pract.";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland);

/***************************************************/
/* Lag figur utskrapning                 */
/***************************************************/


%let tema=diagEndoU_p;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep med fraksjonert utskrapning per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=&rv1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Proc." &tabellvar2="Kvinner";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&rv1._bohf,bohf_format=bohf_kort_Nordland, sprak = en);

/* Lag andelsfigur: andel utskrapisng med N92 som hdiag  */
/***************************************************/

%let tema=diagEndo;

%let dsn1=&tema.U_p_tot_bohf;
%let rv1=&tema.U_p_tot;

%let dsn2=&tema._bl_dp_tot_bohf;
%let rv2=&tema._bl_dp_tot;


%merge(ant_datasett=2, dsn_ut=&tema._N92_bohf); 

%let Andel=andel_2_1;
%let fignavn=Hdiag_N92;
%let type=inngr;
%let tittel=Andel utskrapninger med N92 som hdiag. Aldersstandardisert. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Prop.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Alle" &tabellvar2="N92";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0 andel2 comma8.1 ;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._N92_bohf, sprak = en);

%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._N92_bohf, bildeformat=pdf, sprak = en);






/* Lager datasett for Instant Atlas */
%Let beskrivelse=diagEndo_andel;
data helseatl.IA_gyn_&beskrivelse;
  set diagEndo_BU_bohf (keep = bohf andel_rate2 antall_2 tot_antall rename=(andel_rate2=Andel antall_2=Antall tot_antall=innbyggere)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 1;
Niva = 3;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;
