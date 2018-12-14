/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=diagEndo);


%let agg_var = diagEndoB_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = diagEndoU_p;
%rater_felles(kun_total = 1);

%let agg_var = diagEndo_bl_dp;
%rater_felles(kun_total = 1);

/* Alder 16-55 - Premenopausale/fertil alder*/
%Let aldersspenn=in (16:55);

%let agg_var = diagEndoB_A_dp;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = diagEndoU_A_dp;
%rater_felles(kun_total = 1);

/*Alder 50-105 - Postmenopausale*/

%alders_oppslag(utvalg=PostmenBlod);

%let agg_var = PostmenBlodB_dp;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = PostmenBlodU_dp;
%rater_felles(kun_total = 1);



/*Aldersspesifikke rater for diagEndo*/

%Let Alderskategorier=30;

/*Under 50*/
%Let aldersspenn=in (16:49);

%let agg_var = diagEndoB_p;
%let Ratefil=helseatl.k_u_&agg_var._fix_18;

%let RV_variabelnavn= poli; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn._u50; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn._u50; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%let agg_var = diagEndoU_p;
%let Ratefil=helseatl.k_u_&agg_var._18;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn._u50; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn._u50; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

/*Over 50*/
%Let aldersspenn=in (50:105);

%let agg_var = diagEndoB_p;
%let Ratefil=helseatl.k_u_&agg_var._fix_18;

%let RV_variabelnavn= poli; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn._o50; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn._o50; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%let agg_var = diagEndoU_p;
%let Ratefil=helseatl.k_u_&agg_var._18;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn._o50; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn._o50; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;


proc datasets nolist;
delete KA_t:
run;