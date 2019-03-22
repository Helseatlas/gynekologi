/***********KOLPOSKOPI***********************/

/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=kolposkopi);

%let agg_var = kontakt_avtspes;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_total=1, Ratefil=helseatl.k_u_&agg_var._fix_18, unik = 0);

%let agg_var = kolposkopi_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18, unik = 0);

%let agg_var = cervix_biopsi_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, unik = 0, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = cervix_C_dp;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18, unik = 0);

%let agg_var = cervix_DN_dp;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18, unik = 0);

%let agg_var = cervix_U_dp;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = kolp_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = kolp_biop_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = biop_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = kolpORbiop_p;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);


proc datasets nolist;
delete KA_t:
run;



