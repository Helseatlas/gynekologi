/*ENKEL RATEFIGUR, ALLE KONSULTASJONER*/

%let tema=barselkont;

%let dsn1=&tema._tu_bohf;
%let rv1=&tema._tu;

%let dsn2=&tema._tot_bohf;
%let rv2=&tema._tot;

%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let fignavn=;
%let type=pers;
%let tittel=Antall f�dende til poliklinisk konsultasjon i barseltiden pr. 10 f�dsler. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2014-16.;
%let xlabel= F�dende p� poliklinikk i barseltiden, pr. 10 f�dsler. Aldersjusterte rater.;
%let tabellvar1=&tema._tu;
%let tabellvar2=antall_2_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="F�dende p� polikl." &tabellvar2="Kontakter pr. f�dende";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.1;
%let skala=;

%ratefig(datasett=&tema._bohf);

/*Lager rankingtabell*/
proc sort data=&tema._bohf;
by decending rateSnitt;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;


/*ANDEL F�RSTE 7 DAGER E. F�DSEL*/

%let tema=barselkont;

%let dsn1=&tema._tu_bohf;
%let rv1=&tema._tu;

%let dsn2=&tema.7d_tu_bohf;
%let rv2=&tema.7d_tu;

%merge(ant_datasett=2, dsn_ut=&tema.a7d_bohf);

%let Andel=andel_2_1;
%let fignavn=7d;
%let type=pers;
%let tittel=Andel av de f�dende med poliklinisk kont. i barseltiden som har hatt en konsultasjon ila de f�rste 7 dagene etter f�dsel. Gjennomsnitt per �r i perioden 2014-16.;
%let xlabel= Andel f�dende med poliklinisk kont. i barseltiden som har konsultasjon ila de f�rste 7 dager e. f�dsel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Alle p� polikl." &tabellvar2="Ila. f�rste 7 d.";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema.a7d_bohf);



/*ANDEL MED BARSELRELEVANT KODE F�DSEL*/

%let tema=barsel;

%let dsn1=&tema.kont_tu_bohf;
%let rv1=&tema.kont_tu;

%let dsn2=&tema._kode_tu_bohf;
%let rv2=&tema._kode_tu;

%merge(ant_datasett=2, dsn_ut=&tema._akode_bohf);

%let Andel=andel_2_1;
%let fignavn=kode;
%let type=pers;
%let tittel=Andel av de f�dende med poliklinisk kont. i barseltiden som har hatt en konsultasjon med utvalgte koder. Gjennomsnitt per �r i perioden 2014-16.;
%let xlabel= Andel f�dende med poliklinisk kont. i barseltiden som har konsultasjon med utvalgte koder;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Alle p� polikl." &tabellvar2="M. utv. koder";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._akode_bohf);

