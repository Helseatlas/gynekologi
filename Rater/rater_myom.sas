
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=myom);

%let agg_var = myom_d;
%rater_felles(kun_poli=1);


%let agg_var = myom_dp;
%rater_felles(privat=0);

/*%let agg_var=KunMyom_dp;
%rater_felles(kun_total = 1);

%let agg_var=MyomKHB_dp;
%rater_felles(kun_total = 1);*/