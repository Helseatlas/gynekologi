%macro Inkontinens(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if diagnose{i} in ('N393','N394')  then Inkontinens_d=1; /*Stressinkontinens/Annen spesifisert urininkontinens*/  
	end;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if prosedyre{i} in ('LEG00','LEG10','LEG13','LEG20','LEG96','KDG00','KDG01','KDG10','KDG20','KDG21',
'KDG30','KDG31','KDG40','KDG43','KDG50','KDG60','KDG96','KDG97','KDV20','KDV22') then Inkontinens_p=1;

			/*Prosedyrer i hht Inkontinensregisteret side 20, Årsrapporten 2016*. Der stilles ikke krav om tilstandskode.*/
	end;

	if Inkontinens_d=1 and Inkontinens_p=1 then Inkontinens_dp=1;

run;

%mend Inkontinens;


