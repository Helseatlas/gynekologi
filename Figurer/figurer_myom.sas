

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

/*%let tema=myom_d;


%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;
%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner for myom i livmor per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner for myom i livmor, per 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Off. sykehus;
%let label_2=Avtalespesialist;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);*/

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


/*
%let mappe=Figurer\NPR\fig_pdf;
%andelsfig_0_100(n_datasett=3, text_a1=N92, bildeformat=pdf );
%let mappe=Figurer\NPR;
*/

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
/* Lag figur andel innlagte, andre inngrep                 */
/***************************************************/


%let tema=myom_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av andre (ikke hysterektomi) inngrep for myom. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._Ainn_bohf);



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
/* Lag figur liggetid pr inngrep                 */
/***************************************************/


/*%let tema=myom_dp;

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
%let tittel=Liggetid per inngrep, kirurgisk behandling for myom. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Liggetid per inngrep, myom. Aldersjusterte rater.;
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
