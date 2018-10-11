/*Uten justering for paritet*/
%let nkrav=15;

%Let tema=epirob;

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._rob1_rob1vag;

%let fignavn=;
%let type=rob1vag; /*Angir populasjon/nevner*/
%let tittel=Antall fødsler i Robsongruppe 1 med episiotomi, per. 10 000 vaginale fødsler i Robsongruppe 1. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Fødsler i Robsongruppe 1 med episiotomi, pr. 10 000 vaginale fødsler i Robsongruppe 1. Aldersjusterte rater.;
%let tabellvar1=&tema._rob1_rob1vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Episiotomi" &tabellvar2="Vaginale fødsler,   Robsongruppe 1  ";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._rob1_rob1vag_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._rob3_rob3vag;

%let fignavn=;
%let type=rob3vag; /*Angir populasjon/nevner*/
%let tittel=Antall fødsler i Robsongruppe 3 med episiotomi, per. 10 000 vaginale fødsler i Robsongruppe 3. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Fødsler i Robsongruppe 3 med episiotomi, pr. 10 000 vaginale fødsler i Robsongruppe 3. Aldersjusterte rater.;
%let tabellvar1=&tema._rob3_rob3vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Episiotomi" &tabellvar2="Vaginale fødsler,   Robsongruppe 3  ";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._rob3_rob3vag_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._rob9_rob9vag;

%let fignavn=;
%let type=rob9vag; /*Angir populasjon/nevner*/
%let tittel=Antall fødsler i Robsongruppe 2 og 4-10 med episiotomi, per. 10 000 vaginale fødsler i Robsongruppe 2 og 4-10. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Fødsler i Robsongruppe 2 og 4-10 med episiotomi, pr. 10 000 vaginale fødsler i Robsongruppe 2 og 4-10. Aldersjusterte rater.;
%let tabellvar1=&tema._rob9_rob9vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Episiotomi" &tabellvar2="Vaginale fødsler, Robsongr 2,4-10";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._rob9_rob9vag_bohf, aar1=2015, aar2=2016, aar3=2017);