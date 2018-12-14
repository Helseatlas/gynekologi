***************;
/*ANALYSE FOR SSB-befolkningen:*/
* andel av totalbefolkningen som er henholdsvis 16-55 år og 56+;

data populasjon2015_17;
  set populasjon2015_17;
       if alder<=55 then aldersgruppe='a_16_55';
  else if alder>55  then aldersgruppe='b_56plus';
  sum_alder=alder*innbyggere;
run;

proc means data=populasjon2015_17 noprint nway;
  class bohf aar aldersgruppe;
  var innbyggere sum_alder;
  output out=antall_kv_bohf_aar_gruppe  sum=n_innb tot_alder;
run;

data antall_kv_bohf_aar_gruppe;
  set antall_kv_bohf_aar_gruppe;
  snitt_alder=tot_alder/n_innb;
run;


proc means data=antall_kv_bohf_aar_gruppe noprint nway;
  class bohf aldersgruppe;
  var n_innb;
  output out=antall_kv_bohf_gruppe  mean=n_innb;
run;

proc transpose data=antall_kv_bohf_gruppe out=antall_kv_bohf2 (drop= _name_ _label_);
  by bohf;
  id aldersgruppe;
  var n_innb;
run;


proc means data=antall_kv_bohf_aar_gruppe noprint nway;
  class  aar aldersgruppe;
  var n_innb;
  output out=antall_kv_norge_aar_gruppe  sum=n_innb;
run;


proc means data=antall_kv_norge_aar_gruppe noprint nway;
  class   aldersgruppe;
  var n_innb;
  output out=antall_kv_norge_gruppe  mean=n_innb;
run;


proc transpose data=antall_kv_norge_gruppe out=antall_kv_norge (drop= _name_ _label_);
  id aldersgruppe;
  var n_innb;
run;

data antall_kv_norge;
  set antall_kv_norge;
  bohf=8888;
  format bohf $bohf_kort.;
run;

* total population for calculating percentage;
data popTOT2015_17;
  set innbygg.innb_2004_2016_bydel_allebyer;
  where alder in (16:105) and aar in (2014:2016);
  %boomraader;
  format bohf $bohf_kort.;
run;

proc means data=popTOT2015_17 noprint nway;
  class bohf aar;
  var innbyggere;
  output out=antall_tot_bohf_aar  sum=n_innb;
run;

proc means data=antall_tot_bohf_aar noprint nway;
  class bohf;
  var n_innb;
  output out=antall_tot_bohf(drop=_type_ _freq_) mean=n_innb;
run;

proc means data=popTOT2015_17 noprint nway;
  class aar;
  var innbyggere;
  output out=antall_tot_norge_aar(drop=_type_ _freq_) sum=n_innb;
run;


proc means data=antall_tot_norge_aar noprint nway;
  var n_innb;
  output out=antall_tot_norge(drop=_type_ _freq_) mean=n_innb;
run;


data antall_tot_norge;
  set antall_tot_norge;
  bohf=8888;
  format bohf $bohf_kort.;
run;

* merge all files into one;
data antall_tot_bohf;
  set antall_tot_bohf antall_tot_norge;
run;
proc sort data=antall_tot_bohf;
  by bohf;
run;

data antall_kv_bohf2;
  set antall_kv_bohf2 antall_kv_norge;
run;
proc sort data=antall_kv_bohf2;
  by bohf;
run;

data antall_bohf;
  merge antall_kv_bohf2(in=a) antall_tot_bohf(in=b);
  by bohf;

  kv_innb=sum(a_16_55,b_56plu);

  if bohf=8888 then do;
  andel_totbefN=kv_innb/n_innb;
  andel_totbefN_16_55=a_16_55/n_innb;
  andel_totbefN_56p=b_56plu/n_innb;
  andel_kv_16_plussN=kv_innb/kv_innb;
  andel_kv_16_55N=a_16_55/kv_innb;
  end;
  else do;
  andel_totbef=kv_innb/n_innb;
  andel_totbef_16_55=a_16_55/n_innb;
  andel_totbef_56p=b_56plu/n_innb;
  andel_kv_16_pluss=kv_innb/kv_innb;
  andel_kv_16_55=a_16_55/kv_innb;

  end;

  if bohf=8888 then andel_kv_16_55=andel_kv_16_55N;

  plass_scatter=0.2;

  format a_16_55 -- kv_innb 8. ;
run;

proc sort data=antall_bohf;
  by bohf;
run;

proc sort data=ssb_i_bo;
  by bohf;
run;

data antall_bohf_malder (drop=_freq_ _type_);
merge antall_bohf ssb_i_bo;
by bohf;

proc sort data=antall_bohf_malder;
  by descending andel_kv_16_55;
run;

ODS Graphics ON /reset=All imagename="Andel_BoHF_SSBbefolkningen" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=antall_bohf_malder noborder noautolegend sganno=annoSSB pad=(Bottom=5%);
hbarparm category=bohf response=andel_kv_16_pluss       / fillattrs=(color=CX95BDE6) missing name="hp1" legendlabel="56+ år"; 
hbarparm category=bohf response=andel_kv_16_55 / fillattrs=(color=CX00509E) missing name="hp2" legendlabel="16-55 år"; 
where bohf ne 8888;
/*hbarparm category=bohf response=andel_kv_16_plussN       / fillattrs=(color=CXC3C3C3);*/
/*hbarparm category=bohf response=andel_kv_16_55N / fillattrs=(color=CX4C4C4C);*/
	scatter x=plass_scatter y=bohf /datalabel=andel_kv_16_55 datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
	where bohf ne 8888;
	 	 keylegend "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=6);
	 Yaxistable snittalder_SSB_i /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.1 valueattrs=(size=7) label="Andel av totalbefolkningen" labelattrs=(size=7 weight=bold);
label snittalder_SSB_i="Gj.sn. alder";
format snittalder_SSB_i nlnum8.1 andel_totbef andel_totbef_16_55 andel_kv_16_55 andel_kv_16_55N andel_kv_16_pluss andel_kv_16_plussN nlpct8.;

title 'Andel 16-55 år (kvinner) - BoHF';

run;Title; ods listing close;

%let mappe=Figurer\Populasjon\fig_pdf\;

ODS Graphics ON /reset=All imagename="Andel_BoHF_SSBbefolkningen" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=antall_bohf_malder noborder noautolegend sganno=annoSSB pad=(Bottom=5%);
hbarparm category=bohf response=andel_kv_16_pluss       / fillattrs=(color=CX95BDE6) missing name="hp1" legendlabel="56+ år"; 
hbarparm category=bohf response=andel_kv_16_55 / fillattrs=(color=CX00509E) missing name="hp2" legendlabel="16-55 år"; 
where bohf ne 8888;
/*hbarparm category=bohf response=andel_kv_16_plussN       / fillattrs=(color=CXC3C3C3);*/
/*hbarparm category=bohf response=andel_kv_16_55N / fillattrs=(color=CX4C4C4C);*/
	scatter x=plass_scatter y=bohf /datalabel=andel_kv_16_55 datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
	where bohf ne 8888;
	 keylegend "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=6);
	 Yaxistable snittalder_SSB_i /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
     xaxis /*display=(nolabel)*/ offsetmin=0.02 offsetmax=0.1 valueattrs=(size=7) label="Andel av totalbefolkningen" labelattrs=(size=7 weight=bold);
label snittalder_SSB_i="Gj.sn. alder";
format snittalder_SSB_i nlnum8.1 andel_totbef andel_totbef_16_55 andel_kv_16_55 andel_kv_16_55N andel_kv_16_pluss andel_kv_16_plussN nlpct8.;

title 'Andel 16-55 år (kvinner) - BoHF';

run;Title; ods listing close;

%let mappe=Figurer\Populasjon\;