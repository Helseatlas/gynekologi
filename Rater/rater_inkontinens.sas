
/***********INKONTINENS***********************/

%let agg_var = inkontinens_d;
%Let aldersspenn=in (17:100); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/

%rater_felles;


%let agg_var = inkontinens_dp;
%Let aldersspenn=in (18:96); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/


%rater_felles(kun_total = 1);
