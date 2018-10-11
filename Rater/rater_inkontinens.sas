
/***********INKONTINENS***********************/

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=inkontinens);


%let agg_var = inkontinens_d;
%rater_felles;


%let agg_var = inkontinens_dp;
%rater_felles(privat=0);



/* Lager datasett for Instant Atlas */
data janice.IA_gyn_&agg_var;
  set &agg_var._tot_bohf (keep = bohf RateSnitt Antall innbyggere rename=(rateSnitt=Rate)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 4;
Niva = 13;

numeric = "numeric";
Tom_rad = "tom";
Tom_rute = "tom";
run;