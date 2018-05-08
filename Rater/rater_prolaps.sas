
%let agg_var = prolaps_d;
%Let aldersspenn=in (18:101); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/


%rater_felles;


%let agg_var = prolaps_dp;
%Let aldersspenn=in (16:105); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/


%rater_felles(kun_total = 1);

