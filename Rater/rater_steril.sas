
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=steril);


%let agg_var = steril_p; *D-diagnose, P-prosedure;
%rater_felles(kun_total = 1);

