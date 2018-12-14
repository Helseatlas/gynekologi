

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=endometriose_d;

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
%let tittel=Antall polikliniske konsultasjoner for endometriose per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner for endometriose, per 10 000 innbyggere. Aldersjusterte rater.;
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

%let tema=endometriose;

%let dsn1=&tema._dp_tot_bohf;
%let rv1=&tema._dp_tot;

%let dsn2=&tema._h_dp_tot_bohf;
%let rv2=&tema._h_dp_tot;


%merge(ant_datasett=2, dsn_ut=&tema._bohf);


%let fignavn=andelhyst;
%let type=inngr;
%let tittel=Antall inngrep for endometriose per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner.;
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
/* Lag figur andel innlagte, inngrep                 */
/***************************************************/


/*%let tema=endometriose_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle inngrep ved mindre inngrep for endometriose. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);*/

/*FIGUR MED ANDEL FRA 0 TIL 100*/

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

