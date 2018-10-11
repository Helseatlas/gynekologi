/***************************************************/
/* Enkel ratefigur, f�rstegangsf�dende                */
/***************************************************/


%let tema=fstartind;
%let rv1=&tema._par0_Poppar0;
%let par_title=f�rstegangsf�dende;

%let fignavn=;
%let type=par0; /*Angir populasjon/nevner*/
%let tittel=Antall induserte f�dsler for &par_title, per 10 000 &par_title. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel=Induserte f�dsler for &par_title, per 10 000 &par_title.;
%let tabellvar1=&tema._par0_Poppar0;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Starter med induksjon" &tabellvar2="F�rstegangsf�dende";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&rv1.UJ_bohf, aar1=2015, aar2=2016, aar3=2017);


/***************************************************/
/* Enkel ratefigur, flergangsf�dende                */
/***************************************************/

%let par_title=flergangsf�dende;
%let rv1=&tema._par1_Poppar1;

%let fignavn=;
%let type=par1; /*Angir populasjon/nevner*/
%let tittel=Antall induserte f�dsler for &par_title, per 10 000 &par_title. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel=Induserte f�dsler for &par_title, per 10 000 &par_title.;
%let tabellvar1=&tema._par1_Poppar1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Starter med induksjon" &tabellvar2="Flergangsf�dende";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&rv1.UJ_bohf, aar1=2015, aar2=2016, aar3=2017);

