%macro TransCer(datasett =);

data &datasett;
set &datasett;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 

		if prosedyre{i} in ('LCA16') then TransCer_p=1;/*Destruksjon av endometrium*/
		if prosedyre{i} in ('LCB20') then TransCer_p=1;/*Transvaginal enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB25') then TransCer_p=1;/*Hysteroskopisk ekstirpasjon av lesjon*/	
		if prosedyre{i} in ('LCB28') then TransCer_p=1;/*Hysteroskopisk eksisjon av endometrium*/
		if prosedyre{i} in ('LCB32') then TransCer_p=1;/*Hysteroskopisk destruksjon av endometrium*/


end;

if TransCer_p=1 and Kreft_d ne 1 then TransCer_dp=1;

if TransCer_dp=1 then do;
	if hdiag3tegn='N84' then TC_polypp_dp=1;
	if hdiag3tegn='N92' then TC_blod_dp=1;
	if TC_polypp_dp ne 1 and TC_blod_dp ne 1 then TC_annen_dp=1;
end;


run;



%mend TransCer;