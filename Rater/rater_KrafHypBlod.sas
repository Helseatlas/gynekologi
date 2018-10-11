

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=krafHypBlod);

*%let agg_var = KrafHypBlod_d;
*%rater_felles(kun_poli=1);


%let agg_var = KrafHypBlod_dp;
%rater_felles(privat=0);

%let agg_var = KHB_dp;
%rater_felles(privat=0);

%let agg_var = KHB_h_dp;
%rater_felles(privat=0);

/*%let agg_var=KunKHB_dp;
%rater_felles(kun_total = 1);*/



