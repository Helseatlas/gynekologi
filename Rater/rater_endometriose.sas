/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=endometriose);



%let agg_var = endometriose_d;
%rater_felles;

%let agg_var = endometriose_dp;
%rater_felles(privat=0);
