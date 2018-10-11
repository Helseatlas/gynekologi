/***************************************************/
/* Enkel ratefigur, førstegangsfødende                */
/***************************************************/


%let tema=ruptur;
%let rv1=&tema._par0_Par0vag;

%let fignavn=;
%let type=par0; /*Angir populasjon/nevner*/
%let tittel=Antall førstegangsfødsler med ruptur grad 3/4, per. 10 000 vaginale førstegangsfødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Førstegangsfødsler med ruptur grad 3/4, pr. 10 000 vaginale førstegangsfødsler.;
%let tabellvar1=&tema._par0_Par0vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Ruptur grad 3/4" &tabellvar2="Alle førstegangsfødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0_Par0vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);


/***************************************************/
/* Enkel ratefigur, flergangsfødende                */
/***************************************************/

%let rv1=&tema._par1_Par1vag;

%let fignavn=;
%let type=par1; /*Angir populasjon/nevner*/
%let tittel=Antall flergangsfødsler med ruptur grad 3/4, per. 10 000 vaginale flergangsfødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Flergangsfødsler med ruptur grad 3/4, pr. 10 000 vaginale flergangsfødsler.;
%let tabellvar1=&tema._par1_Par1vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Ruptur grad 3/4" &tabellvar2="Alle flergangsfødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1_Par1vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

