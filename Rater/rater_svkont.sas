%Let innbyggerfil=helseatl.svkont_fodsler;

/*%Let aldersspenn=in (16:55);*/
%Let aldersspenn=in (16:105); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/
%Let Alderskategorier=31;

%Let rate_pr=1;


/*ALLE KONTAKTER*/

%let agg_var=svkontakt;
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


/*ALLE KONTROLLER*/

%let agg_var=svkontr_a;
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

/*ALLE KONTROLLER MED Z35*/

%let agg_var=svkontr_hr;
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

/*ALLE KONTROLLER MED Z34/Z369*/

%let agg_var=svkontr_n;
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

/*ALLE KONTROLLER MED O-DIAGNOSE*/

%let agg_var=svkontr_od;
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

/*ALLE KONTROLLER MED TAKST (NORMALTARIFFEN)*/

%let agg_var=svkontr_t;
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

/*ALLE UL I SVANGERSKAPET*/

%let agg_var=svkontUL;
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

/*ALLE UL I FØRSTE TRIMESTER*/

%let agg_var=UL1T;
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

/*ALLE UL I ANDRE TRIMESTER*/

%let agg_var=UL2T;
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

/*ALLE UL I TREDJE TRIMESTER*/

%let agg_var=UL3T;
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

/*ALLE KONTROLLER OG/ELLER UL I SVANGERSKAPET*/

%let agg_var=svkont_aUL;
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
