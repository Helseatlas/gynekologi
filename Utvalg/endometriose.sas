%macro endometriose(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('N80')  then Endometriose_d=1; 
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if substr(prosedyre{i},1,3) in ('LAC','LAD','LAE','LAF','LBD','LBE','LBF','LCB','LCC','LCD','LCF') then Endometriose_p=1;
			if prosedyre{i} in ('JAL20','JAL21','JAL01','JAP01','JAP00') then Endometriose_p=1;
			
			if substr(prosedyre{i},1,3) in ('LCC','LCD') then endometriose_ifb_p=1;
			if prosedyre{i} in ('LAE20','LAE21','LAF10','LAF11','LAF30') then endometriose_ifb_p=1;
			
/*			if prosedyre{i} in ('JAL21','JAL01','JAP01','LAC01','LAC11','LAC21','LAC31','LAC97','LAD01','LAE11',
			'LAE21','LAF01','LAF11','LBD01','LBE01','LBF01','LBF11','LBF31','LBF41','LBF51','LBF61','LBF97','LCB01',
			'LCB11','LCB14','LCB97','LCC01','LCC11','LCC97','LCD01','LCD04','LCD11','LCD31','LCD97','LCF01','LCF11',
			'LCF97','LCB20','LCB25','LCB28','LCB32','LCC05','LCC20','LCD10','LCD40') then Endometriose_lapvag_p=1;*/
			
	end;

if Endometriose_d=1 and Endometriose_p=1 then Endometriose_dp=1;

if endometriose_dp=1 and endometriose_ifb_p=1 then endometriose_ifb_dp=1;
if endometriose_dp=1 and endometriose_ifb_p=. then endometriose_fb_dp=1;

/*if endometriose_p=1 and endometriose_lapvag_p=. then endometriose_aapen_p=1;

if endometriose_d=1 and endometriose_aapen_p=1 then endometriose_aapen_dp=1;
if endometriose_d=1 and endometriose_lapvag_p=1 then endometriose_lapvag_dp=1;*/
	
run;
%mend endometriose;