%macro spontanabort(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
			if substr(diagnose{i},1,3) in ('O03','O05','O06') then SpontanAbort_d=1; 
	end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
	if prosedyre{i} in ('LCH00') then LCH00=1;
	if prosedyre{i} in ('LCH03') then LCH03=1;
	if prosedyre{i} in ('LCH10') then LCH10=1;
	if prosedyre{i} in ('LCH13') then LCH13=1;
	if prosedyre{i} in ('LCH20') then LCH20=1;
	if prosedyre{i} in ('LCH96') then LCH96=1;
	if prosedyre{i} in ('MBA00') then MBA00=1;
	if prosedyre{i} in ('MBA03') then MBA03=1;
	if prosedyre{i} in ('MBA96') then MBA96=1;
	if prosedyre{i} in ('MAGM00') then MAGM00=1;
	if prosedyre{i} in ('WBGM55') then WBGM55=1;
	end;


if LCH00=1 or LCH03=1 or LCH13=1 or LCH20=1 or LCH96=1 or MBA00=1 or MBA03=1 or MBA96=1 then AbortKir_p=1;
if LCH10=1 or MAGM00=1  or WBGM55=1 then AbortMed_p=1;
if SpontanAbort_d=1 and AbortKir_p=1 then SpontanAbort_dp=1;
if SpontanAbort_d=1 and AbortMed_p=1 then SpontanAbortMed_dp=1;

run;

%mend spontanabort;





