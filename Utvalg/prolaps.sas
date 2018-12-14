%macro Prolaps(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('N81')  then Prolaps_d=1; 
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if prosedyre {i} in ('LEF00','LEF03','LEF10','LEF13','LEF16','LEF20','LEF23',
								'LEF34','LEF40','LEF41','LEF50','LEF51','LEF53','LEF96','LEF97') then Prolaps_p=1;

		
	end;

if Prolaps_d=1 and Prolaps_p=1 then Prolaps_dp=1;

run;
%mend Prolaps;