%macro ratefig_kolp1(datasett=, aar1=2015, aar2=2016, aar3=2017, bildeformat=png, noxlabel=0,sprak=no);

/*Setter aktuelle rater i datasettet til missing hvis antall observasjoner er under grensen (nkrav)*/
Data &datasett;
set &datasett;
Length Mistext $ 10;
if &rv1 lt &nkrav then do;
     ratesnitt=.;
	 rate&aar1=.; rate&aar2=.; rate&aar3=.; min=.; max=.;
     Mistext="N<&nkrav";
     Plassering=Norge/100;
end;
run;

/*Forholdstall som kan vises på figuren*/
Data _null_;
set &datasett;
call symput('FT1',trim(left(put(FT,8.2))));
call symput('FT2',trim(left(put(FT2,8.2))));
call symput('FT3',trim(left(put(FT3,8.2))));
run;


/*Hvilken rateSnitt-variabel som plottes avhenger av om vi vil vise alle rater uansett, eller om vi vil fjerne de med lav n*/
%if &vis_misstxt=1 %then %do;
proc sort data=&datasett;
by descending rateSnitt;
run;
%end;

/*Hvis vi vil fjerne rater med lav n bruker vi rateSnitt2*/
%if &vis_misstxt ne 1 %then %do;
proc sort data=&datasett;
by descending rateSnitt2;
run;
%end;

ODS Graphics ON /reset=All imagename="&tema._&type._rate_&fignavn" imagefmt=&bildeformat border=off width=640px height=520px;
ODS Listing Image_dpi=500 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=&datasett noborder noautolegend sganno=&anno pad=(Bottom=5%);
%if &vis_misstxt ne 1 %then %do;
hbarparm category=bohf response=Ratesnitt2 / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=CX00509E) name="hp1" 
legendlabel="Kontakter på sykehus & kontakter hos avtalespesialist med biopsi"; 
hbarparm category=bohf response=rate_4 / fillattrs=(color=CX00509E) missing outlineattrs=(color=CX00509E) name="hp2" 
legendlabel="Kontakter hos avtalespesialist, bare kolposkopi"; 
%end; 
%if &vis_misstxt=1 %then %do;
hbarparm category=bohf response=RateSnitt / fillattrs=(color=CX95BDE6) missing outlineattrs=(color=CX00509E) name="hp1" 
legendlabel="Kontakter på sykehus & kontakter hos avtalespesialist med biopsi";  /*BoHFene*/
hbarparm category=bohf response=rate_4 / fillattrs=(color=CX00509E) missing outlineattrs=(color=CX00509E) name="hp2" 
legendlabel="Kontakter hos avtalespesialist, bare kolposkopi"; 
%end; 
hbarparm category=bohf response=Snittrate / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C);		/*Norge*/
hbarparm category=bohf response=nrate_4 / fillattrs=(color=CX4C4C4C) missing outlineattrs=(color=CX4C4C4C);
%if &vis_misstxt=1 %then %do;
	scatter x=plassering y=bohf /datalabel=Mistext datalabelpos=right markerattrs=(size=0);
%end;
/*%if &vis_aarsvar=1 %then %do;
	%if &ratestart=&aar1 %then %do;
	scatter x=rate&aar1 y=Bohf / markerattrs=(symbol=squarefilled color=black);
	scatter x=rate&aar2 y=Bohf / markerattrs=(symbol=circlefilled color=black); 
	scatter x=rate&aar3 y=Bohf / markerattrs=(symbol=trianglefilled color=black); 
	Highlow Y=Bohf low=Min high=Max / type=line name="hl2" lineattrs=(color=black thickness=1 pattern=1); 
	%end;
	%if &ratestart=&aar2 %then %do;
	scatter x=rate&aar2 y=Bohf / markerattrs=(symbol=circlefilled color=black); 
	scatter x=rate&aar3 y=Bohf / markerattrs=(symbol=trianglefilled color=black); 
	Highlow Y=Bohf low=Min high=Max / type=line name="hl2" lineattrs=(color=black thickness=1 pattern=1); 
	%end;
	%if &ratestart=&aar3 %then %do;
	scatter x=rate&aar3 y=Bohf / markerattrs=(symbol=trianglefilled color=black); 
	Highlow Y=Bohf low=Min high=Max / type=line name="hl2" lineattrs=(color=black thickness=1 pattern=1); 
	%end;
%end;*/
keylegend "hp2" "hp1"/ location=outside position=bottomleft down=2 noborder titleattrs=(size=5);
Yaxistable &tabellvariable /Label location=inside labelpos=bottom position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);

%if &sprak=no %then %do;
   yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=9);
%end;
%else %if &sprak=en %then %do;
   yaxis display=(noticks noline) label='Hospital referral area' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=9);
%end;

%if &noxlabel=1 %then %do;
	xaxis display=(nolabel) offsetmin=0.02 offsetmax=0.02 &skala valueattrs=(size=8) label="&xlabel" labelattrs=(size=8 weight=bold);
 %end;
%else %do;
	 xaxis offsetmin=0.02 offsetmax=0.02 &skala valueattrs=(size=8) label="&xlabel" labelattrs=(size=8 weight=bold);
%end;
/*%if &vis_aarsvar=1 %then %do;
	%if &ratestart=&aar1 %then %do;
	inset (
	"(*ESC*){unicode'25a0'x}"="   &aar1"   
 	"(*ESC*){unicode'25cf'x}"="   &aar2" 
 	"(*ESC*){unicode'25b2'x}"="   &aar3" 
	) 
    / position=bottomright textattrs=(size=7);
	%end;
	%if &ratestart=&aar2 %then %do;
	inset (
 	"(*ESC*){unicode'25cf'x}"="   &aar2" 
 	"(*ESC*){unicode'25b2'x}"="   &aar3" 
	) 
    / position=bottomright textattrs=(size=7);
	%end;
	%if &ratestart=&aar3 %then %do;
	inset (
 	"(*ESC*){unicode'25b2'x}"="   &aar3" 
	) 
    / position=bottomright textattrs=(size=7);
	%end;
%end;*/
%if &vis_ft=1 %then %do; 
	inset "FT1 = &FT1" "FT2 = &FT2" "FT3 = &FT3" / position=right textattrs=(size=9) valuealign=right; 
%end;
Label &labeltabell;
Format &formattabell;
run;Title; ods listing close;

%mend ratefig_kolp1;