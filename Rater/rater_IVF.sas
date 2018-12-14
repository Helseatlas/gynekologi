
%alders_oppslag(utvalg=ivf);

%let agg_var = IVF_p;
%rater_felles(privat=0, innlegg = 0, hastegrad = 0);


proc datasets nolist;
delete KA_t:
run;
