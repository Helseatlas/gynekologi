/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=endometriose);



%let agg_var = endometriose_d;
%rater_felles(kun_poli=1, unik = 0);

/*mindre kirurgi*/
%let agg_var = endometriose_dp;
%rater_felles(kun_total=1);

/*hysterektomi*/
%let agg_var = endometriose_h_dp;
%rater_felles(kun_total=1);

/*?pen*/
%let agg_var = endometriose_a_dp;
%rater_felles(kun_total=1);

/*Lap*/
%let agg_var = endometriose_l_dp;
%rater_felles(kun_total=1);

/*Vag*/
%let agg_var = endometriose_v_dp;
%rater_felles(kun_total=1);

proc datasets nolist;
delete KA_t:
run;