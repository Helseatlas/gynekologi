
/***************************************************/
/* Lag figur rekonstruksjon                 */
/***************************************************/ 

%let tema=rekonstruksjon_p;

%let rv1=&tema._tot;

%let fignavn=;
%let tittel=Antall brystrekonstruksjoner per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.; 
%let xlabel= Brystrekonstruksjon, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);
/*%let datasett=&tema._bohf;*/

/*Lager rankingtabell*/
proc sort data=&tema._tot_bohf;
by decending rateSnitt;
run;

data rank_&tema;
set &tema._tot_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;

/***************************************************/
/* Lag figur reduksjon                */
/***************************************************/


%let tema=reduksjon_p;
%let rv1=&tema._tot;

%let fignavn=;
%let tittel=Antall brystreduksjoner per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Brystreduksjon, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._tot_bohf);

/*Lager rankingtabell*/
proc sort data=&tema._tot_bohf;
by decending rateSnitt;
run;

data rank_&tema;
set &tema._tot_bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;