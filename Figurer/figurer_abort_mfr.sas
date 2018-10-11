%Let tema=abort;

/***************************************************/
/* Lag figur todelt kir/med                 */
/***************************************************/

%let dsn1=&tema._kir_bohf;
%let rv1=&tema._kir;

%let dsn2=&tema._med_bohf;
%let rv2=&tema._med;

%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=&tema._kirmed_bohf); 

%let fignavn=kirmed;
%let type=allekvinner; /*Angir populasjon/nevner*/
%let tittel=Antall selvbestemte aborter, per. 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Selvbestemte aborter, per. 10 000 kvinner. Aldersjusterte rater.;
%let label_1=Kirurgisk metode;
%let label_2=Medikamentell metode;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Aborter" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;
%let anno=ANNOMFRSSB;

%ratefig_todeltSoyle(datasett=&tema._kirmed_bohf, aar1=2015, aar2=2016, aar3=2017);


/***************************************************/
/* Lag andelsfigur    kirurgisk           */
/***************************************************/


%let andel=andel_rate1;

%let fignavn=kir;
%let type=allekvinner; /*Angir populasjon/nevner*/
%let tittel=Andel kirurgiske aborter. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel kirurgiske aborter. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kirurgiske" &tabellvar2="Medisinske";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;
%let anno=ANNOMFRSSB;

%andelsfig(datasett=&tema._kirmed_bohf);

%let mappe=Figurer\NPR\fig_pdf;
%andelsfig(datasett=&tema._kirmed_bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

%let anno=anno;