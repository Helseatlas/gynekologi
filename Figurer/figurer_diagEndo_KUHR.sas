

/***************************************************/
/* Lag figur KUHR kontakter                        */
/***************************************************/

%let tema=endombiopsi;

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

%let tittel=Antall kontakter hos primærhelsetjenester med endometriebiopsi per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= kontakter hos primærhelsetjenester med endometriebiopsi, pr. 100 000 innbyggere. Aldersjusterte rater.;


%let label_1=kontakter;
%let label_2=Pasienter;

%let tabellvar1=antall_1;
%let tabellvar2=Innbyggere;

%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
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


%let tema=endombiopsi;

%let dsn1=&tema._kontakter_bohf;
%let rv1=&tema._kontakter;

%let tema=diagEndo;

%let dsn2=&tema.B_p_poli_bohf;
%let rv2=&tema.B_p_poli;

%merge(ant_datasett=2, dsn_ut=&tema._npr_kuhr_bohf); 

%let fignavn=NPR_KUHR;
%let type=unders;
%let tittel=Antall kontakter hos primærhelsetjenester og undersøkelser hos spesialisthelsetjenester med endometriebiopsi per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= kontakter hos primærhelsetjenester og undersøkelser hos spesialisthelsetjenester med endometriebiopsi, pr. 100 000 innbyggere. Aldersjusterte rater.;

%let label_1=primær;
%let label_2=spesialist;

%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;

%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="EndometrieBiopsi" &tabellvar2="Kvinner";
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


