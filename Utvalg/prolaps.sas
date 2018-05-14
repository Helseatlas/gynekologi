%macro Prolaps(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('N81')  then Prolaps_d=1; 
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if substr (prosedyre {i}, 1,3) in ('LEF') then Prolaps_p=1;

			/*Prosedyrer i hht Inkontinensregisteret side 20, Årsrapporten 2016*/
	end;

if Prolaps_d=1 and Prolaps_p=1 then Prolaps_dp=1;

run;
%mend Prolaps;