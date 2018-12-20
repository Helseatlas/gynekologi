/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=TransCer_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall transcervikale inngrep per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=&tema._tot;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep";* &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._tot_bohf, bildeformat=pdf );
%let mappe=&mappe_png;

/*********************************************************/
/* Lag tredelt figur for tilstandskoder (diagnosegruppe) */
/*********************************************************/

/*INPUT FOR HVER FIGUR:*/
%let fignavn=diag; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall transcervikale inngrep per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let anno=ANNO;
%let tema=TransCer;
%let tabellvar1=Andel&del1.;/*andel N92*/
*%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
*%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar2=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2;
%let label_1=N92;
%let label_2=N84;
%let label_3=Annen;
%let labeltabell=&tabellvar1="N92" &tabellvar2="Inngrep";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=TC_blod_dp_tot, del2=TC_polypp_dp_tot, del3=TC_annen_dp_tot);

%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=TC_blod_dp_tot, del2=TC_polypp_dp_tot, del3=TC_annen_dp_tot, bildeformat=pdf );
%let mappe=&mappe_png;



