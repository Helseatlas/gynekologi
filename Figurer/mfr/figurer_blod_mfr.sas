/***************************************************/
/* Enkel ratefigur, førstegangsfødende                */
/***************************************************/


%let tema=blod;
%let rv1=&tema._par0vag_Par0vag;

%let fignavn=;
%let type=par0vag; /*Angir populasjon/nevner*/
%let tittel=Antall førstegangsfødsler med blødning 500 ml+, per. 10 000 vaginale førstegangsfødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Førstegangsfødsler med blødning 500 ml+, pr. 10 000 vaginale førstegangsfødsler.;
%let tabellvar1=&tema._par0vag_Par0vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Blødning 500 ml+" &tabellvar2="Alle vaginale førstegangsfødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0vag_Par0vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);


/***************************************************/
/* Enkel ratefigur, flergangsfødende                */
/***************************************************/

%let rv1=&tema._par1vag_Par1vag;

%let fignavn=;
%let type=par1vag; /*Angir populasjon/nevner*/
%let tittel=Antall flergangsfødsler med blødning 500 ml+, per. 10 000 vaginale flergangsfødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Flergangsfødsler med blødning 500 ml+, pr. 10 000 vaginale flergangsfødsler.;
%let tabellvar1=&tema._par1vag_Par1vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Blødning 500 ml+" &tabellvar2="Alle vaginale flergangsfødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1vag_Par1vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

