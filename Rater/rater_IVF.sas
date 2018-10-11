/*Datasett for aldersspesifikke rater*/



%Let Ut_sett=1;

%let agg_var = IVF_p;
%let Ratefil=helseatl.k_u_&agg_var._18;
%Let Alderskategorier=30;

%let aldersspenn=in (16:34);
 *D-diagnose, P-prosedure;

%let RV_variabelnavn= tot_unik_alleaar; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._alleaar; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._alleaar; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=IVF_p_alleaar_ujust_bohf);

data IVF_p_BoHF_16_34;
set IVF_p_alleaar_ujust_bohf;
run;

%let aldersspenn=in (35:38);

%let RV_variabelnavn= tot_unik_alleaar; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._alleaar; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._alleaar; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=IVF_p_alleaar_ujust_bohf);

data IVF_p_BoHF_35_38;
set IVF_p_alleaar_ujust_bohf;
run;

%let aldersspenn=in (39:55);

%let RV_variabelnavn= tot_unik_alleaar; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._alleaar; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._alleaar; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;


%forholdstall(ds=IVF_p_alleaar_ujust_bohf);

data IVF_p_BoHF_39_55;
set IVF_p_alleaar_ujust_bohf;
run;

%Let Ut_sett=;

/*Datasett for ikke-aldersspesifikke rater*/
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=ivf);

%let RV_variabelnavn= tot_unik_alleaar; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._alleaar; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._alleaar; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;

%let agg_var = Insem_p; *D-diagnose, P-prosedure;

%let Ratefil=helseatl.k_u_&agg_var._18;

%let RV_variabelnavn= tot_unik_alleaar; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._alleaar; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._alleaar; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall;


