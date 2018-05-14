%macro spontanabort(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
			if substr(diagnose{i},1,3)='O03' then SpontanAbort_d=1; 
	end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
	if prosedyre{i} in ('LCH00') then SpontanAbort_p=1;
	if prosedyre{i} in ('LCH03') then SpontanAbort_p=1;
	if prosedyre{i} in ('LCH13') then SpontanAbort_p=1;
	if prosedyre{i} in ('LCH20') then SpontanAbort_p=1;
	if prosedyre{i} in ('LCH96') then SpontanAbort_p=1;
	if prosedyre{i} in ('MBA00') then SpontanAbort_p=1;
	if prosedyre{i} in ('MBA03') then SpontanAbort_p=1;
	if prosedyre{i} in ('MBA96') then SpontanAbort_p=1;
	end;

if SpontanAbort_d=1 and SpontanAbort_p=1 then SpontanAbort_dp=1;


run;

%mend spontanabort;


