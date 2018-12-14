%macro myom(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('D25')  then Myom_d=1; 
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if prosedyre{i} in ('LCC00','LCC01','LCC05','LCC96','LCC97') then Myom_p=1;
			if prosedyre{i} in ('LCD00','LCD30','LCD96','LCD10','LCD40','LCD01','LCD04','LCD11','LCD31','LCD97','LCC10','LCC11','LCC20') then myom_hyst_p=1;
			if prosedyre{i} in ('LCB10', 'LCB11', 'LCB14', 'LCB20', 'LCB25') then Myom_p=1;
			*if prosedyre{i} in ('LCPE05','PDY42B','PDI42B') then Myom_e_p=1;
			
			/*if prosedyre{i} in ('LCB11','LCB14','LCB20','LCB25','LCC01','LCC11','LCC97','LCD01','LCD04','LCD11','LCD31','LCD97','LCC05','LCC20','LCD10','LCD40') then myom_lapvag_p=1;*/
		
		if prosedyre{i} in ('LCC05','LCC20','LCB20','LCB25','LCD10','LCD40') then myom_vag=1;
		if prosedyre{i} in ('LCC01','LCC11','LCC97','LCB11','LCB14','LCD01','LCD04','LCD11','LCD31','LCD97') then myom_lap=1;
		if prosedyre{i} in ('LCC00','LCC10','LCB10','LCC96','LCD00','LCD30','LCD96') then myom_apen=1;
	
	end;

if Myom_d=1 and myom_hyst_p=1 then myom_h_dp=1;
else if Myom_d=1 and Myom_p=1 then Myom_dp=1;
*else if myom_d=1 and myom_e_p=1 then myom_e_dp=1;

if myom_h_dp=1 or myom_dp=1 then myomalle_dp=1;

if myom_d=1 and myom_apen=1 then myom_apen_dp=1;
else if myom_d=1 and myom_vag=1 then myom_vag_dp=1;
else if myom_d=1 and myom_lap=1 then myom_lap_dp=1;

run;


/*if myom_p=1 and myom_lapvag_p=. then myom_aapen_p=1;

if myom_d=1 and myom_aapen_p=1 then myom_aapen_dp=1;
if myom_d=1 and myom_lapvag_p=1 then myom_lapvag_dp=1;*/

run;
%mend myom;