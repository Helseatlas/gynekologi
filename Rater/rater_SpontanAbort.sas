
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=SpontanAbort);
*%Let aldersspenn=in (16:105);

%let agg_var = SpontanAbort_dp;
%rater_felles(privat=0);


