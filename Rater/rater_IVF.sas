
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=IVF);


%let agg_var = IVF_p; *D-diagnose, P-prosedure;
%rater_felles(kun_total = 1);


%let agg_var = Insem_p; *D-diagnose, P-prosedure;
%rater_felles(kun_total = 1);

