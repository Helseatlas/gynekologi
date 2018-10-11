

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=kolposkopi_p;


%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med kolposkopi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med kolposkopi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Undersøkelser" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);


/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=cervix_biopsi_p;


%let dsn1=&tema._off_bohf;
%let rv1=&tema._off;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;
%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

%let fignavn=offpriv;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med cervix biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med cervix biopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=tot_antall;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Undersøkelser";
%let formattabell=&tabellvar1 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

/***************************************************/
/* Lag figur konsultasjoner todelt off/priv                 */
/***************************************************/

%let tema=k_b;

%let dsn1=kolp_p_poli_unik_bohf;
%let rv1=kolp_p_poli_unik;

%let dsn2=kolp_biop_p_poli_unik_bohf;
%let rv2=kolp_biop_p_poli_unik;

%let dsn3=biop_p_poli_unik_bohf;
%let rv3=biop_p_poli_unik;

%merge(ant_datasett=3, dsn_ut=&tema._unik_bohf); 

data &tema._unik_bohf;
set &tema._unik_bohf;
tot_rate_unik=rate_1+rate_2+rate_3;
ntot_rate_unik=nrate_1+nrate_2+nrate_3;
run;

data &tema._unik_bohf;
set &tema._unik_bohf;
keep tot_rate_unik ntot_rate_unik bohf;
run;

proc sort data=&tema._unik_bohf;
by bohf;
quit;

%let dsn1=kolp_p_off_bohf;
%let rv1=kolp_p_off;

%let dsn2=kolp_p_priv_bohf;
%let rv2=kolp_p_priv;

%let dsn3=kolp_biop_p_off_bohf;
%let rv3=kolp_biop_p_off;

%let dsn4=kolp_biop_p_priv_bohf;
%let rv4=kolp_biop_p_priv;

%let dsn5=biop_p_off_bohf;
%let rv5=biop_p_off;

%let dsn6=biop_p_priv_bohf;
%let rv6=biop_p_priv;

%merge(ant_datasett=6, dsn_ut=&tema._bohf); 

proc sort data=&tema._bohf;
by bohf;
quit;

data &tema._bohf2;
merge &tema._bohf &tema._unik_bohf;
by bohf;

antall_tot=antall_1+antall_2+antall_3+antall_4+antall_5+antall_6;

tot_rate=rate_1+rate_2+rate_3+rate_4+rate_5+rate_6;
ratesnitt=tot_rate;
ratesnitt2=tot_rate;

tot_rate_2015=rate_1_2015+rate_2_2015+rate_3_2015+rate_4_2015+rate_5_2015+rate_6_2015;
tot_rate_2016=rate_1_2016+rate_2_2016+rate_3_2016+rate_4_2016+rate_5_2016+rate_6_2016;
tot_rate_2017=rate_1_2017+rate_2_2017+rate_3_2017+rate_4_2017+rate_5_2017+rate_6_2017;

ntot_rate=nrate_1+nrate_2+nrate_3+nrate_4+nrate_5+nrate_6;
snittrate=ntot_rate;

rate_1=rate_1+rate_3+rate_5;
nrate_1=nrate_1+nrate_3+nrate_5;

andel_rate1=rate_1/tot_rate;

run;

%let fignavn=offpriv;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med kolposkopi og/eller cervix biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med kolposkopi og/eller cervix biopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let label_1=Offentlig;
%let label_2=Privat;
%let tabellvar1=antall_tot;
%let tabellvar2=tot_rate_unik;
%let tabellvar3=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Undersøkelser" &tabellvar2="Personer (rate)" &tabellvar3="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.0;
%let skala=;

%ratefig_todeltSoyle(datasett=&tema._bohf2);


%let vis_aarsvar=0;
%let vis_ft=0;

%let fignavn=;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med kolposkopi og/eller cervix biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med kolposkopi og/eller cervix biopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=andel_rate1;
%let tabellvar2=antall_tot;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Andel off" &tabellvar2="Unders.";
%let formattabell=&tabellvar1 NLpct8.1 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf2);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig(datasett=&tema._bohf2, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

%let vis_aarsvar=1;
%let vis_ft=1;

/*Lager rankingtabell*/
/*proc sort data=&tema._bohf;
by decending tot_rate;
run;

data rank_&tema;
set &tema._bohf;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;*/

%let tema=kolp_biop;
%let fignavn=tot;
%let anno=ANNO;
%let tittel=Antall polikliniske undersøkelser med kolposkopi/biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser med kolposkopi/biopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let label_1=Bare kolposkopi;
%let label_2=Kolposkopi med biopsi;
%let label_3=Bare biopsi;
%let labeltabell=&tabellvar1="Kolp." &tabellvar2="Kolp. med biopsi" &tabellvar3="Biopsi";

%ratefig_tredeltSoyle(del1=kolp_p_poli, del2=kolp_biop_p_poli, del3=biop_p_poli);


%let mappe=Figurer\NPR\fig_pdf;
%ratefig_tredeltSoyle(del1=kolp_p_poli, del2=kolp_biop_p_poli, del3=biop_p_poli, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

%let tema=kolp_biop;
%let fignavn=off;
%let anno=ANNO;
%let tittel=Antall polikliniske undersøkelser på sykehus med kolposkopi/biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser på sykehus med kolposkopi/biopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar4=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3 &tabellvar4;
%let label_1=Bare kolposkopi;
%let label_2=Kolposkopi med biopsi;
%let label_3=Bare biopsi;
%let labeltabell=&tabellvar1="Kolp." &tabellvar2="Kolp. med biopsi" &tabellvar3="Biopsi" &tabellvar4="Innbyggere";

%ratefig_tredeltSoyle(del1=kolp_p_off, del2=kolp_biop_p_off, del3=biop_p_off);

%let tema=kolp_biop;
%let fignavn=priv;
%let anno=ANNO;
%let tittel=Antall polikliniske undersøkelser hos avtalespesialist med kolposkopi/biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Polikliniske undersøkelser hos avtalespesialist med kolposkopi/biopsi, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar4=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3 &tabellvar4;
%let label_1=Bare kolposkopi;
%let label_2=Kolposkopi med biopsi;
%let label_3=Bare biopsi;
%let labeltabell=&tabellvar1="Kolp." &tabellvar2="Kolp. med biopsi" &tabellvar3="Biopsi" &tabellvar4="Innbyggere";

%ratefig_tredeltSoyle(del1=kolp_p_priv, del2=kolp_biop_p_priv, del3=biop_p_priv);

%let tema=kolposkopi;

%let dsn1=kolposkopi_p_priv_bohf;
%let rv1=kolposkopi_p_priv;

%let dsn2=kontakt_avtspes_tot_bohf;
%let rv2=kontakt_avtspes_tot;
%merge(ant_datasett=2, dsn_ut=&tema._Akolp_bohf); 

%let Andel=andel_1_2;
%let fignavn=kolp_alleavtspes;
%let type=unders;
%let tittel=Kontakter hos avtalespesialist med kolposkopi som andel av alle kontakter hos gynekologisk avtalespesialist. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Kontakter hos avtalespesialist med kolposkopi som andel av alle kontakter hos gynekologisk avtalespesialist. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Med kolposkopi" &tabellvar2="Alle kontakter";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._Akolp_bohf);

%let mappe=Figurer\NPR\fig_pdf;
%andelsfig(datasett=&tema._Akolp_bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;


/*ANDEL KOLPOSKOPI AV ALLE KOLP/BIOP			OFF */

%Let tema=kolp_biop;

%let dsn1=kolp_p_off_bohf;
%let rv1=kolp_p_off;

%let dsn2=kolp_biop_p_off_bohf;
%let rv2=kolp_biop_p_off;

%let dsn3=biop_p_off_bohf;
%let rv3=biop_p_off;

%merge(ant_datasett=3, dsn_ut=&tema._off_bohf); 

data &tema._off_bohf;
set &tema._off_bohf;

tot_rate=rate_1+rate_2+rate_3;

andel_kolp=rate_1/tot_rate;


run;

%let Andel=andel_kolp;
%let fignavn=kolp_off;
%let type=unders;
%let tittel=Kontakter på sykehus med bare kolposkopi som andel av alle kontakter med kolposkopi og/eller biopsi. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Kontakter på sykehus med bare kolposkopi som andel av alle kontakter med kolposkopi og/eller biopsi. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=andel_1_2;
%let tabellvariable=;
%let labeltabell=&tabellvar1="Med kolposkopi" &tabellvar2="Alle kontakter" &tabellvar3="Andel";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLpct8.1;
%let skala=;

%andelsfig(datasett=&tema._off_bohf);

/*ANDEL KOLPOSKOPI AV ALLE KOLP/BIOP			PRIV */

%let dsn1=kolp_p_priv_bohf;
%let rv1=kolp_p_priv;

%let dsn2=kolp_biop_p_priv_bohf;
%let rv2=kolp_biop_p_priv;

%let dsn3=biop_p_priv_bohf;
%let rv3=biop_p_priv;

%merge(ant_datasett=3, dsn_ut=&tema._priv_bohf); 

data &tema._priv_bohf;
set &tema._priv_bohf;

tot_rate=rate_1+rate_2+rate_3;
tot_antall=antall_1+antall_2+antall_3;

andel_kolp=rate_1/tot_rate;

run;

%let Andel=andel_kolp;
%let fignavn=kolp_priv;
%let type=unders;
%let tittel=Kontakter hos avtalespesialist med bare kolposkopi som andel av alle kontakter med kolposkopi og/eller biopsi. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Kontakter hos avtalespesialist med bare kolposkopi som andel av alle kontakter med kolposkopi og/eller biopsi. Aldersjusterte rater.;
%let tabellvar1=antall_1;
%let tabellvar2=tot_antall;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bare kolposkopi" &tabellvar2="Kolp. og/eller biopsi";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLpct8.1;
%let skala=;

%andelsfig(datasett=&tema._priv_bohf);

%let mappe=Figurer\NPR\fig_pdf;
%andelsfig(datasett=&tema._priv_bohf, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;