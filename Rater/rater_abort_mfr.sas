%let Ratefil=helseatl.k_MFR_abort;

/*Alle*/

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = abort_&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = abort_&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;


/*Kirurgiske*/

%let RV_variabelnavn= kir; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = abort_&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = abort_&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;


/*Medisinske*/

%let RV_variabelnavn= med; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = abort_&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = abort_&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

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