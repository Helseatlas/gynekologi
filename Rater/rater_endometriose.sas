/***********INKONTINENS***********************/

%let agg_var = endometriose_d;
%let Ratefil=helseatl.k_u_&agg_var;

%Let aldersspenn=in (17:55); /*TAR IKKE MED DE OVER 55 ÅR*/
%Let Alderskategorier=30; /*20, 21, 30, 31, 40, 41, 50, 51 eller 99
							20=2-delt med alle aldre, 21=2-delt KUN med aldre med RV
							30 3-delt med alle aldre, 31=3-delt KUN med aldre med RV
							40=4-delt med alle aldre, 41=4-delt KUN med aldre med RV
							50 5-delt med alle aldre, 51=5-delt KUN med aldre med RV
							99=Egendefinert(99) */
%macro Alderkat; /*Må fylles inn dersom egendefinert alderskategorier*/
if 0<=alder<=14 then alder_ny=1; 
else if 15<=alder<=49 then alder_ny=2;
else if 50<=alder<=64 then alder_ny=3;
else if 65<=alder<=79 then alder_ny=4;
else if 80<=alder then alder_ny=5;
%mend;




/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= poli_off; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._off; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._off; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;


/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= poli_priv; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._priv; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._priv; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

data &agg_var._unik;
set helseatl.k_u_&agg_var;
if poli_off_unik ne . and poli_priv_unik ne . then poli_unik=poli_off_unik + poli_priv_unik;
else if poli_off_unik =. then poli_unik= poli_priv_unik;
else if poli_priv_unik =. then poli_unik= poli_off_unik;
run;

%let Ratefil=&agg_var._unik;

/******  DATAGRUNNLAG  ****************************************************************/
%let RV_variabelnavn= poli_unik; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._pers; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._pers; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;


