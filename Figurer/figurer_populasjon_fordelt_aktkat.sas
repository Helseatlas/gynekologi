/*GRUNNUTVALGET*/
/*Summerer over perioden*/
data pop_kvin16p_agg;
set skde_han.k_pop_kvin16p_agg;

if aar gt 2014 then do;
	suminn+inn;
	sumpoli_off+poli_off;
	sumpoli_priv+poli_priv;
	sumliggetid+eoc_liggetid;
end;
run;

/*Finner gjennomsnitt*/
data pop_gu_avg;
set pop_kvin16p_agg;
where aar=2017;
inn_avg=suminn/3;
poli_off_avg=sumpoli_off/3;
poli_priv_avg=sumpoli_priv/3;
liggetid_avg=sumliggetid/3;

keep popdata inn_avg poli_off_avg poli_priv_avg liggetid_avg;
run;

/*Deler i 4 datasett*/
data pop_gu_inn;
set pop_gu_avg;
aktkat=1;
rename inn_avg=antall_gu;
run;

data pop_gu_inn;
set pop_gu_inn;
keep aktkat antall_gu;
run;

data pop_gu_poli_off;
set pop_gu_avg;
aktkat=2;
rename poli_off_avg=antall_gu;
run;

data pop_gu_poli_off;
set pop_gu_poli_off;
keep aktkat antall_gu;
run;

data pop_gu_poli_priv;
set pop_gu_avg;
aktkat=3;
rename poli_priv_avg=antall_gu;
run;

data pop_gu_poli_priv;
set pop_gu_poli_priv;
keep aktkat antall_gu;
run;

data pop_gu_liggetid;
set pop_gu_avg;
aktkat=4;
rename liggetid_avg=antall_gu;
run;

data pop_gu_liggetid;
set pop_gu_liggetid;
keep aktkat antall_gu;
run;

/*UTVALGET*/
/*Summerer over perioden*/
data pop_utv_agg_mini;
set skde_han.k_pop_utv_agg_mini;

if aar gt 2014 then do;
	suminn+inn;
	sumpoli_off+poli_off;
	sumpoli_priv+poli_priv;
	sumliggetid+eoc_liggetid;
end;
run;

/*Finner gjennomsnitt*/
data pop_utv_avg;
set pop_utv_agg_mini;
where aar=2017;
inn_avg=suminn/3;
poli_off_avg=sumpoli_off/3;
poli_priv_avg=sumpoli_priv/3;
liggetid_avg=sumliggetid/3;

keep inn_avg poli_off_avg poli_priv_avg liggetid_avg;
run;

/*Deler i 4 datasett*/
data pop_utv_inn;
set pop_utv_avg;
aktkat=1;
rename inn_avg=antall_utv;
run;

data pop_utv_inn;
set pop_utv_inn;
keep aktkat antall_utv;
run;

data pop_utv_poli_off;
set pop_utv_avg;
aktkat=2;
rename poli_off_avg=antall_utv;
run;

data pop_utv_poli_off;
set pop_utv_poli_off;
keep aktkat antall_utv;
run;

data pop_utv_poli_priv;
set pop_utv_avg;
aktkat=3;
rename poli_priv_avg=antall_utv;
run;

data pop_utv_poli_priv;
set pop_utv_poli_priv;
keep aktkat antall_utv;
run;

data pop_utv_liggetid;
set pop_utv_avg;
aktkat=4;
rename liggetid_avg=antall_utv;
run;

data pop_utv_liggetid;
set pop_utv_liggetid;
keep aktkat antall_utv;
run;

/*KOLPOSKOPI*/

/*Summerer over perioden*/
data pop_kolp_mini;
set skde_han.k_pop_kolp_mini;

if aar gt 2014 then do;
	sumpoli_priv+poli_priv;
end;
run;

/*Finner gjennomsnitt*/
data pop_kolp_avg;
set pop_kolp_mini;
where aar=2017;
poli_priv_avg=sumpoli_priv/3;

keep poli_priv_avg;
run;

/*Setter på aktkat*/
data pop_kolp_poli_priv;
set pop_kolp_avg;
aktkat=3;
rename poli_priv_avg=antall_kolp;
run;

data pop_kolp_poli_priv;
set pop_kolp_poli_priv;
keep aktkat antall_kolp;
run;



/*FØDSLER*/

/*Summerer over perioden*/
/*data pop_fodsel_mini;
set skde_han.k_pop_fodsel_mini;

if aar gt 2014 then do;
	suminn+inn;
	sumliggetid+eoc_liggetid;
	
end;
run;*/

/*Finner gjennomsnitt*/
/*data pop_fodsel_avg;
set pop_fodsel_mini;
where aar=2017;
inn_avg=suminn/3;
liggetid_avg=sumliggetid/3;

keep inn_avg liggetid_avg;
run;*/

/*Setter på aktkat*/
/*data pop_fodsel_inn;
set pop_fodsel_avg;
aktkat=1;
rename inn_avg=antall_fodsel;
run;

data pop_fodsel_inn;
set pop_fodsel_inn;
keep aktkat antall_fodsel;
run;

data pop_fodsel_liggetid;
set pop_fodsel_avg;
aktkat=4;
rename liggetid_avg=antall_fodsel;
run;

data pop_fodsel_liggetid;
set pop_fodsel_liggetid;
keep aktkat antall_fodsel;
run;*/

/*SVANGERSKAPSKONTROLLER*/

/*Summerer over perioden*/
/*data pop_svkont_mini;
set skde_han.k_pop_svkont_mini;

if aar gt 2014 then do;
	sumpoli_off+poli_off;
end;
run;*/

/*Finner gjennomsnitt*/
/*data pop_svkont_avg;
set pop_svkont_mini;
where aar=2017;
poli_off_avg=sumpoli_off/3;

keep poli_off_avg;
run;*/

/*Setter på aktkat*/
/*data pop_svkont_poli_off;
set pop_svkont_avg;
aktkat=2;
rename poli_off_avg=antall_svkont;
run;

data pop_svkont_poli_off;
set pop_svkont_poli_off;
keep aktkat antall_svkont;
run;*/




/*Setter sammen igjen datasett*/
data pop_gu;
set pop_gu_inn pop_gu_poli_off pop_gu_poli_priv pop_gu_liggetid;
run;

data pop_utv;
set pop_utv_inn pop_utv_poli_off pop_utv_poli_priv pop_utv_liggetid;
run;

/*data pop_fodsel;
set pop_fodsel_inn pop_fodsel_liggetid;
run;*/

/*Sortere og merge til ett datasett*/

proc sort data=pop_gu;
by aktkat;
quit;

proc sort data=pop_utv;
by aktkat;
quit;

proc sort data=pop_kolp_poli_priv;
by aktkat;
quit;

/*proc sort data=pop_fodsel;
by aktkat;
quit;

proc sort data=pop_svkont_poli_off;
by aktkat;
quit;*/

proc format;
value aktkat
1='Innleggelser'
2='Poliklinikk sykehus'
3='Poliklinikk privat'
4='Liggedøgn';
quit;

data pop_aktkat;
merge pop_gu pop_utv pop_kolp_poli_priv /*pop_fodsel pop_svkont_poli_off*/;
by aktkat;
andel_utv=100*(antall_utv/antall_gu);
andel_kolp=100*(antall_kolp/antall_gu);
/*andel_fodsel=100*(antall_fodsel/antall_gu);
andel_svkont=100*(antall_svkont/antall_gu);*/
format aktkat aktkat.;
run;

/*Lager figur*/
ODS Graphics ON /reset=All imagename="andel_aktkat_utv_NPR" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
proc sgplot data=pop_aktkat noautolegend noborder sganno=anno pad=(Bottom=4% );
/*styleattrs datacolors=(CX00509E CX95BDE6) DATACONTRASTCOLORS=(CX00509E);*/
  vbarparm category=aktkat response=andel_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black);
  vbarparm category=aktkat response=andel_kolp / fillattrs=(color=CX568BBF) missing outlineattrs=(color=black) name="hp1" legendlabel="Kontakter med kolposkopi";
  /*vbarparm category=aktkat response=andel_fodsel / fillattrs=(color=CX00509E) missing outlineattrs=(color=black) name="hp2" legendlabel="Fødsler";
  vbarparm category=aktkat response=andel_svkont / fillattrs=(color=CXC3C3C3) missing outlineattrs=(color=black) name="hp3" legendlabel="Kontakter i svangerskapet";*/
  keylegend /*"hp2" "hp3"*/ "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	yaxis &yvalues label="Andel brukt av kvinner i helseatlas" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis &xvalues label="Type helsetjeneste" 
		labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Andel helsetjenester som forbrukes av kvinner i helseatlas (av alle helsetjenester til kvinner fra 16 år og oppover)';
run; Title; ods listing close;

/*PDF*/

%let mappe=Figurer\Populasjon\fig_pdf\;
/*Lager figur*/
ODS Graphics ON /reset=All imagename="andel_aktkat_utv_NPR" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
proc sgplot data=pop_aktkat noautolegend noborder sganno=anno pad=(Bottom=4% );
/*styleattrs datacolors=(CX00509E CX95BDE6) DATACONTRASTCOLORS=(CX00509E);*/
  vbarparm category=aktkat response=andel_utv / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black);
  vbarparm category=aktkat response=andel_kolp / fillattrs=(color=CX568BBF) missing outlineattrs=(color=black) name="hp1" legendlabel="Kontakter med kolposkopi";
  /*vbarparm category=aktkat response=andel_fodsel / fillattrs=(color=CX00509E) missing outlineattrs=(color=black) name="hp2" legendlabel="Fødsler";
  vbarparm category=aktkat response=andel_svkont / fillattrs=(color=CXC3C3C3) missing outlineattrs=(color=black) name="hp3" legendlabel="Kontakter i svangerskapet";*/
  keylegend /*"hp2" "hp3"*/ "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
	yaxis &yvalues label="Andel brukt av kvinner i helseatlas" 
		labelattrs=(size=&fontst)  valuesformat=&yformat. valueattrs=(size=&fontst);
	xaxis &xvalues label="Type helsetjeneste" 
		labelattrs=(size=&fontst) valuesformat=&yformat. valueattrs=(size=&fontst);

  title 'Andel helsetjenester som forbrukes av kvinner i helseatlas (av alle helsetjenester til kvinner fra 16 år og oppover)';
run; Title; ods listing close;

%let mappe=Figurer\Populasjon\;