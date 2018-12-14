/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=inkontinens);


%let agg_var = TransCer_dp;
%rater_felles(kun_total=1);

%let agg_var = TC_polypp_dp;
%rater_felles(kun_total=1);

%let agg_var = TC_blod_dp;
%rater_felles(kun_total=1);

%let agg_var = TC_annen_dp;
%rater_felles(kun_total=1);
