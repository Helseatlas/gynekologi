

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=PostmenBlod_d;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%let dsn3=&tema._poli_unik_bohf;
%let rv3=&tema._poli_unik;


%merge(ant_datasett=3, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=tot_rate/rate_3;			/* (Rate kons off + Rate kons priv) / Rate pers tot*/
run;

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske kontakter for postmenopausale blødninger per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let label_1=Off. sykehus;
%let label_2=Avtalespesialist;
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter";* &tabellvar2="Pasienter";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf );


/*Andel som har fått endombiopsi/utskraping*/

%let dsn1=&tema._poli_bohf;
%let rv1=&tema._poli;

%let dsn2=&tema.p_poli_bohf;
%let rv2=&tema.p_poli;

%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let andel=andel_2_1;
%let fignavn=diagEndo;
%let type=kons;
%let tittel=Andel polikliniske kontakter for postmenopausale blødninger med endometriebiopsi og/eller utstraping per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Med biopsi/utskr.";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._bohf, bildeformat=pdf );



/* Lager datasett for Instant Atlas */
%Let beskrivelse=postmen_rate;
data helseatl.IA_gyn_&beskrivelse;
  set postmenblod_d_poli_bohf (keep = bohf ratesnitt postmenblod_d_poli innbyggere rename=(ratesnitt=Rate postmenblod_d_poli=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 1;
Niva = 1;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;
