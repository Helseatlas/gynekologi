/*Populasjon: alle fødende, uten justering for parietet*/

%Let innbyggerfil=helseatl.k_MFR_alle;

/*Ikke justering for parietet*/
%Let aldjust=Ermann=0; /*Aktiveres KUN dersom KUN aldersjustering*/
%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */
%Let kjonn=(0); /*Dersom både menn og kvinner (0,1), dersom kun menn (1), dersom kun kvinner (0)*/

/*Paritet 0*/

%let agg_var = alle_par0;

%let Ratefil=helseatl.k_MFR_&agg_var;

%let RV_variabelnavn= innbyggere; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);


/*Paritet 1*/


%let agg_var = alle_par1;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */

%let RV_variabelnavn= innbyggere; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);



/*Populasjon: alle førstegangsfødende, uten justering for parietet*/

%Let innbyggerfil=helseatl.k_MFR_alle_par0;

/*Vaginal fødsel*/

%let agg_var = alle_par0vag;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */

%let RV_variabelnavn= innbyggere; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);


/*Keisersnitt*/

%let agg_var = alle_par0ks;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */

%let RV_variabelnavn= innbyggere; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);

/*Populasjon: alle flergangsfødende, uten justering for parietet*/

%Let innbyggerfil=helseatl.k_MFR_alle_par1;

/*Vaginal fødsel*/

%let agg_var = alle_par1vag;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */

%let RV_variabelnavn= innbyggere; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);

/*Keisersnitt*/

%let agg_var = alle_par1ks;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */

%let RV_variabelnavn= innbyggere; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);



