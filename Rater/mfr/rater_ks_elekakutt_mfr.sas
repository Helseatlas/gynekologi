/*RATER*/

/*Populasjon: f�rstegangsf�dende*/

%let agg_var = alle_par0ks;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let innbyggerfil=helseatl.k_MFR_alle_par0;

%Let aldjust=Ermann=0; /*Aktiveres KUN dersom KUN aldersjustering*/
%Let standard = Aldersstandardiserte; /*Brukes til � lage figur og tabell-overskrifter */
%Let kjonn=(0); /*Dersom b�de menn og kvinner (0,1), dersom kun menn (1), dersom kun kvinner (0)*/

%let RV_variabelnavn= innbyggere; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._PopPar0; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);

/*Populasjon: flergangsf�dende*/

%let agg_var = alle_par1ks;

%let Ratefil=helseatl.k_MFR_&agg_var;

%Let innbyggerfil=helseatl.k_MFR_alle_par1;

%let RV_variabelnavn= innbyggere; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._PopPar1; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%dele_stor_tabell;
%forholdstall(ds=&forbruksmal.UJ_bohf);