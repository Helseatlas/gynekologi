%Let tema=kselek;


/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._par0_PopPar0;

%let fignavn=;
%let type=par0; /*Angir populasjon/nevner*/
%let tittel=Antall elektive keisersnitt, per. 10 000 f�rstegangsf�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Elektive keisersnitt, pr. 10 000 f�rstegangsf�dsler.;
%let tabellvar1=&tema._par0_PopPar0;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="El. keisersnitt" &tabellvar2="Alle f�rstegangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0_PopPar0UJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let rv1=&tema._par1_PopPar1;

%let fignavn=;
%let type=par1; /*Angir populasjon/nevner*/
%let tittel=Antall elektive keisersnitt, per. 10 000 flergangsf�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Elektive keisersnitt, pr. 10 000 flergangsf�dsler.;
%let tabellvar1=&tema._par1_PopPar1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="El. keisersnitt" &tabellvar2="Alle flergangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1_PopPar1UJ_bohf, aar1=2015, aar2=2016, aar3=2017);

