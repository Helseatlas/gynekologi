/***************************************************/
/* Enkel ratefigur, f�rstegangsf�dende                */
/***************************************************/


%let tema=blod;
%let rv1=&tema._par0vag_Par0vag;

%let fignavn=;
%let type=par0vag; /*Angir populasjon/nevner*/
%let tittel=Antall f�rstegangsf�dsler med bl�dning 500 ml+, per. 10 000 vaginale f�rstegangsf�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel=F�rstegangsf�dsler med bl�dning 500 ml+, pr. 10 000 vaginale f�rstegangsf�dsler.;
%let tabellvar1=&tema._par0vag_Par0vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bl�dning 500 ml+" &tabellvar2="Alle vaginale f�rstegangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0vag_Par0vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);


/***************************************************/
/* Enkel ratefigur, flergangsf�dende                */
/***************************************************/

%let rv1=&tema._par1vag_Par1vag;

%let fignavn=;
%let type=par1vag; /*Angir populasjon/nevner*/
%let tittel=Antall flergangsf�dsler med bl�dning 500 ml+, per. 10 000 vaginale flergangsf�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel=Flergangsf�dsler med bl�dning 500 ml+, pr. 10 000 vaginale flergangsf�dsler.;
%let tabellvar1=&tema._par1vag_Par1vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bl�dning 500 ml+" &tabellvar2="Alle vaginale flergangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1vag_Par1vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);
