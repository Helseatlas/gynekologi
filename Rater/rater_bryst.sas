/***********REKONSTRUKSJON***********************/

%let agg_var = rekonstruksjon_p;
%let Ratefil=helseatl.k_u_&agg_var;

%Let aldersspenn=in (16:105); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 �r*/
%Let Alderskategorier=31; /*20, 21, 30, 31, 40, 41, 50, 51 eller 99
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
%Let ratevariabel = rekonstruksjon; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

/***********REDUKSJON***********************/

%let agg_var = reduksjon_p;
%let Ratefil=helseatl.k_u_&agg_var;

%let ratenavn = &agg_var;



/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= tot; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = reduksjon; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;




