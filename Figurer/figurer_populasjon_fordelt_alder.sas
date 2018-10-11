/*Lager figur med NPRpopulasjonen fordelt på alder*/
ODS Graphics ON /reset=All imagename="antall_alder_NPRbefolkningen" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=NPR_p_alder noautolegend noborder sganno=anno pad=(Bottom=4% );
styleattrs datacolors=(CX00509E CX95BDE6) DATACONTRASTCOLORS=(CX00509E);
  vbarparm category=alder response=personer / fillattrs=(color=CX00509E) missing outlineattrs=(color=black);
	yaxis &yvalues label="Antall" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis values=(16 to 105 by 1) fitpolicy=thin offsetmin=0.035 
          label="Alder" labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Alle kvinner i grunnutvalget fordelt på alder';
run; Title; ods listing close;

/*Lager figur med kvinnebefolkningen fra SSB fordelt på alder*/;
ODS Graphics ON /reset=All imagename="antall_alder_SSBbefolkningen" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=SSB_i_alder noborder noautolegend sganno=anno pad=(Bottom=5%);
  vbarparm category=alder response=innbyggere / fillattrs=(color=CX00509E) missing;
  yaxis &yvalues label="Antall" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis values=(16 to 105 by 1) fitpolicy=thin offsetmin=0.035 
          label="Alder" labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Alle kvinner i Norge (SSB-populasjonen) fordelt på alder, gjennomsnitt for perioden 2015-2017';
run;Title; ods listing close;


/*Sorterer og merger SSB-populasjon og utvalgspopulasjon til ett datasett*/
proc sort data=utv_alder;
by alder;
run;

proc sort data=SSB_i_alder;
by alder;
run;

data utv_SSB_alder;
merge utv_alder SSB_i_alder;
by alder;
andel_utv_SSB=tot_unik/innbyggere;
run;


ODS Graphics ON /reset=All imagename="antall_alder_SSB_utvalg" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=utv_SSB_alder noborder noautolegend sganno=anno pad=(Bottom=5%);
  vbarparm category=alder response=innbyggere / fillattrs=(color=CX00509E) missing outlineattrs=(color=black)name="hp1" legendlabel="Antall kv. innbyggere";
  vbarparm category=alder response=tot_unik / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black)name="hp2" legendlabel="Antall i helseatlas";
  keylegend "hp2" "hp1"/ location=outside position=bottom down=2 noborder titleattrs=(size=6);
    yaxis &yvalues label="Antall" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis values=(16 to 105 by 1) fitpolicy=thin offsetmin=0.035 
          label="Alder" labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Alle kvinner 16-105 i Norge, snitt pr. år for 2015-2017';
run;Title; ods listing close;

ODS Graphics ON /reset=All imagename="andel_alder_utvalg_SSB" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=utv_SSB_alder noborder noautolegend sganno=anno pad=(Bottom=5%);
  vbarparm category=alder response=andel_utv_SSB / fillattrs=(color=CX00509E) missing outlineattrs=(color=black);
    yaxis &yvalues label="Andel i helseatlas av alle innbyggere" 
		labelattrs=(size=&fontst)  valuesformat=nlpct8.1 valueattrs=(size=&fontst);
	xaxis values=(16 to 105 by 1) fitpolicy=thin offsetmin=0.035 
          label="Alder" labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Alle kvinner 16-105 i Norge, snitt pr. år for 2015-2017';
run;Title; ods listing close;

/*Sorterer og merger SSB-populasjon, utvalgspopulasjon og NPR-populasjonen til ett datasett*/
proc sort data=utv_SSB_alder;
by alder;
run;

proc sort data=NPR_p_alder;
by alder;
run;

data NPR_utv_SSB_alder;
merge utv_SSB_alder NPR_p_alder;
by alder;
run;


ODS Graphics ON /reset=All imagename="antall_alder_SSB_utvalg_NPR" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=NPR_utv_SSB_alder noborder noautolegend sganno=anno pad=(Bottom=5%);
  vbarparm category=alder response=innbyggere / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp1" legendlabel="Antall kv. innbyggere";
  vbarparm category=alder response=personer / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="Antall i spes.helsetj.";
  vbarparm category=alder response=tot_unik / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="Antall i helseatlas";
  keylegend "hp3" "hp2" "hp1"/ location=outside position=bottom down=2 noborder titleattrs=(size=6);
    yaxis &yvalues label="Antall" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis values=(16 to 105 by 1) fitpolicy=thin offsetmin=0.035 
          label="Alder" labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Alle kvinner 16-105 i Norge, snitt pr. år for 2015-2017';
run;Title; ods listing close;

%let mappe=Figurer\Populasjon\fig_pdf\;

ODS Graphics ON /reset=All imagename="antall_alder_SSB_utvalg_NPR" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=NPR_utv_SSB_alder noborder noautolegend sganno=anno pad=(Bottom=5%);
  vbarparm category=alder response=innbyggere / fillattrs=(color=CX95BDE6) outlineattrs=(color=black) missing name="hp1" legendlabel="Antall kv. innbyggere";
  vbarparm category=alder response=personer / fillattrs=(color=CX568BBF) outlineattrs=(color=black) missing name="hp2" legendlabel="Antall i spes.helsetj.";
  vbarparm category=alder response=tot_unik / fillattrs=(color=CX00509E) outlineattrs=(color=black) missing name="hp3" legendlabel="Antall i helseatlas";
  keylegend "hp3" "hp2" "hp1"/ location=inside position=topright down=3 noborder titleattrs=(size=6);
    yaxis &yvalues label="Antall" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis values=(16 to 105 by 1) fitpolicy=thin offsetmin=0.035 
          label="Alder" labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Alle kvinner 16-105 i Norge, snitt pr. år for 2015-2017';
run;Title; ods listing close;

%let mappe=Figurer\Populasjon\;