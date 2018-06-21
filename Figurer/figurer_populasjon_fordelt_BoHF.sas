

***************;
/*Sorterer på antall innbyggere, så figuren får det BoHF med flest innbyggere på topp*/
proc sort data=NPR_p_bo;
  by descending personer_NPR_p;
run;

/*Lager figur med NPRpopulasjonen fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="antall_BoHF_NPRbefolkningen" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=NPR_p_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=personer_NPR_p / fillattrs=(color=CX00509E) missing; 
	 Yaxistable personer_NPR_p snittalder_NPR_p / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     label personer_NPR_p="Personer" snittalder_NPR_p="Gj.snitt alder";
	 format snittalder_NPR_p nlnum8.1;

     title 'Alle kvinner i grunnutvalget fordelt på BoHF';

run;Title; ods listing close;

***************;
/*Sorterer på gjennomsnittsalder*/
proc sort data=NPR_p_bo;
  by descending snittalder_NPR_p;
run;

/*Lager figur med NPRpopulasjonenes gjennomsnittsalder fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="snittalder_BoHF_NPRbefolkningen" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=NPR_p_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=snittalder_NPR_p / fillattrs=(color=CX00509E) missing; 
	 Yaxistable personer_NPR_p snittalder_NPR_p / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Gjennomsnittsalder' labelattrs=(size=7 weight=bold);
     label personer_NPR_p="Personer" snittalder_NPR_p="Gj.snitt alder";
	 format snittalder_NPR_p nlnum8.1;

     title 'Gjennomsnittsalder i grunnutvalget fordelt på BoHF';
run;Title; ods listing close;

proc sort data=SSB_i_bo;
by BoHF;
quit;

proc sort data=NPR_p_bo;
by BoHF;
quit;

proc sort data=utv_bo;
by BoHF;
quit;

data SSB_NPR_utv_bo;
merge SSB_i_bo NPR_p_bo utv_bo;
by BoHF;

aldersdiff_utv_SSB=snittalder_SSB_i - snittalder_utv;
aldersdiff_SSB_NPR=snittalder_NPR_p - snittalder_SSB_i;

run;

/*Sorterer på gjennomsnittsalder*/
proc sort data=SSB_NPR_utv_bo;
  by descending snittalder_NPR_P;
run;

/*Lager figur med gjennomsnittsalder fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="snittalder_BoHF_SSB_NPR_utvalg" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=SSB_NPR_utv_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=snittalder_NPR_p / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp1" legendlabel="NPR";
hbarparm category=bohf response=snittalder_SSB_i / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="SSB";
hbarparm category=bohf response=snittalder_utv / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="Helseatlas";
keylegend "hp3" "hp2" "hp1"/ location=outside position=bottom down=2 noborder titleattrs=(size=6);
	     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Gjennomsnittsalder' labelattrs=(size=7 weight=bold);

     title 'Gjennomsnittsalder fordelt på BoHF';
run;Title; ods listing close;

/*Sorterer på gjennomsnittsalder*/
proc sort data=SSB_NPR_utv_bo;
  by descending aldersdiff_utv_SSB;
run;

/*Lager figur med aldersforskjell SSB vs utvalg fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="aldersdiff_BoHF_SSB_utvalg" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=SSB_NPR_utv_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=aldersdiff_utv_SSB / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing ;
	     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Gjennomsnittsalder' labelattrs=(size=7 weight=bold);

     title 'Aldersforskjell mellom SSB-pop. og utvalgspop. fordelt på BoHF';
run;Title; ods listing close;

/*Sorterer på gjennomsnittsalder*/
proc sort data=SSB_NPR_utv_bo;
  by descending aldersdiff_SSB_NPR;
run;

/*Lager figur med aldersforskjell NPR vs SSB fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="aldersdiff_BoHF_NPR_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=SSB_NPR_utv_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=aldersdiff_SSB_NPR / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing ;
	     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Gjennomsnittsalder' labelattrs=(size=7 weight=bold);

     title 'Aldersforskjell mellom SSB-pop. og NPR-pop. fordelt på BoHF';
run;Title; ods listing close;



proc sort data=SSB_i_bo;
  by descending innbyggere_SSB_i;
run;

/*Lager figur med kvinnebefolkningen fra SSB fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="antall_BoHF_SSBbefolkningen" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=SSB_i_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing; 
		 Yaxistable innbyggere_SSB_i snittalder_SSB_i / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     label innbyggere_SSB_i="antall innbyggere" snittalder_SSB_i="Gj.snitt alder";
	 format innbyggere_SSB_i nlnum8.0 snittalder_SSB_i nlnum8.1;

     title 'Alle kvinner i Norge (SSB-populasjonen) fordelt på BoHF, gjennomsnitt for perioden 2014-2016';

run;Title; ods listing close;



proc sort data=utv_bo;
by BoHF;
quit;

proc sort data=SSB_i_bo;
by BoHF;
quit;

data utv_SSB_bo;
merge utv_bo SSB_i_bo;
by bohf;
andel_utv=tot_unik_utv/innbyggere_SSB_i;
plass=10000;
diff_alder=snittalder_SSB_i-snittalder_utv;
run;

proc sort data=utv_SSB_bo;
by descending innbyggere_SSB_i;
quit;

/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="antall_BoHF_utvalg_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=utv_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing outlineattrs=(color=black)name="hp1" legendlabel="Antall kv. innbyggere"; 
hbarparm category=bohf response=tot_unik_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp2" legendlabel="Antall i helseatlas"; 
	scatter x=plass y=bohf /datalabel=andel_utv datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
		keylegend "hp1" "hp2"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 Yaxistable snittalder_SSB_i snittalder_utv / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     label snittalder_SSB_i="Gj.snitt alder, SSB" snittalder_utv="Gj.snitt alder, utvalg";
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_utv nlnum8.1 andel_utv nlpct8.1;

     title 'Alle kvinner i Norge fordelt på BoHF, gjennomsnitt for perioden 2014-2016';

run;Title; ods listing close;



proc sort data=fodsler_bo;
by BoHF;
quit;

proc sort data=utv_SSB_bo;
by BoHF;
quit;

data fodsler_utv_SSB_bo;
merge fodsler_bo utv_SSB_bo;
by bohf;
andel_fod_SSB=tot_unik_fodsler/innbyggere_SSB_i;
andel_fod_utv=tot_unik_fodsler/tot_unik_utv;
plass=0.003;
diff_alder=snittalder_SSB_i-snittalder_fodsler;
run;

proc sort data=fodsler_utv_SSB_bo;
by descending andel_utv;
quit;


/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen (inkl andel fødende) fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="andel_BoHF_utvalg_SSB_fod" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=fodsler_utv_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=andel_utv / fillattrs=(color=CX00509E) missing outlineattrs=(color=black) name="hp1" legendlabel="Andel i atlas"; 
hbarparm category=bohf response=andel_fod_SSB / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp2" legendlabel="Andel fødende"; 
	scatter x=plass y=bohf /datalabel=andel_fod_utv datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
	 keylegend "hp1" "hp2"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	  Yaxistable snittalder_SSB_i snittalder_utv / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Andel i helseatlas av alle kvinner' labelattrs=(size=7 weight=bold);
     label snittalder_SSB_i="Gj.snitt alder, SSB" snittalder_utv="Gj.snitt alder, utvalg";
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_utv nlnum8.1 andel_fod_utv andel_utv andel_fod_SSB nlpct8.1;

     title 'Kvinner i helseatlas som andel av alle kvinner, fordelt på BoHF, gjennomsnitt for perioden 2014-2016';

run;Title; ods listing close;

proc sort data=kolp_bo;
by BoHF;
quit;

proc sort data=utv_SSB_bo;
by BoHF;
quit;

data kolp_utv_SSB_bo;
merge kolp_bo utv_SSB_bo;
by bohf;
andel_kolp_SSB=priv_unik_kolp/innbyggere_SSB_i;
andel_kolp_utv=priv_unik_kolp/tot_unik_utv;
plass=0.01;
diff_alder=snittalder_SSB_i-snittalder_kolp;
run;

proc sort data=kolp_utv_SSB_bo;
by descending andel_utv;
quit;


/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen (inkl andel kolposkoperte) fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="andel_BoHF_utvalg_SSB_kolp" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=kolp_utv_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
hbarparm category=bohf response=andel_utv / fillattrs=(color=CX00509E) missing outlineattrs=(color=black) name="hp1" legendlabel="Andel i atlas"; 
hbarparm category=bohf response=andel_kolp_SSB / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp2" legendlabel="Andel kolposkopi privat"; 
	scatter x=plass y=bohf /datalabel=andel_kolp_utv datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
	 keylegend "hp1" "hp2"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	  Yaxistable snittalder_SSB_i snittalder_kolp / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Andel i helseatlas av alle kvinner' labelattrs=(size=7 weight=bold);
     label snittalder_SSB_i="Snittalder, SSB" snittalder_kolp="Snittalder, kolp";
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_utv nlnum8.1 andel_kolp_utv andel_utv andel_kolp_SSB nlpct8.1;

     title 'Kvinner i helseatlas som andel av alle kvinner, fordelt på BoHF, gjennomsnitt for perioden 2014-2016';

run;Title; ods listing close;