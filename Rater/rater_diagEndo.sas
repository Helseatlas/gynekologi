/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=diagEndo);


%let agg_var = diagEndoB_p;
%rater_felles(kun_poli=1);

%let agg_var = diagEndoU_p;
%rater_felles(kun_total = 1);


