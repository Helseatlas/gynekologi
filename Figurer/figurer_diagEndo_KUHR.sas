

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

%let tittel=Antall kontakter hos primærhelsetjenester med endometriebiopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= kontakter hos primærhelsetjenester med endometriebiopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;


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

%let dsn3=&tema.U_p_tot_bohf;
%let rv3=&tema.U_p_tot;

%merge(ant_datasett=3, dsn_ut=&tema._npr_kuhr_bohf); 

data &tema._npr_kuhr_bohf;
set &tema._npr_kuhr_bohf;

rate1=rate_1;
rate2=rate_2;
rate3=rate_3;
n1rate=nrate_1;
n2rate=nrate_2;
n3rate=nrate_3;

tot_rate=rate1+rate2+rate3;
ntot_rate=n1rate+n2rate;
rate_1=rate2+rate3;
nrate_1=n2rate+n3rate;

alle_kontakter=antall_1+antall_2+antall_3;

andel_rate1=rate_1/tot_rate;

run;

%let vis_aarsvar=0;

%let fignavn=NPR_KUHR;
%let type=unders;
%let tittel=Antall kontakter hos fastlege og i spesialisthelsetjenesten med endometriebiopsi/fraksjonert utskraping, per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Kontakter hos fastlege og i spesialisthelsetjenesten med endometriebiopsi/fraksjonert utskraping, pr. 10 000 innbyggere. Aldersjusterte rater.;

%let label_1=Spes. helsetj.;
%let label_2=Fastlege;

%let tabellvar1=alle_kontakter;
%let tabellvar2=Innbyggere;

%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Undersøkelser" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._npr_kuhr_bohf);

%let vis_aarsvar=1;

/***************************************************************/
/* Lag tredelt figur for teknikker - åpen, lapraskopi, vaginal */
/***************************************************************/
/*INPUT FOR HVER FIGUR:*/
%let fignavn=off_priv_FL; *additional info for figure name, can be empty;
%let type=unders;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall kontakter hos fastlege og i spesialisthelsetjenesten med endometriebiopsi, per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Kontakter hos fastlege og i spesialisthelsetjenesten med endometriebiopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tema=diagEndo;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=Polikl.;
%let label_2=Avt. spes.;
%let label_3=Fastlege;
%let labeltabell=&tabellvar1="Polikl." &tabellvar2="Avt. spes." &tabellvar3="Fastlege";

%ratefig_tredeltSoyle(del1=diagEndoB_p_off, del2=diagEndoB_p_priv, del3=endombiopsi_kontakter);


%let mappe=Figurer\NPR\fig_pdf;
%ratefig_tredeltSoyle(del1=diagEndoB_p_off, del2=diagEndoB_p_priv, del3=endombiopsi_kontakter, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;


/*Lager rankingtabell*/

/*proc sort data=&tema._npr_kuhr_bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._npr_kuhr_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;
*/

