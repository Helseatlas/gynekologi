
%Let innbyggerfil=helseatl.polibarsel_fodsler;


/*%Let aldersspenn=in (16:55);*/
%Let aldersspenn=in (16:105); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/
%Let Alderskategorier=31;

%Let rate_pr=10;

/*********
 * Total kontakter i barseltid *
**********/

%let agg_var=barselkont;
%let Ratefil=helseatl.k_u_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

/*********
 * Total kontakter første 7 dager i barseltid *
**********/

%let agg_var=barselkont7d;
%let Ratefil=helseatl.k_u_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

/*%forholdstall;*/

/*********
 * Total kontakter med barselrelevant kode i barseltid *
**********/

%let agg_var=barsel_kode;
%let Ratefil=helseatl.k_u_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

/*%forholdstall;*/

/*********
 * Total kontakter med barselrelevant kode første 7 dager i barseltid *
**********/

%let agg_var=barsel_kode7d;
%let Ratefil=helseatl.k_u_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

/*%forholdstall;*/

/*
For å ikke ødelegge for fremtidige rateberegninger må innbyggerfil defineres tilbake til original
*/
%Let innbyggerfil=Innbygg.innb_2004_2016_bydel_allebyer;
