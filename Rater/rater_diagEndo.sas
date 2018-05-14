
%let agg_var = diagEndoB_p;
%Let aldersspenn=in (16:97); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/

%rater_felles(kun_poli=1);

%let agg_var = diagEndoU_p;

%rater_felles(kun_total = 1);


