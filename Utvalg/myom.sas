%macro myom(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('D25')  then Myom_d=1; 
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if substr(prosedyre{i},1,3) in ('LCC', 'LCD') then Myom_p=1;
			if prosedyre{i} in ('LCB10', 'LCB11', 'LCB14', 'LCB20', 'LCB25') then Myom_p=1;
			if prosedyre{i} in ('LCPE05','PDY42B','PDI42B') then Myom_p=1;
			
			/*if prosedyre{i} in ('LCB11','LCB14','LCB20','LCB25','LCC01','LCC11','LCC97','LCD01','LCD04','LCD11','LCD31','LCD97','LCC05','LCC20','LCD10','LCD40') then myom_lapvag_p=1;*/
	end;

if Myom_d=1 and Myom_p=1 then Myom_dp=1;

/*if myom_p=1 and myom_lapvag_p=. then myom_aapen_p=1;

if myom_d=1 and myom_aapen_p=1 then myom_aapen_dp=1;
if myom_d=1 and myom_lapvag_p=1 then myom_lapvag_dp=1;*/

run;
%mend myom;