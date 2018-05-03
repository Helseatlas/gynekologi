%let agg_var = Hyster_Aapen_dp; *D-diagnose, P-prosedure;
%Let aldersspenn=in (17:95); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 �r*/

/*
2. mai 2018
Hysterektomi kj�rer ikke rater_felles.sas.
Fikk flere feilmeldinger.
*/


%let Ratefil=helseatl.k_u_&agg_var;

%Let Alderskategorier=30; /*20, 21, 30, 31, 40, 41, 50, 51 eller 99
							20=2-delt med alle aldre, 21=2-delt KUN med aldre med RV
							30 3-delt med alle aldre, 31=3-delt KUN med aldre med RV
							40=4-delt med alle aldre, 41=4-delt KUN med aldre med RV
							50 5-delt med alle aldre, 51=5-delt KUN med aldre med RV
							99=Egendefinert(99) */
%macro Alderkat; /*M� fylles inn dersom egendefinert alderskategorier*/
if 0<=alder<=14 then alder_ny=1; 
else if 15<=alder<=49 then alder_ny=2;
else if 50<=alder<=64 then alder_ny=3;
else if 65<=alder<=79 then alder_ny=4;
else if 80<=alder then alder_ny=5;
%mend;



/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= tot; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = Hysterektomi - aapen; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

/****************************************************************/
/****************************************************************/


%let agg_var = Hyster_Vaginal_dp;
%let Ratefil=helseatl.k_u_&agg_var;

%let ratenavn = &agg_var;



/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= tot; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = Hysterektomi - vaginal; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;



/****************************************************************/
/****************************************************************/

%let agg_var = Hyster_Lap_dp;
%let Ratefil=helseatl.k_u_&agg_var;

%let ratenavn = &agg_var;



/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= tot; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = Hysterektomi - lapraskopisk; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;



/****************************************************************/
/****************************************************************/



%let agg_var = Hysterektomi_dp;
%let Ratefil=helseatl.k_u_&agg_var;

%let ratenavn = &agg_var;



/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= tot; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = Hysterektomi - total; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

