

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=KrafHypBlod_d;


%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%let dsn3=&tema._poli_unik_bohf;
%let rv3=&tema._poli_unik;


%merge(ant_datasett=3, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=tot_rate/rate_3;			
run;

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner for kraftig og/eller hyppig menstruasjon, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Off. sykehus;
%let label_2=Avtalespesialist;
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvar3=kons_pr_pers;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Personer" &tabellvar3="Kons./Person";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf);

/*Lager rankingtabell*/
/*proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;*/


/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/


%let tema=KrafHypBlod_dp;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf);


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

/***************************************************/
/* Lag figur inngrep todelt hyst/ikke hyst                 */
/***************************************************/

/*%let tema=KHB;

%let dsn1=&tema._dp_tot_bohf;
%let rv1=&tema._dp_tot;

%let dsn2=&tema._h_dp_tot_bohf;
%let rv2=&tema._h_dp_tot;

%let dsn3=&tema._dp_tot_unik_bohf;
%let rv3=&tema._dp_tot_unik;

%let dsn4=&tema._h_dp_tot_unik_bohf;
%let rv4=&tema._h_dp_tot_unik;

%merge(ant_datasett=4, dsn_ut=&tema._hyst_bohf);

data &tema._hyst_bohf;
set &tema._hyst_bohf;
pas_rate=rate_3+rate_4;
pas_antall=antall_3+antall_4;
i_pr_pas=tot_rate/pas_rate;
run;

%let fignavn=andelhyst;
%let type=inngr;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for kraftig og/eller hyppig menstruasjon, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Andre inngrep;
%let label_2=Hysterektomi;
%let tabellvar1=tot_antall;
%let tabellvar2=pas_antall;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._hyst_bohf);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_todeltSoyle(datasett=&tema._hyst_bohf, bildeformat=pdf );
%let mappe=Figurer\NPR;*/

/***************************************************************/
/* Lag tredelt figur for hyst, utskr/destr, andre */
/***************************************************************/
%let tema=KrafHypBlod;

/*INPUT FOR HVER FIGUR:*/
%let fignavn=type; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner.;
%let anno=ANNO;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del3.;/*fra forbruksmal*/
*%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar3=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=ER/EA;
%let label_2=Andre;
%let label_3=Hysterektomi;
%let labeltabell=&tabellvar1="ER/EA" &tabellvar2="Hyst." &tabellvar3="Inngrep";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=KHB_d_dp_tot, del2=KHB_dp_tot, del3=KHB_h_dp_tot);

%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=KHB_d_dp_tot, del2=KHB_dp_tot, del3=KHB_h_dp_tot, bildeformat=pdf );


/*FIGUR MED ANDEL FRA 0 TIL 100*/

%let tema=KHB;

%let dsn1=&tema._u_dp_tot_bohf;
%let rv1=&tema._u_dp_tot;
%let label_1=LCA 10/13;

%let dsn2=&tema._d_dp_tot_bohf;
%let rv2=&tema._d_dp_tot;
%let label_alle=LCA 16;

%let fignavn=du;
%let type=inngr;
%let xlabel=Andel;
%let tabellvar1=tot_antall;
%let tabellvar2=;
%let tabellvariable=;*&tabellvar1;
%let labeltabell=;*&tabellvar1="Inngrep";
%let formattabell=&tabellvar1 NLnum8.0;
%let plass_scat=0.05;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=2, text_a1=LCA 10/13);

/*%let mappe=Figurer\NPR\fig_pdf;
%andelsfig_0_100(n_datasett=2, text_a1=LCA 10/13, bildeformat=pdf );
%let mappe=Figurer\NPR;*/

/*FIGUR MED ANDEL FRA 0 TIL 100*/

%let tema=KHB;

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
%let labeltabell=;*&tabellvar1="Inngrep";
%let formattabell=&tabellvar1 NLnum8.0;
%let plass_scat=0.5;

%let mappe=&mappe_png;
%andelsfig_0_100(n_datasett=3, text_a1=Åpne);

%let mappe=&mappe_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=Åpne, bildeformat=pdf );


/***************************************************/
/* Lag figur andel innlagte, inngrep                 */
/***************************************************/


%let tema=KrafHypBlod_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep for kraftig og/eller hyppig menstruasjon. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._Ainn_bohf);

/***************************************************/
/* Lag figur andel innlagte, inngrep                 */
/***************************************************/


%let tema=KHB_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._AinnM_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte_mindre;
%let type=inngr;
%let tittel=Innleggelser som andel av mindre inngrep for kraftig og/eller hyppig menstruasjon. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._AinnM_bohf);

/***************************************************/
/* Lag figur andel innlagte, inngrep                 */
/***************************************************/


%let tema=KHB_h_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._AinnH_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte_hyst;
%let type=inngr;
%let tittel=Innleggelser som andel av hysterektomier for kraftig og/eller hyppig menstruasjon. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._AinnH_bohf);


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
/* Lag figur inngrep todelt dag/døgn                 */
/***************************************************/

/*%let tema=KrafHypBlod_dp;


%let dsn1=&tema._poli_bohf;
%let rv1=&tema._poli;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._dagdogn_bohf);

%let fignavn=dagdogn;
%let type=inngr;
%let tittel=Antall inngrep for kraftig og/eller hyppig menstruasjon per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Inngrep for kraftig og/eller hyppig menstruasjon, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Dagkirurgi;
%let label_2=Innleggelser;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Dagkir." &tabellvar2="Innlegg.";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._dagdogn_bohf);*/


/***************************************************/
/* Lag figur liggetid pr inngrep                 */
/***************************************************/


/*%let tema=KrafHypBlod_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._liggetid_bohf;
%let rv2=&tema._liggetid;
%merge(ant_datasett=2, dsn_ut=&tema._LT_bohf); 

data &tema._LT_bohf;
set &tema._LT_bohf;
ratesnitt2=andel_2_1;
snittrate=nrate_2/nrate_1;
run;

%let vis_aarsvar=0;
%let vis_ft=0;

%let fignavn=LT_pr_inngr;
%let type=inngr;
%let tittel=Liggetid per inngrep, kirurgisk behandling for kraftig og/eller hyppig menstruasjon. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Liggetid per inngrep, kraftig og/eller hyppig menstruasjon. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Liggedøgn";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._LT_bohf);
%let vis_aarsvar=1;
%let vis_ft=1;*/

/*Lager rankingtabell*/
/*proc sort data=&tema._LT_bohf;
by decending rateSnitt2;
run;

data rank_&tema._LT;
set &tema._LT_bohf;
where BoHF ne 8888;
&tema._rank_LT+1;
keep &tema._rank_LT BoHF;
run;*/


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
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
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
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
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
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);*/