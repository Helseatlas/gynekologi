
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=Infertil);


%let agg_var = Infertil_d; *D-diagnose, P-prosedure;
%rater_felles(kun_poli = 1);


%let agg_var = ZInfertil_d; *D-diagnose, P-prosedure;
%rater_felles(kun_poli = 1);

