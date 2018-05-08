%let agg_var = IVF_p; *D-diagnose, P-prosedure;
%Let aldersspenn=in (20:45); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/

%rater_felles(kun_total = 1);


%let agg_var = Insem_p; *D-diagnose, P-prosedure;

%rater_felles(kun_total = 1);

