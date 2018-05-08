%let agg_var = KrafHypBlod_d;
%Let aldersspenn=in (17:55); /*TAR IKKE MED DE OVER 55 ÅR*/


%rater_felles;


%let agg_var = KrafHypBlod_dp;
%Let aldersspenn=in (17:55); /*TAR IKKE MED DE OVER 55 ÅR*/

%rater_felles(kun_total = 1);


