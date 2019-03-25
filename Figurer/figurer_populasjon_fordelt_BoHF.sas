


proc sql;
  create table UTV_NPR_SSB_bo as
  select *, 
    (tot_unik_utv/innbyggere_SSB_i) as andel_utv, 
	(personer_npr_p/innbyggere_SSB_i) as andel_NPR,
	(tot_unik_utv/personer_npr_p) as andel_utv_NPR, 
    (snittalder_SSB_i - snittalder_utv) as diff_alder, 
    (snittalder_SSB_i - snittalder_utv) as aldersdiff_utv_SSB,
    (snittalder_NPR_p - snittalder_SSB_i) as aldersdiff_SSB_NPR,
    2000 as plass
  from utv_bo a, npr_p_bo b, ssb_i_bo c
  where a.bohf=b.bohf=c.bohf;
quit;


%Let bildeformat=pdf;
%let mappe=Figurer\Populasjon\fig_pdf;

proc sort data=UTV_NPR_SSB_bo;
by descending andel_utv;
quit;

/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="andel_BoHF_utvalg_SSB" imagefmt=&bildeformat border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=UTV_NPR_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=andel_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=grey); 
    
	 Yaxistable andel_utv / Label location=inside labelpos=top position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);
     yaxis display=(noticks noline) label='Hospital referral areas' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=8);
     xaxis offsetmin=0.02 offsetmax=0.02  valueattrs=(size=8) label='Andel' labelattrs=(size=8 weight=bold);
     
	 label andel_utv="Prop.";
	 format andel_utv nlpct8.1;
     title 'Kvinner i helseatlas som andel av alle kvinner, fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title; ods listing close;

%let mappe=Figurer\Populasjon\;
%Let bildeformat=png;

/* Merge SSB with selected utvalg*/
%macro utvalg_ssb(utvalg=, tellevar=);
proc sql;
  create table &utvalg._utv_SSB_bo as
  select *, 
    &tellevar._&utvalg./innbyggere_SSB_i   as andel_&utvalg._SSB,
    &tellevar._&utvalg./tot_unik_utv       as andel_&utvalg._utv,
    snittalder_SSB_i-snittalder_&utvalg. as diff_alder_&utvalg.,
    0.003 as plass2
  from &utvalg._bo a, UTV_NPR_SSB_bo b
  where a.bohf=b.bohf
  order by andel_utv descending;
quit;

data &utvalg._utv_SSB_bo;
set &utvalg._utv_SSB_bo;
utv_minus_&utvalg=andel_utv-andel_&utvalg._SSB;
run;


/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="andel_BoHF_utvalg_SSB_&utvalg." imagefmt=&bildeformat border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&utvalg._utv_SSB_bo noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=andel_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=CX00509E) name="hp1" legendlabel="&label_utvalg"; 
     hbarparm category=bohf response=utv_minus_&utvalg / fillattrs=(color=CX00509E) missing outlineattrs=(color=CX00509E)name="hp2" legendlabel="Har ikke fått kolposkopi hos avt.spes."; 
	
	 *scatter x=plass2 y=bohf /datalabel=utv_minus_&utvalg datalabelpos=right markerattrs=(size=0) datalabelattrs=(color=white weight=bold size=8);
	 
	 keylegend "hp1" "hp2"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
	 
	 *Yaxistable snittalder_SSB_i snittalder_&utvalg. / Label location=inside labelpos=bottom position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);
     yaxis display=(noticks noline) label='Hospital referral area' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=8);
     xaxis offsetmin=0.02 offsetmax=0.02  valueattrs=(size=8) label='Andel' labelattrs=(size=8 weight=bold);
     
	 label snittalder_SSB_i="Snittalder, SSB" snittalder_&utvalg.="Snittalder, &utvalg.";
	 format innbyggere_SSB_i comma8.0 tot_unik_utv comma8.0 snittalder_SSB_i snittalder_utv snittalder_&utvalg.  comma8.1 andel_&utvalg._utv andel_utv andel_&utvalg._SSB utv_minus_&utvalg nlpct8.1;
     title 'Kvinner i helseatlas som andel av alle kvinner, fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title; ods listing close;

%mend;

%Let bildeformat=png;
%Let label_utvalg=Har fått kolposkopi hos avt.spes.;
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
