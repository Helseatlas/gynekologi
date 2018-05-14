%macro kolposkopi(datasett =);

data &datasett;
set &datasett;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre);

	if substr(prosedyre{i},1,5) in ('XLE00') then kolposkopi_p=1; /*Kolposkopi - FØR 2016*/
	if substr(prosedyre{i},1,5) in ('LXE00') then kolposkopi_p=1;/*Kolposkopi - FRA 2016*/

end;

array takst {*} Normaltariff:;
	do i = 1 to dim(takst);

		if substr(takst{i},1,3) in ('208') then kolposkopi_p=1;/* Kolposkopi */
	
end;


run;


%mend kolposkopi;