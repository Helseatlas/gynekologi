
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=steril);


%let agg_var = steril_p; *D-diagnose, P-prosedure;
%rater_felles(privat=0);

%let agg_var = steril_a_p; *D-diagnose, P-prosedure;
%rater_felles(kun_total=1);

%let agg_var = steril_ia_p; *D-diagnose, P-prosedure;
%rater_felles(kun_total=1);

proc datasets nolist;
delete KA_t:
run;