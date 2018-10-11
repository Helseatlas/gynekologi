%Let tema=alle;

%let dsn1=&tema._par0_innbyggereUJ_bohf;
%let rv1=&tema._par0_innbyggere;

%let dsn2=&tema._par1_innbyggereUJ_bohf;
%let rv2=&tema._par1_innbyggere;
%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=&tema._par0par1_bohf); 

/***************************************************/
/* Lag andelsfigur    par0           */
/***************************************************/


%let andel=andel_rate1;

%let fignavn=par0;
%let type=alle; /*Angir populasjon/nevner*/
%let tittel=Andel f�rstegangsf�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Andel f�rstegangsf�dsler.;
%let tabellvar1=antall_1;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="F�rstegangsf�dsler" &tabellvar2="Alle f�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._par0par1_bohf);



%let dsn1=&tema._par0vag_innbyggereUJ_bohf;
%let rv1=&tema._par0vag_innbyggere;

%let dsn2=&tema._par0ks_innbyggereUJ_bohf;
%let rv2=&tema._par0ks_innbyggere;
%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=&tema._par0vagks_bohf); 

/***************************************************/
/* Lag andelsfigur    ks           */
/***************************************************/


%let andel=andel_rate2;

%let fignavn=ks;
%let type=par0; /*Angir populasjon/nevner*/
%let tittel=Andel keisersnitt hos f�rstegangsf�dende. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Andel keisersnitt, f�rstegangsf�dende.;
%let tabellvar1=antall_2;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Alle f�rstegangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._par0vagks_bohf);




%let dsn1=&tema._par1vag_innbyggereUJ_bohf;
%let rv1=&tema._par1vag_innbyggere;

%let dsn2=&tema._par1ks_innbyggereUJ_bohf;
%let rv2=&tema._par1ks_innbyggere;
%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=&tema._par1vagks_bohf); 

/***************************************************/
/* Lag andelsfigur    ks           */
/***************************************************/


%let andel=andel_rate2;

%let fignavn=ks;
%let type=par1; /*Angir populasjon/nevner*/
%let tittel=Andel keisersnitt hos flergangsf�dende. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Andel keisersnitt, flergangsf�dende.;
%let tabellvar1=antall_2;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Alle flergangsf�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._par1vagks_bohf);
