/*ENKEL RATEFIGUR, ALLE KONSULTASJONER*/

%let tema=barselkont;
%let rv1=&tema._tot;

%let fignavn=;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner i barseltiden pr. 10 fødsler. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Polikliniske konsultasjoner i barseltiden, pr. 10 fødsler. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);


/*ANDEL FØRSTE 7 DAGER E. FØDSEL*/

%let tema=barselkont;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema.7d_tot_bohf;
%let rv2=&tema.7d_tot;

%merge(ant_datasett=2, dsn_ut=&tema.a7d_bohf);

%let Andel=andel_2_1;
%let fignavn=andel7d;
%let type=kons;
%let tittel=Andel polikliniske konsultasjoner i barseltiden som finner sted ila de første 7 dagene etter fødsel. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Andel konsultasjoner ila de første 7 dager e. fødsel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Alle" &tabellvar2="Første 7 dager" &tabellvar3="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema.a7d_bohf);



/*ANDEL MED BARSELRELEVANT KODE FØDSEL*/

%let tema=barsel;

%let dsn1=&tema.kont_tot_bohf;
%let rv1=&tema.kont_tot;

%let dsn2=&tema._kode_tot_bohf;
%let rv2=&tema._kode_tot;

%merge(ant_datasett=2, dsn_ut=&tema._akode_bohf);

%let Andel=andel_2_1;
%let fignavn=andelkode;
%let type=kons;
%let tittel=Andel polikliniske konsultasjoner i barseltiden med utvalgte koder. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Andel konsultasjoner med utvalgte koder;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Alle" &tabellvar2="Utvalgte koder" &tabellvar3="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._akode_bohf);

