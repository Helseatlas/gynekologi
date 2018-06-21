%let tema=Hyster;


/***************************************************************/
/* Lag tredelt figur for teknikker - åpen, lapraskopi, vaginal */
/***************************************************************/
/*INPUT FOR HVER FIGUR:*/
%let fignavn=kir_metode; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel=Hysterektomi, ikke-kreft, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tema=Hyster;

%ratefig_tredeltSoyle(del1=Aapen, del2=Lap, del3=Vaginal);



/*************************************************/
/* Lag panel figur for å se på  trend i perioden */
/*************************************************/

%let tema=Hyster;

%let teknikk=_Aapen;
%Let aksetekst=Antall hysterektomier åpen inngrep per 100 000 innbyggere;
%panelfig;

%let teknikk=_Lap;
%Let aksetekst=Antall hysterektomier lapraskopi inngrep per 100 000 innbyggere;
%panelfig;

%let teknikk=_vaginal;
%Let aksetekst=Antall hysterektomier vaginal inngrep per 100 000 innbyggere;
%panelfig;

%let tema=Hysterektomi;
%let teknikk=;
%Let aksetekst=Antall total hysterektomier inngrep per 100 000 innbyggere;
%panelfig;


/*********************************************************/
/* Lag tredelt figur for tilstandskoder (diagnosegruppe) */
/*********************************************************/

/*INPUT FOR HVER FIGUR:*/
%let fignavn=diag; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel=Hysterektomi, diagnosegrupper, pr. 100 000 innbyggere. Aldersjusterte rater.;
%let anno=ANNO;
%let tema=Hyster;

%ratefig_tredeltSoyle(del1=myom, del2=blod, del3=annen);


/***************************************************/
/* Lag figur andel innlagte, inngrep               */
/***************************************************/


%let tema=hysterektomi_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let dsn2=&tema._inn_bohf;
%let rv2=&tema._inn;
%merge(ant_datasett=2, dsn_ut=&tema._Ainn_bohf); 

%let Andel=andel_2_1;
%let fignavn=innlagte;
%let type=inngr;
%let tittel=Innleggelser som andel av alle hysterektomier. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel=Innleggelser som andel av alle hysterektomier. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep" &tabellvar2="Innleggelser";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Ainn_bohf);


/*********************************************************/
/* Lag tredelt figur for robot assist                    */
/*********************************************************/


%let tema=hyster;

%let dsn1=&tema._robot_dp_tot_bohf;
%let rv1=&tema._robot_dp_tot;

%let dsn2=&tema._ikkerobot_dp_tot_bohf;
%let rv2=&tema._ikkerobot_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._robot_bohf); 



/*INPUT FOR HVER FIGUR:*/

%let fignavn=robot_ass; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall hysterektomier per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel=Hysterektomi, robot assistert, pr. 100 000 innbyggere. Aldersjusterte rater.;

* variables to use, and column and label names for the table on the right of the figure;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=Innbyggere;
%let label_2=ikke robot;
%let label_1=robot assistert ;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="robot" &tabellvar2="ikke robot" &tabellvar3="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%ratefig_todeltSoyle(datasett=&tema._robot_bohf);





