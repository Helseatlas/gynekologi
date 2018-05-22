

%let agg_var = endometriose_d;

/*%Let aldersspenn=in (16:55);*/ /*TAR IKKE MED DE OVER 55 ÅR*/
%Let aldersspenn=in (16:105);

%rater_felles;

%let agg_var = endometriose_dp;

%rater_felles(kun_total = 1);
