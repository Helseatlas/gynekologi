/***************************************************/
/* Lag figur inngrep                 */
/***************************************************/

%let tema=KrafHypPol_dp;

%let dsn1=&tema._tot_bohf;
%let rv1=&tema._tot;

%let fignavn=;
%let type=inngr;
%let tittel=Antall inngrep for kraftige/hyppige blødninger og endometriepolypper per 10 000 kvinner. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=&tema._tot;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Inngrep";* &tabellvar2="Pasienter";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._tot_bohf, bildeformat=pdf );


%let tema=KrafHyp;

%let dsn1=&tema.Pol_dp_tot_bohf;
%let rv1=&tema.Pol_dp_tot;

%let dsn2=&tema.Blod_dp_tot_bohf;
%let rv2=&tema.Blod_dp_tot;

%merge(ant_datasett=2, dsn_ut=&tema._bohf); 

proc sort data=&tema._bohf;
by descending rate_1;
quit;

%let mappe=&mappe_pdf;
/*Lager figur med kvinnebefolkningen fra SSB og utvalgspopulasjonen fordelt på BoHF*/
ODS Graphics ON /reset=All imagename="KrafHypPol_KrafHypBlod" imagefmt=pdf border=off ;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&tema._bohf noborder noautolegend sganno=anno pad=(Bottom=5%);

     hbarparm category=bohf response=rate_1 / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=CX00509E) name="hp1" legendlabel="Med polypper";
	 hbarparm category=bohf response=rate_2 / fillattrs=(color=CX00509E) missing outlineattrs=(color=CX00509E) name="hp2" legendlabel="Uten polypper";
	 
	 keylegend "hp1" "hp2"/ location=inside position=bottomright down=2 noborder titleattrs=(size=6);
    
	 Yaxistable antall_1 antall_2/ Label location=inside labelpos=bottom position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);
     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=8);
     xaxis offsetmin=0.02 offsetmax=0.02  valueattrs=(size=8) label='Antall pr. 10 000 kvinner' labelattrs=(size=8 weight=bold);
     
	 label antall_1="Inngrep, med polypper" antall_2="Inngrep, uten polypper";
	 format antall_1 antall_2 nlnum8.0;
     title 'Inngrep for kraftige/hyppige blødninger og polypper pr 10 000 kvinner, fordelt på BoHF, gjennomsnitt for perioden 2015-2017';

run;Title; ods listing close;

%let mappe=&mappe_png;

