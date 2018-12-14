
/***********INKONTINENS***********************/

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=inkontinens);


*%let agg_var = inkontinens_d;
*%rater_felles;


%let agg_var = inkontinens_dp;
%rater_felles(privat=0, unik = 0);

%let agg_var = s_inkontinens_dp;
%rater_felles(kun_total=1);

%let agg_var = a_inkontinens_dp;
%rater_felles(kun_total=1);

proc datasets nolist;
delete KA_t:
run;




