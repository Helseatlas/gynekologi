/* Oppslag aldersbegrensning */

%alders_oppslag(utvalg=Hysterektomi);

/****************************************************************/
/* Teknikk 5 �r for trend                                       */
/****************************************************************/
%let Start�r=2013;
%let Slutt�r=2017;
%Let aar=2016; /* Standardiserings�r defineres her*/

%let agg_var = Hyster_Aapen_dp; *D-diagnose, P-prosedure;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._t);


%let agg_var = Hyster_Vaginal_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._t);


%let agg_var = Hyster_Lap_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._t);

/****************************************************************/
/* Robot Assistert 5 �r for trend                               */
/****************************************************************/

%let agg_var = Hyster_annen_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._t);


%let agg_var = Hyster_robot_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._t);


%let agg_var = Hyster_ikkerobot_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._t);

/* set it back for future usage */
%let Start�r=2015;
%let Slutt�r=2017;
%Let aar=2016; /* Standardiserings�r defineres her*/


/****************************************************************/
/* Teknikk                                                      */
/****************************************************************/

%let agg_var = Hyster_Aapen_dp; *D-diagnose, P-prosedure;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);


%let agg_var = Hyster_Vaginal_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);


%let agg_var = Hyster_Lap_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);

/****************************************************************/
/****************************************************************/

%let agg_var = Hysterektomi_dp;
%rater_felles(privat=0, Ratefil=helseatl.k_u_&agg_var._18);

/****************************************************************/
/* Hyppiste diagnoser                                           */
/****************************************************************/

%let agg_var = Hyster_myom_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);


%let agg_var = Hyster_blod_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);

/****************************************************************/
/* Robot Assistert                                              */
/****************************************************************/

%let agg_var = Hyster_annen_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);


%let agg_var = Hyster_robot_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);


%let agg_var = Hyster_ikkerobot_dp;
%rater_felles(kun_total = 1, Ratefil=helseatl.k_u_&agg_var._18);

