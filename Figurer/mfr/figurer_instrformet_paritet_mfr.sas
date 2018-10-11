/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let tema=instrformet;
%let rv1=&tema._par0_par0vag;

%let fignavn=;
%let type=par0vag; /*Angir populasjon/nevner*/
%let tittel=Antall førstegangsfødsler med instrumentell forløsning, per. 10 000 vaginale førstegangsfødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Førstegangsfødsler med instrumentell forløsning, pr. 10 000 vaginale førstegangsfødsler.;
%let tabellvar1=&tema._par0_par0vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Instrumentell forløsning" &tabellvar2="Alle vaginale førstegangsfødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0_par0vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/


%let tema=instrformet;
%let rv1=&tema._par1_par1vag;

%let fignavn=;
%let type=par1vag; /*Angir populasjon/nevner*/
%let tittel=Antall flergangsfødsler med instrumentell forløsning, per. 10 000 vaginale flergangsfødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Flergangsfødsler med instrumentell forløsning, pr. 10 000 vaginale flergangsfødsler.;
%let tabellvar1=&tema._par1_par1vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Instrumentell forløsning" &tabellvar2="Alle vaginale flergangsfødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1_par1vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);