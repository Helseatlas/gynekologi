

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=prolaps);


%let agg_var = prolaps_d;
%rater_felles(kun_poli=1);


%let agg_var = prolaps_dp;
%rater_felles(privat=0);

