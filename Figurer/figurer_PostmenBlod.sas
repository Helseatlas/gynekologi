

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=PostmenBlod_d;

%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;

%let dsn3=&tema._poli_unik_bohf;
%let rv3=&tema._poli_unik;


%merge(ant_datasett=3, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=tot_rate/rate_3;			/* (Rate kons off + Rate kons priv) / Rate pers tot*/
run;

%let fignavn=offpriv;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner for postmenopausale blødninger per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner for postmenopausale blødninger, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Personer";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

/*Lager rankingtabell*/
/*proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;*/