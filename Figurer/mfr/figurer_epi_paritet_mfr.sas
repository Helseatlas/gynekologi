%Let tema=epipar;

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let par_title=f�rstegangsf�dende;
%let rv1=&tema._par0_par0vag;

%let fignavn=;
%let type=par0vag; /*Angir populasjon/nevner*/
%let tittel=Antall &par_title som f�r episiotomi, per. 10 000 &par_title. Vaginale f�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Antall &par_title som f�r episiotomi, per. 10 000 &par_title. Vaginale f�dsler. ;
%let tabellvar1=&tema._par0_par0vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Episiotomi" &tabellvar2="Vaginale f�rstegangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0_par0vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let par_title=flergangsf�dende;
%let rv1=&tema._par1_par1vag;

%let fignavn=;
%let type=par1vag; /*Angir populasjon/nevner*/
%let tittel=Antall &par_title som f�r episiotomi, per. 10 000 &par_title. Vaginale f�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Antall &par_title som f�r episiotomi, per. 10 000 &par_title. Vaginale f�dsler. ;
%let tabellvar1=&tema._par1_par1vag;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Episiotomi" &tabellvar2="Vaginale flergangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1_par1vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

