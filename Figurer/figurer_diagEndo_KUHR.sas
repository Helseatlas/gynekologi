

/***************************************************/
/* Lag figur KUHR kontakter                        */
/***************************************************/

%let tema=endombiopsi;

%let dsn1=&tema._kontakter_bohf;
%let rv1=&tema._kontakter;

%let dsn2=&tema._pasienter_bohf;
%let rv2=&tema._pasienter;


%merge(ant_datasett=2, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=rate_1/rate_2;			/* (Rate kons off + Rate kons priv) / Rate pers tot*/
run;

%let fignavn=KUHR;
%let type=kons;

%let tittel=Antall kontakter hos primærhelsetjenester med endometriebiopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= kontakter hos primærhelsetjenester med endometriebiopsi, per 10 000 innbyggere. Aldersjusterte rater.;


%let label_1=kontakter;
%let label_2=Pasienter;

%let tabellvar1=antall_1;
%let tabellvar2=Innbyggere;

%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Kvinner";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland);

/*Lager rankingtabell*/
proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;


/***************************************************/
/* Lag figur KUHR kontakter + NPR konsultasjoner   */
/***************************************************/

%include "&filbane.Stiler\Anno_logo_kilde_NPR_KUHR_SSB.sas";

%let tema=endombiopsi;

%let dsn1=&tema._kontakter_bohf;
%let rv1=&tema._kontakter;

%let tema=diagEndo;

%let dsn2=&tema.B_p_poli_bohf;
%let rv2=&tema.B_p_poli;

%let dsn3=&tema.U_p_tot_bohf;
%let rv3=&tema.U_p_tot;

%merge(ant_datasett=3, dsn_ut=&tema._npr_kuhr_bohf); 

data &tema._npr_kuhr_bohf;
set &tema._npr_kuhr_bohf;

rate1=rate_1;
rate2=rate_2;
rate3=rate_3;
n1rate=nrate_1;
n2rate=nrate_2;
n3rate=nrate_3;

tot_rate=rate1+rate2+rate3;
ntot_rate=n1rate+n2rate+n3rate;
rate_1=rate2+rate3;
nrate_1=n2rate+n3rate;

alle_kontakter=antall_1+antall_2+antall_3;

andel_rate1=rate_1/tot_rate;
andel_FL=rate1/tot_rate;

run;

%let vis_aarsvar_todelt=0;

%let fignavn=NPR_KUHR;
%let type=unders;
%let tittel=Antall kontakter hos fastlege og i spesialisthelsetjenesten med endometriebiopsi/fraksjonert utskraping, per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;

%let label_1=Spes. helsetj.;
%let label_2=Fastlege;

%let tabellvar1=alle_kontakter;
%let tabellvar2=andel_FL;

%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Andel fastlege";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 andel_FL nlpct8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._npr_kuhr_bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._npr_kuhr_bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );


%let vis_aarsvar_todelt=1;



/*INPUT FOR HVER FIGUR:*/
%let fignavn=off_priv_FL; *additional info for figure name, can be empty;
%let type=unders;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall kontakter hos fastlege og i spesialisthelsetjenesten med endometriebiopsi, per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let anno=ANNO;
%let tema=diagEndo;
*%let tabellvar1=Andel&del1.;
*%let tabellvar2=Andel&del2.;
%let tabellvar1=Andel&del3.;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1;
%let label_1=Poli. off.;
%let label_2=Poli. priv.;
%let label_3=Fastlege;
%let labeltabell=&tabellvar1="Fastlege";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=diagEndoB_p_off, del2=diagEndoB_p_priv, del3=endombiopsi_kontakter);


%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=diagEndoB_p_off, del2=diagEndoB_p_priv, del3=endombiopsi_kontakter, bildeformat=pdf );


%include "&filbane.Stiler\Anno_logo_kilde_NPR_SSB.sas";

/* Lager datasett for Instant Atlas */
%Let beskrivelse=diagEndo_rate;
data helseatl.IA_gyn_&beskrivelse;
  set diagEndo_npr_kuhr_bohf (keep = bohf tot_rate alle_kontakter innbyggere rename=(tot_rate=Rate alle_kontakter=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 1;
Niva = 2;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;


/*Lager rankingtabell*/

/*proc sort data=&tema._npr_kuhr_bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._npr_kuhr_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;
*/

