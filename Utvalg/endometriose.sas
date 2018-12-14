%macro endometriose(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('N80')  then Endometriose_d=1; 
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 

	/*Hysterektomier*/
	if prosedyre{i} in ('LCD00','LCD30','LCD96','LCD10','LCD40','LCD01','LCD04','LCD11','LCD31','LCD97','LCC10','LCC11','LCC20') then Endometriose_hyst_p=1;
	
	/*Andre inngrep*/		
	if prosedyre{i} in ('JAL21','JAP00','JAP01','JAL20','JAL21','JAA10','JAA11',
						'LAC00','LAC01','LAC10','LAC11','LAC20','LAC21','LCF00',
						'LCF01','LAD00','LAD01','LAE10','LAE11','LAE20','LAE21',
						'LAF00','LAF01','LAF10','LAF11','LAF20','LAF30','LBD00',
						'LBD01','LBE00','LBE01') then Endometriose_p=1;
	if prosedyre{i} in ('LCC00','LCC01','LCC05','LCC96','LCC97','LCF97','LCF96') then Endometriose_p=1;						
		
	/*laparoskopisk tilgang, inkludert hysterektomiene*/                               
		if prosedyre{i} in ('JAA11','JAL21','JAP01',
								  'LAC01','LAC11','LAC21','LAD01','LAE11','LAE21','LAF01','LAF11',
								  'LBD01','LBE01', 'LCD01','LCD04','LCD31','LCD97','LCF01','LCF97','LCC01','LCC11','LCC97') then Endometriose_l_p=1;

	/*åpen tilgang, inkludert hysterektomiene*/                              
		if prosedyre{i} in ('JAA10','JAL20','JAP00',
								  'LAC00','LAC10','LAC20','LAD00','LAE10','LAE20','LAF00','LAF10',
								  'LBD00','LBE00','LCD00','LCD30','LCD96','LCF00','LCF96','LCC00','LCC10','LCC96') then Endometriose_a_p=1;

	/*vaginal tilgang, inkludert hysterektomiene*/
		if prosedyre{i} in ('LAF20','LAF30','LCD10','LCD11','LCD40','LCC05','LCC20') then Endometriose_v_p=1;
                     
			
			
			
			
	end;

/*Hvert inngrep klassifiseres som enten hysterektomi eller andre inngrep*/
if Endometriose_d=1 and Endometriose_hyst_p=1 then Endometriose_h_dp=1;
else if Endometriose_d=1 and Endometriose_p=1 then Endometriose_dp=1;

/*Hvert inngrep klassifiseres som enten åpent, Lap eller Vag inngrep*/
if Endometriose_d and Endometriose_a_p=1 then endometriose_a_dp=1;
else if Endometriose_d and Endometriose_v_p=1 then endometriose_v_dp=1;
else if Endometriose_d and Endometriose_l_p=1 then endometriose_l_dp=1;

/*Variabel som inneholder alle inngrep for endometriose*/
if endometriose_h_dp=1 or Endometriose_dp=1 then Endomalle_dp=1;

	
run;
%mend endometriose;