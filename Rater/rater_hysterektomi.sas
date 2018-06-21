/* Oppslag aldersbegrensning */

%alders_oppslag(utvalg=Hysterektomi);


/****************************************************************/
/* Teknikk                                                      */
/****************************************************************/

%let agg_var = Hyster_Aapen_dp; *D-diagnose, P-prosedure;
%rater_felles(kun_total = 1);


%let agg_var = Hyster_Vaginal_dp;
%rater_felles(kun_total = 1);


%let agg_var = Hyster_Lap_dp;
%rater_felles(kun_total = 1);

/****************************************************************/
/****************************************************************/

%let agg_var = Hysterektomi_dp;
%rater_felles(privat=0);

/****************************************************************/
/* Hyppiste diagnoser                                           */
/****************************************************************/

%let agg_var = Hyster_myom_dp;
%rater_felles(kun_total = 1);


%let agg_var = Hyster_blod_dp;
%rater_felles(kun_total = 1);

/****************************************************************/
/* Robot Assistert                                              */
/****************************************************************/

%let agg_var = Hyster_annen_dp;
%rater_felles(kun_total = 1);


%let agg_var = Hyster_robot_dp;
%rater_felles(kun_total = 1);


%let agg_var = Hyster_ikkerobot_dp;
%rater_felles(kun_total = 1);
