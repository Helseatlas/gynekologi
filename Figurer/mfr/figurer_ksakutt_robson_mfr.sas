/*Uten justering for paritet*/
%let nkrav=15;

%Let tema=ksakuttrob;

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._rob1_poprob1;

%let fignavn=;
%let type=rob1; /*Angir populasjon/nevner*/
%let tittel=Antall f�dsler i Robsongruppe 1 med akutt keisersnitt, per. 10 000 f�dsler i Robsongruppe 1. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= F�dsler i Robsongruppe 1 med akutt keisersnitt, pr. 10 000 f�dsler i Robsongruppe 1. Aldersjusterte rater.;
%let tabellvar1=&tema._rob1_poprob1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="F�dsler, Rob 1";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._rob1_poprob1_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._rob3_poprob3;

%let fignavn=;
%let type=rob3; /*Angir populasjon/nevner*/
%let tittel=Antall f�dsler i Robsongruppe 3 med akutt keisersnitt, per. 10 000 f�dsler i Robsongruppe 3. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= F�dsler i Robsongruppe 3 med akutt keisersnitt, pr. 10 000 f�dsler i Robsongruppe 3. Aldersjusterte rater.;
%let tabellvar1=&tema._rob3_poprob3;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="F�dsler, Rob 3";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._rob3_poprob3_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._rob9_poprob9;

%let fignavn=;
%let type=rob9; /*Angir populasjon/nevner*/
%let tittel=Antall f�dsler i Robsongruppe 2 og 4-10 med akutt keisersnitt, per. 10 000 f�dsler i Robsongruppe 2 og 4-10. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= F�dsler i Robsongruppe 2 og 4-10 med akutt keisersnitt, pr. 10 000 f�dsler i Robsongruppe 2 og 4-10. Aldersjusterte rater.;
%let tabellvar1=&tema._rob9_poprob9;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="F�dsler, R2,4-10";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._rob9_poprob9_bohf, aar1=2015, aar2=2016, aar3=2017);