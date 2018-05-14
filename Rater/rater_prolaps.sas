
%let agg_var = prolaps_d;
%Let aldersspenn=in (18:101); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/


%rater_felles(kun_poli=1);


%let agg_var = prolaps_dp;
%Let aldersspenn=in (22:99); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/


%rater_felles(kun_total = 1);

