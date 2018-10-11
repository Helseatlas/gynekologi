
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=svkont);

%Let innbyggerfil=helseatl.svkont_fodsler;
%Let Alderskategorier=31;
%Let rate_pr=1;


/*ALLE KONTAKTER*/

%let agg_var=svkontakt;
%let Ratefil=helseatl.k_u_&agg_var._18;

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




/*
For å ikke ødelegge for fremtidige rateberegninger må innbyggerfil defineres tilbake til original
*/
%Let innbyggerfil=Innbygg.innb_2004_2017_bydel_allebyer;
