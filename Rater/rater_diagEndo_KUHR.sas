


%alders_oppslag(utvalg=endombiopsi);


%let agg_var = endombiopsi;
%let Ratefil=helseatl.k_KUHR_&agg_var;
%Let Alderskategorier=30;

%definere_komnr(datasett=&ratefil);



/*************
 * Pasienter *
**************/

%let RV_variabelnavn= pasienter; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;



/***************
 * Kontakter   *
 ***************/


%let RV_variabelnavn= kontakter; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

proc datasets nolist;
delete KA_t:
run;
