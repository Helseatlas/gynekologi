%let agg_var = assbef;

%let Ratefil=helseatl.k_MFR_&agg_var;

%let RV_variabelnavn= Antall_fodsler; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;