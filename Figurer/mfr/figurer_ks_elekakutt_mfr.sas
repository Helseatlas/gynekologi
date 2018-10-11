%let tema=ks;

/***************************************************/
/* Lag figur todelt elektiv/akutt     paritet 0     */

/***************************************************/

%let dsn1=ksakuttpar_par0_Poppar0UJ_bohf;
%let rv1=ksakuttpar_par0_Poppar0;

%let dsn2=kselek_par0_Poppar0UJ_bohf;
%let rv2=kselek_par0_Poppar0;

%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=ks_par0elekakutt_bohf); 

%let fignavn=elekakutt;
%let type=par0; /*Angir populasjon/nevner*/
%let tittel=Antall f�rstegangsf�dsler med keisersnitt, per. 10 000 f�rstegangsf�dsler. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= F�rstegangs�dsler med keisersnitt, pr. 10 000 f�rstegangsf�dsler.;
%let label_1=Akutte keisersnitt;
%let label_2=Elektive keisersnitt;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="F�dsler med keisersnitt" &tabellvar2="Alle f�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=ks_par0elekakutt_bohf, aar1=2015, aar2=2016, aar3=2017);

/***************************************************/
/* Lag figur todelt elektiv/akutt     paritet 1     */

/***************************************************/

%let dsn1=ksakuttpar_par1_Poppar1UJ_bohf;
%let rv1=ksakuttpar_par1_Poppar1;

%let dsn2=kselek_par1_Poppar1UJ_bohf;
%let rv2=kselek_par1_Poppar1;

%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=ks_par1elekakutt_bohf); 

%let fignavn=elekakutt;
%let type=par1; /*Angir populasjon/nevner*/
%let tittel=Antall flergangsf�dende med keisersnitt, per. 10 000 flergangsf�dende. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Flergangsf�dende med keisersnitt, pr. 10 000 flergangsf�dende.;
%let label_1=Akutte keisersnitt;
%let label_2=Elektive keisersnitt;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="F�dsler med keisersnitt" &tabellvar2="Alle f�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=ks_par1elekakutt_bohf, aar1=2015, aar2=2016, aar3=2017);

