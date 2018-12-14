
/* Oppslag aldersbegrensning */
%alders_oppslag(utvalg=PostmenBlod);


%let agg_var = PostmenBlod_d;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);

%let agg_var = PostmenBlod_dp;
%nordland_priv_fix(inndata=helseatl.k_u_&agg_var._18, utdata=helseatl.k_u_&agg_var._fix_18);
%rater_felles(kun_poli=1, Ratefil=helseatl.k_u_&agg_var._fix_18);


proc datasets nolist;
delete KA_t:
run;