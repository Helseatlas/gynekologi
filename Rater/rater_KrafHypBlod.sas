%let agg_var = KrafHypBlod_d;
/*%Let aldersspenn=in (16:55);*/ /*TAR IKKE MED DE OVER 55 ÅR*/
%Let aldersspenn=in (16:105);

%rater_felles(kun_poli=1);


%let agg_var = KrafHypBlod_dp;

%rater_felles(kun_total = 1);


