%macro pcos(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,4) in ('E282')  then pcos_d=1; 
	end;


run;

%mend pcos;