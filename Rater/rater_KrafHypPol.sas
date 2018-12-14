/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=KrafHypBlod);


%let agg_var = KrafHypPol_dp;
%rater_felles(kun_total=1);

%let agg_var = KrafHypBlod_dp;
%rater_felles(kun_total=1);