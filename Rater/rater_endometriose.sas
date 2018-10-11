/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=endometriose);



/*%let agg_var = endometriose_d;
%rater_felles;*/

/*mindre kirurgi*/
%let agg_var = endometriose_dp;
%rater_felles(privat=0);

/*hysterektomi*/
%let agg_var = endometriose_h_dp;
%rater_felles(kun_total=1);

/*åpen*/
%let agg_var = endometriose_a_dp;
%rater_felles(kun_total=1);

/*hlap*/
%let agg_var = endometriose_l_dp;
%rater_felles(kun_total=1);
