%macro diagEndo(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);

		if substr(diagnose{i},1,1) in ('O') then Svskap_diag=1; 

end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre);

	if substr(prosedyre{i},1,5) in ('LCA06') then diagEndoB_p=1;  /*Endometriebiopsi*/
	if substr(prosedyre{i},1,5) in ('LUC05','LUC15') then diagEndoB_p=1;  /*Hysteroskopi/mikrohysteroskopi med biopsi*/
	if substr(prosedyre{i},1,5) in ('LCA13') then LCA13=1;  /*Fraksjonert abrasio*/
	if substr(prosedyre{i},1,5) in ('LCA10') then LCA10=1;  /*abrasio*/

end;


array takst {*} Normaltariff:;
    do i=1 to dim(takst); 

		if substr(takst{i},1,4) in ('214c') then diagEndoB_p=1; 
		if substr(takst{i},1,4) in ('207b') then diagEndoB_p=1; 


end;

if LCA10=1 and Svskap_diag ne 1 then do;					/*Fjerner pasienter med O-tilstandskoder, dette er behandling*/
	if KHB_d_p ne 1 and avtspes ne 1 then diagEndoU_p=1;	/*Fjerner behandling (endometriereseksjon) og kjent feilkoding av LCA10/13 hos avtspes*/
end;

if LCA13=1 and Svskap_diag ne 1 then do;					/*Fjerner pasienter med O-tilstandskoder, dette er behandling*/
	if KHB_d_p ne 1 and avtspes ne 1 then diagEndoU_p=1;	/*Fjerner behandling (endometriereseksjon) og kjent feilkoding av LCA10/13 hos avtspes*/
end;

if diagEndoU_p=1 then diagEndoB_p=.;

if diagEndoB_p=1 or diagEndoU_p=1 then diagEndo_p=1;

if diagEndoU_p=1 then do;
	if hdiag3tegn='N92' then diagEndo_bl_dp=1;
end;

run;


%mend diagEndo;