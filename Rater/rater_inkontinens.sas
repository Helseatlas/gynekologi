
/***********INKONTINENS***********************/

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=inkontinens);


%let agg_var = inkontinens_d;
%rater_felles;


%let agg_var = inkontinens_dp;
%rater_felles(privat=0);
