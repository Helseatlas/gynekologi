* CHECK THAT MACROS SHOULD NOT ALTER THE OUTPUT FILES FROM RATEPROGRAM, E.G. HYSTEREKTOMI_BOHF, HYSTEREKTOMI_KREFT_BOHF, HYSTEREKTOMI_ANNEN_BOHF;
* CHANGE THE MACRO SO THAT WHAT WE GRAPH WITH IS MORE DYNAMIC, E.G. hbarparm category=bohf response=RATESNITT3;

/*OVERORDNET INPUT:*/




%let tema=IVF;



/*INPUT FOR HVER FIGUR:*/

%let agg_var2 = Insem_p; *D-diagnose, P-prosedure;
%let agg_var1 = IVF_p; *D-diagnose, P-prosedure;

%let dsn1=&agg_var1._alleaar_bohf; %let rv1=&agg_var1._alleaar;
%let dsn2=&agg_var2._alleaar_bohf; %let rv2=&agg_var2._alleaar;


%merge(ant_datasett=2, dsn_ut=merged_&tema);


/*INPUT FOR HVER FIGUR:*/

%let fignavn=IVF_IUI; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or unders�kelser;
%let tittel=Pasienter som har f�tt assistert befruktning ved IVF og inseminasjon ila 2015-2017. Aldersstandardiserte rater per 10 000 innbyggere. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Pasienter som har f�tt assistert befruktning ved IVF og inseminasjon ila 2015-2017, pr. 10 000 innbyggere. Aldersjusterte rater.;

* variables to use, and column and label names for the table on the right of the figure;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let label_2=Insem.;
%let label_1=IVF;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar2="Insem." &tabellvar1="IVF";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%ratefig_todeltSoyle(datasett=merged_&tema);


%let mappe=Figurer\NPR\fig_pdf;
%ratefig_todeltSoyle(datasett=merged_&tema, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;



/*Lager rankingtabell*/
/*proc sort data=merged_&tema;
by decending tot_rate;
run;

data rank_&tema;
set merged_&tema;
where BoHF ne 8888;
&tema._rank+1;
keep &tema._rank BoHF;
run;*/

/*%let dsnIVF=&agg_var2._tot_bohf; %let rv1=&agg_var2._tot;


%let fignavn=IVF;
%let tittel=Antall IVF (eggoverf�ring) per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= IVF (eggoverf�ring), pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&agg_var2._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="IVF" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;
%ratefig(datasett=&dsnIVF);


%let dsnIUI=&agg_var1._tot_bohf; %let rv1=&agg_var1._tot;

%let fignavn=IUI;
%let tittel=Antall IUI per 10 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Intrauterin inseminasjon (IUI), pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&agg_var1._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="IUI" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;
%ratefig(datasett=&dsnIUI);*/

%let tema=IVF_p;
%let rv1=&tema._alleaar;

%let fignavn=16_34;
%let type=inngr;
%let tittel=Personer som har f�tt in-vitro fertilisering ila 2015-2017. Rater per 10 000 innbyggere. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Personer som har f�tt in-vitro fertilisering ila 2015-2017, pr. 10 000 innbyggere i alderen 16-34 �r.;
%let tabellvar1=&tema._alleaar;
*%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Personer";* &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf_16_34);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig(datasett=&tema._bohf_16_34, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

%let fignavn=35_38;
%let type=inngr;
%let tittel=Personer som har f�tt in-vitro fertilisering ila 2015-2017. Rater per 10 000 innbyggere. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Personer som har f�tt in-vitro fertilisering ila 2015-2017, pr. 10 000 innbyggere i alderen 35-38 �r.;
%let tabellvar1=&tema._alleaar;
*%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Personer";* &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf_35_38);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig(datasett=&tema._bohf_35_38, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;

%let fignavn=39_55;
%let type=inngr;
%let tittel=Personer som har f�tt in-vitro fertilisering ila 2015-2017. Rater per 10 000 innbyggere. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Personer som har f�tt in-vitro fertilisering ila 2015-2017, pr. 10 000 innbyggere i alderen 39-55 �r.;
%let tabellvar1=&tema._alleaar;
*%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Personer";* &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&tema._bohf_39_55);

%let mappe=Figurer\NPR\fig_pdf;
%ratefig(datasett=&tema._bohf_39_55, bildeformat=pdf, noxlabel=1);
%let mappe=Figurer\NPR;


/*
%let agg_var1 = IVF_p; 
%let agg_var2 = Insem_p; 
%let agg_var3 = assbef;

%let dsn1=&agg_var1._tot_bohf; %let rv1=&agg_var1._tot;
%let dsn2=&agg_var2._tot_bohf; %let rv2=&agg_var2._tot;
%let dsn3=helseatl.k_mfr_&agg_var3._antfod_bohf; %let rv3=&agg_var3._Antall_fodsler;

%merge(ant_datasett=3, dsn_ut=merged_&tema._assbef);



%Let fignavn=assbef;
%let tittel=Antall inngrep ved in-vitro fertilisering og antall f�dsler. Aldersstandardiserte rater per 10 000 innbyggere. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= Assistert befruktning ved IVF og antall f�dsler, pr. 10 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="IVF+IUI" &tabellvar2="F�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%Let del1=IVF+IUI/4;
%Let del2=F�dsler;

proc sort data=merged_&tema._assbef;
by descending tot_rate;
run;

data merged_&tema._assbef;
set merged_&tema._assbef;
tot_rate_ny=tot_rate/4.0;
ntot_rate_ny=ntot_rate/4.0;
run;

ODS Graphics ON /reset=All imagename="&tema._&type._rate_&fignavn" imagefmt=png border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=merged_&tema._assbef noborder noautolegend sganno=anno pad=(Bottom=5%);


hbarparm category=bohf response=tot_rate_ny / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=black) name="hp1" legendlabel="&del1.";
hbarparm category=bohf response=ntot_rate_ny / fillattrs=(color=CXC3C3C3) outlineattrs=(color=black) ;		

hbarparm category=bohf response=rate_3 / barwidth=0.5 transparency=0.2 fillattrs=(color=CX00509E) missing outlineattrs=(color=black) name="hp2" legendlabel="&del2.";
hbarparm category=bohf response=nrate_3 / barwidth=0.5 transparency=0.2 fillattrs=(color=CX4C4C4C) outlineattrs=(color=black);		

keylegend "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7 weight=bold);
Yaxistable &tabellvariable /Label location=inside labelpos=bottom position=right valueattrs=(size=7 family=arial) labelattrs=(size=7);
yaxis display=(noticks noline) label='Opptaksomr�de' labelattrs=(size=7 weight=bold) type=discrete discreteorder=data valueattrs=(size=7);
xaxis display=(nolabel) offsetmin=0.02 offsetmax=0.02 &skala valueattrs=(size=7);
xaxis label="&xlabel" labelattrs=(size=7 weight=bold);

Label &labeltabell;
Format &formattabell;
run;Title; ods listing close;*/