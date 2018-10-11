%let tema=ltpar;

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par0vag_par0vag;

%let fignavn=;
%let type=par0vag; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for f�rstegangsf�dende, vaginal f�dsel. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for f�rstegangsf�dende, vaginal f�dsel.;
%let tabellvar1=&tema._par0vag_par0vag;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0vag_par0vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par1vag_par1vag;

%let fignavn=;
%let type=par1vag; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for flergangsf�dende, vaginal f�dsel. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for flergangsf�dende, vaginal f�dsel. ;
%let tabellvar1=&tema._par1vag_par1vag;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1vag_par1vagUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par0ks_par0ks;

%let fignavn=;
%let type=par0ks; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for f�rstegangsf�dende, keisersnitt. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for f�rstegangsf�dende, keisersnitt.;
%let tabellvar1=&tema._par0ks_par0ks;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0ks_par0ksUJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par1ks_par1ks;

%let fignavn=;
%let type=par1ks; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for flergangsf�dende, keisersnitt. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for flergangsf�dende, keisersnitt.;
%let tabellvar1=&tema._par1ks_par1ks;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1ks_par1ksUJ_bohf, aar1=2015, aar2=2016, aar3=2017);





/* INDIREKTE JUSTERTE RATER */

/*Uten justering for paritet*/
%let nkrav=15;

%let tema=ltpar;

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par0vag_par0vagIJ;

%let fignavn=IJ;
%let type=par0vag; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for f�rstegangsf�dende, vaginal f�dsel. INDIREKTE aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for f�rstegangsf�dende, vaginal f�dsel. INDIREKTE aldersjusterte rater.;
%let tabellvar1=&tema._par0vag_par0vagIJ;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0vag_par0vagIJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par1vag_par1vagIJ;

%let fignavn=IJ;
%let type=par1vag; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for flergangsf�dende, vaginal f�dsel. INDIREKTE aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for flergangsf�dende, vaginal f�dsel. INDIREKTE aldersjusterte rater.;
%let tabellvar1=&tema._par1vag_par1vagIJ;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1vag_par1vagIJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par0ks_par0ksIJ;

%let fignavn=IJ;
%let type=par0ks; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for f�rstegangsf�dende, keisersnitt. INDIREKTE aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for f�rstegangsf�dende, keisersnitt. INDIREKTE aldersjusterte rater.;
%let tabellvar1=&tema._par0ks_par0ksIJ;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par0ks_par0ksIJ_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Enkel ratefigur                 */
/***************************************************/

%let rv1=&tema._par1ks_par1ksIJ;

%let fignavn=IJ;
%let type=par1ks; /*Angir populasjon/nevner*/
%let tittel=Antall ligged�gn per f�dsel for flergangsf�dende, keisersnitt. INDIREKTE aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Ligged�gn per f�dsel for flergangsf�dende, keisersnitt. INDIREKTE aldersjusterte rater.;
%let tabellvar1=&tema._par1ks_par1ksIJ;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Ligged�gn";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._par1ks_par1ksIJ_bohf, aar1=2015, aar2=2016, aar3=2017);



