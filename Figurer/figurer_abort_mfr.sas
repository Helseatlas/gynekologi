%Let tema=abort;

/***************************************************/
/* Lag figur todelt kir/med                 */
/***************************************************/

%let dsn1=&tema._med_bohf;
%let rv1=&tema._med;

%let dsn2=&tema._kir_bohf;
%let rv2=&tema._kir;



%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=&tema._kirmed_bohf); 

%let fignavn=kirmed;
%let type=allekvinner; /*Angir populasjon/nevner*/
%let tittel=Antall selvbestemte aborter, per. 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let label_2=Kirurgisk metode;
%let label_1=Medikamentell metode;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Aborter" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;
%let anno=ANNOMFRSSB;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._kirmed_bohf, aar1=2015, aar2=2016, aar3=2017);


/***************************************************/
/* Lag andelsfigur    kirurgisk           */
/***************************************************/


%let andel=andel_rate2;

%let fignavn=kir;
%let type=allekvinner; /*Angir populasjon/nevner*/
%let tittel=Kirurgiske aborter som andel av alle selvbestemte aborter. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel;
%let tabellvar1=antall_2;
%let tabellvar2=antall_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kir." &tabellvar2="Med.";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;
%let anno=ANNOMFRSSB;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._kirmed_bohf, labelcol=black);

%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._kirmed_bohf, bildeformat=pdf, labelcol=black);


%let anno=anno;

/* Lager datasett for Instant Atlas */
%Let beskrivelse=selvabort_andel;
data helseatl.IA_gyn_&beskrivelse;
  set abort_kirmed_bohf (keep = bohf andel_rate2 antall_2 tot_antall rename=(andel_rate2=Andel antall_2=Antall tot_antall=Innbyggere)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva = 9;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;