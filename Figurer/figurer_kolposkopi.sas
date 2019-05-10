

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
%let xlabel= Number per 10,000 women;
%let label_1=Publ. hospital;
%let label_2=Priv. practice;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Examinations" &tabellvar2="Inhabitants";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland, sprak = en);


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
%let tittel=Antall polikliniske kontakter med cervix biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=Number per 10,000 women;
%let label_1=Publ. hospital;
%let label_2=Priv. practice;
%let tabellvar1=tot_antall;
%let tabellvariable= &tabellvar1;
%let labeltabell=&tabellvar1="Contacts";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland, sprak = en);

%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._bohf,bohf_format=bohf_kort_Nordland, bildeformat=pdf, sprak = en);


/***************************************************/
/* Lag figur konsultasjoner tot kolp og /eller biop, med andel off i tabell                 */
/***************************************************/

%let tema=kolpORbiop_p;

%let dsn1=&tema._poli_bohf;
%let rv1=&tema._poli;

%let dsn2=&tema._off_bohf;
%let rv2=&tema._off;

%let dsn3=&tema._priv_bohf;
%let rv3=&tema._priv;

%let dsn4=kolp_p_priv_bohf;
%let rv4=kolp_p_priv;

%merge(ant_datasett=4, dsn_ut=&tema._bohf); 

%let fignavn=;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med kolposkopi og/eller cervix biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=andel_2_1;
%let tabellvar2=antall_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="% public" &tabellvar2="Contacts";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 percent8.1 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_kolp1(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig_kolp1(datasett=&tema._bohf, bildeformat=pdf );

%let vis_aarsvar=0;
/***************************************************/
/* Lag figur konsultasjoner tot kolp og /eller biop, off/priv (til faktaark)                 */
/***************************************************/

%let tema=kolpORbiop_p;

%let dsn1=&tema._poli_bohf;
%let rv1=&tema._poli;

%let dsn2=&tema._priv_bohf;
%let rv2=&tema._priv;


%merge(ant_datasett=2, dsn_ut=&tema._offpriv_bohf); 

%let fignavn=offpriv;
%let type=unders;
%let tittel=Antall polikliniske undersøkelser med kolposkopi og/eller cervix biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=andel_2_1;
%let tabellvar2=antall_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Private" &tabellvar2="Contacts";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 percent8.1 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._offpriv_bohf, sprak = en);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._offpriv_bohf, bildeformat=pdf, sprak = en);


%let vis_aarsvar=1;
/***************************************************/
/* Lag andelsfigur: konsultasjoner tot kolp og /eller biop, med kons/pers  */
/***************************************************/

%let tema=kolpORbiop_p;

%let dsn1=&tema._poli_bohf;
%let rv1=&tema._poli;

%let dsn2=&tema._poli_unik_bohf;
%let rv2=&tema._poli_unik;


%merge(ant_datasett=2, dsn_ut=&tema._prprs_bohf); 

%let Andel=andel_1_2;
%let fignavn=kons_pr_pers;
%let type=unders;
%let tittel=Konsultasjoner/pers. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Proportion;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Contacts" &tabellvar2="Personer";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0 andel2 comma8.1 ;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._prprs_bohf, sprak = en);

%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._prprs_bohf, bildeformat=pdf, sprak = en);


/*Tredelt figur bare kolp, kolp+biop, bare biop - Alle polikl kontakter */

%let tema=kolp_biop;
%let fignavn=tot;
%let anno=ANNO;
%let tittel=Antall polikliniske undersøkelser med kolposkopi/biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar4=tot_antall;/*fra forbruksmal*/
%let tabellvariable= &tabellvar1;* &tabellvar2 &tabellvar3 &tabellvar4;
%let label_1=Bare kolposkopi;
%let label_2=Kolposkopi med biopsi;
%let label_3=Bare biopsi;
%let labeltabell=&tabellvar1="Kolp.";* &tabellvar2="Kolp. med biopsi" &tabellvar3="Biopsi" &tabellvar4="Contacts";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=kolp_p_poli, del2=kolp_biop_p_poli, del3=biop_p_poli);


%let mappe=&mappe_pdf;
%ratefig_tredeltSoyle(del1=kolp_p_poli, del2=kolp_biop_p_poli, del3=biop_p_poli, bildeformat=pdf );

/*Tredelt figur bare kolp, kolp+biop, bare biop - Kontaker på sykehus */

%let tema=kolp_biop;
%let fignavn=off;
%let anno=ANNO;
%let tittel=Antall polikliniske undersøkelser på sykehus med kolposkopi/biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar4=tot_antall;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3 &tabellvar4;
%let label_1=Bare kolposkopi;
%let label_2=Kolposkopi med biopsi;
%let label_3=Bare biopsi;
%let labeltabell=&tabellvar1="Kolp." &tabellvar2="Kolp. med biopsi" &tabellvar3="Biopsi" &tabellvar4="Alle kont.";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=kolp_p_off, del2=kolp_biop_p_off, del3=biop_p_off);


/*Tredelt figur bare kolp, kolp+biop, bare biop - Kontaker hos avtalespesialist */

%let tema=kolp_biop;
%let fignavn=priv;
%let anno=ANNO;
%let tittel=Antall polikliniske undersøkelser hos avtalespesialist med kolposkopi/biopsi per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=Andel&del1.;/*fra forbruksmal*/
%let tabellvar2=Andel&del2.;/*fra forbruksmal*/
%let tabellvar3=Andel&del3.;/*fra forbruksmal*/
%let tabellvar4=tot_antall;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3 &tabellvar4;
%let label_1=Bare kolposkopi;
%let label_2=Kolposkopi med biopsi;
%let label_3=Bare biopsi;
%let labeltabell=&tabellvar1="Kolp." &tabellvar2="Kolp. med biopsi" &tabellvar3="Biopsi" &tabellvar4="Alle kont.";

%let mappe=&mappe_png;
%ratefig_tredeltSoyle(del1=kolp_p_priv, del2=kolp_biop_p_priv, del3=biop_p_priv);


/*ANDELSFIGUR: Kontakter hos avtalespesialist med kolposkopi som andel av alle kontakter hos gynekologisk avtalespesialist.*/

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
%let xlabel= Proportion;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="With colposcopy" &tabellvar2="All contacts";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._Akolp_bohf, labelcol=black, sprak = en);

%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._Akolp_bohf, bildeformat=pdf, labelcol=black, sprak = en);



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
%let xlabel= Proportion;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=andel_1_2;
%let tabellvariable=;
%let labeltabell=&tabellvar1="Med kolposkopi" &tabellvar2="Alle kontakter" &tabellvar3="Prop.";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0 &tabellvar3 percent8.1;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._off_bohf, sprak = en);

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
%let xlabel= Proportion;
%let tabellvar1=antall_1;
%let tabellvar2=tot_antall;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bare kolposkopi" &tabellvar2="Kolp. og/eller biopsi";
%let formattabell=bohf bohf_kort_Nordland. &tabellvar1 comma8.0 &tabellvar2 comma8.0 &tabellvar3 percent8.1;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema._priv_bohf, sprak = en);

%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema._priv_bohf, bildeformat=pdf, sprak = en);

/*0-100, tredelt søyle, andel av kontakter med cervixbiopsi som har tilstandskode for hhv kreft, forstadier og andre */

%let tema=cervix;

%let dsn1=&tema._C_dp_poli_bohf;
%let rv1=&tema._C_dp_poli;

%let dsn2=&tema._DN_dp_poli_bohf;
%let rv2=&tema._DN_dp_poli;

%let dsn3=&tema._U_dp_poli_bohf;
%let rv3=&tema._U_dp_poli;

%merge(ant_datasett=3, dsn_ut=&tema._CDNU_bohf); 

data &tema._CDNU_bohf;
set &tema._CDNU_bohf;
andel_CDNU=1;
andel_CDN=(rate_1+rate_2)/(rate_1+rate_2+rate_3);
andel_C=rate_1/(rate_1+rate_2+rate_3);
plass_scatter=0.1;
andel_C_text=cat('C53', put(andel_C, percent8.1));
rate_CDN=rate_1+rate_2;
run;

proc sort data=&tema._CDNU_bohf;
by descending andel_CDN;
run;

%let mappe=&mappe_pdf;

ODS Graphics ON /reset=All imagename="&tema._unders_CDNU" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
proc sgplot data=&tema._CDNU_bohf noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=andel_CDNU / fillattrs=(color=CX95BDE6)  outlineattrs=(color=CX00509E) missing name="hp1" legendlabel="Other"; 
hbarparm category=bohf response=andel_CDN  / fillattrs=(color=CX568BBF)  outlineattrs=(color=CX00509E) missing name="hp2" legendlabel="D06/N87"; 
hbarparm category=bohf response=andel_C    / fillattrs=(color=CX00509E)  outlineattrs=(color=CX00509E) missing name="hp3" legendlabel="C53"; 
where bohf ne 8888;
	*scatter x=plass_scatter y=bohf /datalabel=andel_C_text datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
	where bohf ne 8888;
	 keylegend "hp3" "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=6);
	   Yaxistable andel_C /Label="C53" location=inside labelpos=top position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);
     yaxis display=(noticks noline) label='Hospital referral area' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=8);
     xaxis display=(nolabel) offsetmin=0.02 offsetmax=0.02 valueattrs=(size=8) label="Prop." labelattrs=(size=8 weight=bold);
	*label rate_CDN="rate C53/D06/N87";
format bohf bohf_kort_nordland. andel_CDNU andel_CDN andel_C percent8.1 rate_CDN comma8.0;


run;ods listing close;

%let mappe=&mappe_png;


/* Lager datasett for Instant Atlas */
%Let beskrivelse=kolpbiop_rate;
data helseatl.IA_gyn_&beskrivelse;
  set kolpORbiop_p_poli_bohf (keep = bohf Ratesnitt kolpORbiop_p_poli innbyggere rename=(Ratesnitt=Rate kolpORbiop_p_poli=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 1;
Niva = 4;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/* Lager datasett for Instant Atlas */
%Let beskrivelse=kolpAS_andel;
data helseatl.IA_gyn_&beskrivelse;
  set kolposkopi_Akolp_bohf (keep = bohf andel_1_2 antall_1 antall_2 rename=(andel_1_2=Andel antall_1=Antall antall_2=innbyggere)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 1;
Niva = 5;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/* Lager datasett for Instant Atlas */
%Let beskrivelse=cervix_rate;
data helseatl.IA_gyn_&beskrivelse;
  set cervix_biopsi_p_bohf (keep = bohf tot_rate tot_antall innbyggere rename=(tot_rate=Rate tot_antall=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 1;
Niva = 6;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

