%let agg_var = steril_p; *D-diagnose, P-prosedure;

/*%Let aldersspenn=in (25:55);*/ /*TAR IKKE MED DE UNDER 25 ÅR ELLER DE OVER 55 ÅR*/

%Let aldersspenn=in (16:105);

%rater_felles(kun_total = 1);

