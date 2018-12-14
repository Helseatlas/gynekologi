%macro Steril(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);
	/*Z37 Resultat av forløsning; levendefødt, dødfødt, noen levendefødt-noen dødfødt*/
         if substr(diagnose{i},1,3) in ('Z37') then fodt=1;/*Enkeltfødsel med levendefødt barn*/
     end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if substr (prosedyre {i}, 1,3) in ('LGA') then Steril_p=1;
			if prosedyre {i} in ('LGA11','LGA21','LGA22','LGA24','LGA97','LGA98') then Steril_ia_p=1;
			if prosedyre {i} in ('LGA00','LGA10','LGA20','LGA96') then Steril_a_p=1;
			if substr (prosedyre {i}, 1,3) in ('MCA') then Keisersnitt=1;
			if prosedyre {i} in ('MAC00') then amniotomi=1;
	end;
	
if steril_p=1 and Keisersnitt=1 then steril_ks_p=1;
if steril_p=1 and Keisersnitt ne 1 then steril_iks_p=1;

if steril_a_p=1 then steril_ia_p=.;

run;





%mend Steril;