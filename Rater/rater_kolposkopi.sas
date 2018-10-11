/***********KOLPOSKOPI***********************/

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=kolposkopi);

%let agg_var = kontakt_avtspes;
%rater_felles(kun_total=1);

%let agg_var = kolposkopi_p;
%rater_felles(kun_poli=1);

%let agg_var = cervix_biopsi_p;
%rater_felles(kun_poli=1);

%let agg_var = kolp_p;
%rater_felles(kun_poli=1);

%let agg_var = kolp_biop_p;
%rater_felles(kun_poli=1);

%let agg_var = biop_p;
%rater_felles(kun_poli=1);






