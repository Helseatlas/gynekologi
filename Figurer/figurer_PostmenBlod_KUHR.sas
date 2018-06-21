

/***************************************************/
/* Lag figur KUHR kontakter                        */
/***************************************************/

%let tema=PostmenBlod;

%let dsn1=&tema._kontakter_bohf;
%let rv1=&tema._kontakter;

%let dsn2=&tema._pasienter_bohf;
%let rv2=&tema._pasienter;


%merge(ant_datasett=2, dsn_ut=&tema._bohf);

data &tema._bohf;
set &tema._bohf;
kons_pr_pers=rate_1/rate_2;			/* (Rate kons off + Rate kons priv) / Rate pers tot*/
run;

%let fignavn=KUHR;
%let type=kons;
%let tittel=Antall kontakter hos primærhelsetjenester for postmenopausale blødninger per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Kontakter hos primærhelsetjenester for postmenopausale blødninger, pr. 100 000 innbyggere. Aldersjusterte rater.;

%let label_1=kontakter;
%let label_2=Pasienter;

%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=kons_pr_pers;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Personer" &tabellvar3="Kotakt/Person";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.1;
%let skala=;

%ratefig(datasett=&tema._bohf);

/*Lager rankingtabell*/
proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;


/***************************************************/
/* Lag figur KUHR kontakter + NPR konsultasjoner   */
/***************************************************/

%let tema=postmenblod;

%let dsn1=&tema._kontakter_bohf;
%let rv1=&tema._kontakter;

%let dsn2=&tema._d_poli_bohf;
%let rv2=&tema._d_poli;


%merge(ant_datasett=2, dsn_ut=&tema._npr_kuhr_bohf);



%let fignavn=NPR_KUHR;
%let type=kons;

%let tittel=Antall kontakter hos primær- og spesialisthelsetjenester for postmenopausale blødninger per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= kontakter hos primær- og spesialisthelsetjenester for postmenopausale blødninger, pr. 100 000 innbyggere. Aldersjusterte rater.;


%let label_1=primær;
%let label_2=spesialist;

%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;

%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="total kontakter" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._npr_kuhr_bohf);

/*Lager rankingtabell*/
proc sort data=&tema._npr_kuhr_bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._npr_kuhr_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;