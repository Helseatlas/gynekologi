%macro kolposkopi(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
	do i=1 to dim(diagnose);
		if substr(diagnose{i},1,3) in ('N87','D06')  then cervix_preinv_dysplasi_d=1; 
	end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre);

	if substr(prosedyre{i},1,5) in ('XLE00') then kolposkopi_p=1; /*Kolposkopi - FØR 2016*/
	if substr(prosedyre{i},1,5) in ('LXE00') then kolposkopi_p=1;/*Kolposkopi - FRA 2016*/
	if substr(prosedyre{i},1,5) in ('LDA10','LDA20','LDA96') then cervix_biopsi_p=1;

end;

array takst {*} Normaltariff:;
	do i = 1 to dim(takst);

		if substr(takst{i},1,3) in ('208') then kolposkopi_p=1;/* Kolposkopi */
		if substr(takst{i},1,4) in ('212a') then cervix_biopsi_p=1;
	
end;

/*Tredeling: Kolposkopi MED biopsi, bare kolposkopi og bare biopsi*/
if kolposkopi_p=1 then do;
	if cervix_biopsi_p=1 then kolp_biop_p=1;
	if cervix_biopsi_p ne 1 then kolp_p=1;
end;
if kolposkopi ne 1 then do;
	if cervix_biopsi_p=1 then biop_p=1;
end;

if fag_skde=4 and avtspes=1 then kontakt_avtspes=1;


run;


%mend kolposkopi;