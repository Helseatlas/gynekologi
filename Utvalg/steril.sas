%macro Steril(datasett =);

data &datasett;
set &datasett;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if substr (prosedyre {i}, 1,3) in ('LGA') then Steril_p=1;
	end;

run;

%mend Steril;