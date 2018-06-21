
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=svkont);

%Let innbyggerfil=helseatl.svkont_fodsler;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontr_a_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontr_hr_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontr_n_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontr_od_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontr_t_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontUL_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd UL1T_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd UL2T_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd UL3T_tot_NORGE;
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
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkont_aUL_tot_NORGE;
run;

/*%forholdstall;*/


/*
For å ikke ødelegge for fremtidige rateberegninger må innbyggerfil defineres tilbake til original
*/
%Let innbyggerfil=Innbygg.innb_2004_2016_bydel_allebyer;
