

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


/* Merge 3 files together : utvalg (helseatlas), NPR (spes.helsetj.), and SSB) */

proc sql;
  create table UTV_NPR_SSB_bo as
  select *, 
    (tot_unik_utv/innbyggere_SSB_i) as andel_utv, 
    (snittalder_SSB_i - snittalder_utv) as diff_alder, 
    (snittalder_SSB_i - snittalder_utv) as aldersdiff_utv_SSB,
    (snittalder_NPR_p - snittalder_SSB_i) as aldersdiff_SSB_NPR,
    2000 as plass
  from utv_bo a, npr_p_bo b, ssb_i_bo c
  where a.bohf=b.bohf=c.bohf;
quit;


/*Sorterer på gjennomsnittsalder*/
proc sort data=UTV_NPR_SSB_bo;
  by descending snittalder_NPR_P;
run;

/*Lager figur med gjennomsnittsalder fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="snittalder_BoHF_SSB_NPR_utvalg" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=UTV_NPR_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=snittalder_NPR_p / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp1" legendlabel="NPR";
     hbarparm category=bohf response=snittalder_SSB_i / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="SSB";
     hbarparm category=bohf response=snittalder_utv   / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="Helseatlas";
	 
     keylegend "hp3" "hp2" "hp1"/ location=outside position=bottom down=2 noborder titleattrs=(size=6);
	 
	 yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Gjennomsnittsalder' labelattrs=(size=7 weight=bold);

     title 'Gjennomsnittsalder fordelt på BoHF';
run;Title; ods listing close;



/*Sorterer på gjennomsnittsalder*/
proc sort data=UTV_NPR_SSB_bo;
  by descending aldersdiff_utv_SSB;
run;

/*Lager figur med aldersforskjell SSB vs utvalg fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="aldersdiff_BoHF_SSB_utvalg" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=UTV_NPR_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
     
	 hbarparm category=bohf response=aldersdiff_utv_SSB / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing ;
	 
	 yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Gjennomsnittsalder' labelattrs=(size=7 weight=bold);

     title 'Aldersforskjell mellom SSB-pop. og utvalgspop. fordelt på BoHF';
run;Title; ods listing close;



/*Sorterer på gjennomsnittsalder*/
proc sort data=UTV_NPR_SSB_bo;
  by descending aldersdiff_SSB_NPR;
run;

/*Lager figur med aldersforskjell NPR vs SSB fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="aldersdiff_BoHF_NPR_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=UTV_NPR_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);
     
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

     title 'Alle kvinner i Norge (SSB-populasjonen) fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title; ods listing close;

/*PDF*/

%let mappe=Figurer\Populasjon\fig_pdf\;

ODS Graphics ON /reset=All imagename="antall_BoHF_SSBbefolkningen" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=SSB_i_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing; 
	
     Yaxistable innbyggere_SSB_i /*snittalder_SSB_i*/ / Label location=inside labelpos=top position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
	 
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis display=(nolabel) offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
	 
     label innbyggere_SSB_i="Innbyggere" /*snittalder_SSB_i="Gj.snitt alder"*/;
	 format innbyggere_SSB_i nlnum8.0 snittalder_SSB_i nlnum8.1;

     title 'Alle kvinner i Norge (SSB-populasjonen) fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title; ods listing close;

%let mappe=Figurer\Populasjon\;


/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
proc sort data=utv_npr_SSB_bo;
  by descending innbyggere_SSB_i;
run;

ODS Graphics ON /reset=All imagename="antall_BoHF_utvalg_NPR_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=utv_npr_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing outlineattrs=(color=black)name="hp1" legendlabel="Antall kv. innbyggere"; 
     hbarparm category=bohf response=personer_npr_p / fillattrs=(color=CX568BBF) missing outlineattrs=(color=black)name="hp2" legendlabel="Antall i spes.helsetj."; 
     hbarparm category=bohf response=tot_unik_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp3" legendlabel="Antall i helseatlas"; 
	 
	 scatter x=plass y=bohf /datalabel=andel_utv datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
     keylegend "hp1" "hp2" "hp3"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 
	 Yaxistable  snittalder_utv snittalder_npr_p snittalder_SSB_i/ Label location=inside labelpos=top position=right valueattrs=(size=7 family=arial) labelattrs=
	 (size=7);
     
	 yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     
	 label snittalder_SSB_i="Gj.snitt alder, SSB" snittalder_npr_p="Gj.snitt alder, NPR" snittalder_utv="Gj.snitt alder, utvalg";
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_NPR_p snittalder_utv nlnum8.1 andel_utv nlpct8.1;
     title 'Alle kvinner i Norge fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title;

/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
proc sort data=utv_npr_SSB_bo;
  by descending innbyggere_SSB_i;
run;

ODS Graphics ON /reset=All imagename="antall_BoHF_NPR_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=utv_npr_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing outlineattrs=(color=black)name="hp1" legendlabel="Antall kv. innbyggere"; 
     hbarparm category=bohf response=personer_npr_p / fillattrs=(color=CX568BBF) missing outlineattrs=(color=black)name="hp2" legendlabel="Antall i spes.helsetj."; 
     /*hbarparm category=bohf response=tot_unik_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp3" legendlabel="Antall i helseatlas"; */
	 
	 scatter x=plass y=bohf /datalabel=andel_utv datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
     keylegend "hp1" "hp2" /*"hp3"*/ / location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 
	 Yaxistable  /*snittalder_utv*/ snittalder_npr_p snittalder_SSB_i/ Label location=inside labelpos=top position=right valueattrs=(size=7 family=arial) labelattrs=
	 (size=7);
     
	 yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/	 offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     
	 label snittalder_SSB_i="Gj.snitt alder, SSB" snittalder_npr_p="Gj.snitt alder, NPR" /*snittalder_utv="Gj.snitt alder, utvalg"*/;
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_NPR_p snittalder_utv nlnum8.1 andel_utv nlpct8.1;
     title 'Alle kvinner i Norge fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title;

/*PDF*/

%let mappe=Figurer\Populasjon\fig_pdf\;


ODS Graphics ON /reset=All imagename="antall_BoHF_NPR_SSB" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=utv_npr_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing outlineattrs=(color=black)name="hp1" legendlabel="Antall kv. innbyggere"; 
     hbarparm category=bohf response=personer_npr_p / fillattrs=(color=CX568BBF) missing outlineattrs=(color=black)name="hp2" legendlabel="Antall i spes.helsetj."; 
     /*hbarparm category=bohf response=tot_unik_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp3" legendlabel="Antall i helseatlas"; */
	 
	 scatter x=plass y=bohf /datalabel=andel_utv datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
     keylegend "hp1" "hp2" /*"hp3"*/ / location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 
	 *Yaxistable  /*snittalder_utv*/ snittalder_npr_p snittalder_SSB_i/ Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs= (size=7);
	 *label snittalder_SSB_i="Gj.snitt alder, SSB" snittalder_npr_p="Gj.snitt alder, NPR" /*snittalder_utv="Gj.snitt alder, utvalg"*/;
	 
     Yaxistable innbyggere_SSB_i /*snittalder_SSB_i*/ / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     label innbyggere_SSB_i="Innbyggere" /*snittalder_SSB_i="Gj.snitt alder"*/;
	 
	 yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis display=(nolabel) offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     
	 
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_NPR_p snittalder_utv nlnum8.1 andel_utv nlpct8.1;
     title 'Alle kvinner i Norge fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title;

%let mappe=Figurer\Populasjon\;


/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
proc sql;
  create table UTV_minus_kolp_NPR_SSB_bo as
  select *, 
    (tot_unik_utv_minus_kolp/innbyggere_SSB_i) as andel_utv, 
    (snittalder_SSB_i - snittalder_utv_minus_kolp) as diff_alder, 
    (snittalder_SSB_i - snittalder_utv_minus_kolp) as aldersdiff_utv_SSB,
    (snittalder_NPR_p - snittalder_SSB_i) as aldersdiff_SSB_NPR,
    2000 as plass
  from utv_minus_kolp_bo a, npr_p_bo b, ssb_i_bo c
  where a.bohf=b.bohf=c.bohf
  order by  innbyggere_SSB_i descending;
run;

ODS Graphics ON /reset=All imagename="antall_BoHF_utvalg_minus_kolp_NPR_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=UTV_minus_kolp_NPR_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=innbyggere_SSB_i / fillattrs=(color=CX00509E) missing outlineattrs=(color=black)name="hp1" legendlabel="Antall kv. innbyggere"; 
     hbarparm category=bohf response=personer_npr_p / fillattrs=(color=CX568BBF) missing outlineattrs=(color=black)name="hp2" legendlabel="Antall i spes.helsetj."; 
     hbarparm category=bohf response=tot_unik_utv_minus_kolp / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp3" legendlabel="Antall i helseatlas (minus kolp)"; 
	 
	 scatter x=plass y=bohf /datalabel=andel_utv datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
     keylegend "hp1" "hp2" "hp3"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 
	 Yaxistable  snittalder_utv_minus_kolp snittalder_npr_p snittalder_SSB_i/ Label location=inside labelpos=top position=right valueattrs=(size=7 family=arial) labelattrs=
	 (size=7);
     
	 yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Antall innbyggere (kvinner)' labelattrs=(size=7 weight=bold);
     
	 label snittalder_SSB_i="Gj.snitt alder, SSB" snittalder_npr_p="Gj.snitt alder, NPR" snittalder_utv_minus_kolp="Gj.snitt alder, utvalg";
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_NPR_p snittalder_utv_minus_kolp nlnum8.1 andel_utv nlpct8.1;
     title 'Alle kvinner i Norge fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title;


/* Merge SSB with selected utvalg*/
%macro utvalg_ssb(utvalg=, tellevar=);
proc sql;
  create table &utvalg._utv_SSB_bo as
  select *, 
    &tellevar._&utvalg./innbyggere_SSB_i   as andel_&utvalg._SSB,
    &tellevar._&utvalg./tot_unik_utv       as andel_&utvalg._utv,
    snittalder_SSB_i-snittalder_&utvalg. as diff_alder_&utvalg.,
    0.01 as plass2
  from &utvalg._bo a, UTV_NPR_SSB_bo b
  where a.bohf=b.bohf
  order by andel_utv descending;
quit;

/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="andel_BoHF_utvalg_SSB_&utvalg." imagefmt=&bildeformat border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&utvalg._utv_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=andel_utv / fillattrs=(color=CX00509E) missing outlineattrs=(color=black) name="hp1" legendlabel="Andel i atlas"; 
     hbarparm category=bohf response=andel_&utvalg._SSB / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp2" legendlabel="&label_utvalg"; 
	
	 scatter x=plass2 y=bohf /datalabel=andel_&utvalg._utv datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
	 
	 keylegend "hp1" "hp2"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 
	 *Yaxistable snittalder_SSB_i snittalder_&utvalg. / Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis display=(nolabel) offsetmin=0.02 offsetmax=0.02  valueattrs=(size=7) label='Andel i helseatlas av alle kvinner' labelattrs=(size=7 weight=bold);
     
	 label snittalder_SSB_i="Snittalder, SSB" snittalder_&utvalg.="Snittalder, &utvalg.";
	 format innbyggere_SSB_i nlnum8.0 tot_unik_utv nlnum8.0 snittalder_SSB_i snittalder_utv snittalder_&utvalg. nlnum8.1 andel_&utvalg._utv andel_utv andel_&utvalg._SSB nlpct8.1;
     title 'Kvinner i helseatlas som andel av alle kvinner, fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title; ods listing close;

%mend;

%Let bildeformat=png;
%Let label_utvalg=Andel som har fått kolposkopi;
*%utvalg_ssb(utvalg=fodsler, tellevar= tot_unik);
%utvalg_ssb(utvalg=kolp, tellevar= priv_unik);

%Let bildeformat=pdf;
%let mappe=Figurer\Populasjon\fig_pdf;
%utvalg_ssb(utvalg=kolp, tellevar= priv_unik);

%let mappe=Figurer\Populasjon\;
%Let bildeformat=png;

/*%Let label_utvalg=Andel &utvalg;
%utvalg_ssb(utvalg=diagEndoU, tellevar= tot_unik);
%utvalg_ssb(utvalg=diagEndoB, tellevar= poli_unik);
%utvalg_ssb(utvalg=steril, tellevar= tot_unik);
%utvalg_ssb(utvalg=SpontanAbort, tellevar= tot_unik);
%utvalg_ssb(utvalg=endometriose, tellevar= tot_unik);
%utvalg_ssb(utvalg=IVF, tellevar= tot_unik);
%utvalg_ssb(utvalg=insem, tellevar= tot_unik);
%utvalg_ssb(utvalg=inkontinens, tellevar= tot_unik);
%utvalg_ssb(utvalg=myom, tellevar= tot_unik);
%utvalg_ssb(utvalg=prolaps, tellevar= tot_unik);
%utvalg_ssb(utvalg=PostmenBlod, tellevar= poli_unik);
%utvalg_ssb(utvalg=KrafHypBlod, tellevar= tot_unik);
%utvalg_ssb(utvalg=hysterektomi, tellevar=tot_unik);*/














/**********************************/
