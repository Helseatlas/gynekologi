%let agg_var = instrformet;

/*Populasjon: alle vaginale fødsler, uten justering for paritet*/

%Let innbyggerfil=helseatl.k_MFR_alle_vag;

%Let aldjust=Ermann=0; /*Aktiveres KUN dersom KUN aldersjustering*/
%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */
%Let kjonn=(0); /*Dersom både menn og kvinner (0,1), dersom kun menn (1), dersom kun kvinner (0)*/

%let Ratefil=helseatl.k_MFR_&agg_var;

*TANG;

%let RV_variabelnavn=tang; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn._allevag; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);

*VAKUM;

%let RV_variabelnavn=vak; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn._allevag; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);