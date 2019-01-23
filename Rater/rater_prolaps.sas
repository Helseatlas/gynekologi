

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=prolaps);


%let agg_var = prolaps_dp;
%rater_felles(privat=0);

proc datasets nolist;
delete KA_t:
run;