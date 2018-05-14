

%macro KrafHypBlod(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);

        if substr(diagnose{i},1,3)='N92' then KrafHypBlod_d=1; /* Kraftig, hyppig og uregelmessig menstruasjon*/ 
end;

/*Prosedyrekode for livmorkirurgi (hysterektomi)*/
array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 

		if prosedyre{i} in ('LCA10') then KrafHypBlod_p=1;/*Utskraping av corpus uteri*/
		if prosedyre{i} in ('LCA13') then KrafHypBlod_p=1;/*Fraksjonert utskraping*/
		if prosedyre{i} in ('LCA16') then KrafHypBlod_p=1;/*Destruksjon av endometrium*/
		if prosedyre{i} in ('LCB10') then KrafHypBlod_p=1;/*Enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB11') then KrafHypBlod_p=1;/*Laparoskopisk enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB14') then KrafHypBlod_p=1;/*Laparoskopisk diatermidestruksjon av myomknute*/	
		if prosedyre{i} in ('LCB20') then KrafHypBlod_p=1;/*Transvaginal enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB25') then KrafHypBlod_p=1;/*Hysteroskopisk ekstirpasjon av lesjon*/	
		if prosedyre{i} in ('LCB28') then KrafHypBlod_p=1;/*Hysteroskopisk eksisjon av endometrium*/
		if prosedyre{i} in ('LCB32') then KrafHypBlod_p=1;/*Hysteroskopisk destruksjon av endometrium*/
		/*if prosedyre{i} in ('LCB96') then LCB96=1;/*Annen ekstirpasjon av lesjon i uterus*/
		/*if prosedyre{i} in ('LCB97') then LCB97=1;/*Annen laparoskopisk ekstirpasjon av lesjon i uterus*/
		/*if prosedyre{i} in ('LCB98') then LCB98=1;/*Annen transluminal endoskopisk ekstirpasjon av lesjon i uterus*/
		if prosedyre{i} in ('LCD00','LCD30','LCD96') then KrafHypBlod_p=1;
		if prosedyre{i} in ('LCD10','LCD40') then KrafHypBlod_p=1;
		if prosedyre{i} in ('LCD01','LCD04','LCD11','LCD31','LCD97') then KrafHypBlod_p=1;

end;

/*KrafHypBlodning*/
if KrafHypBlod_d=1 and KrafHypBlod_p=1 and AvtSpes=. then KrafHypBlod_dp=1;		/*Tar ikke med 266 kontakter hos avtalespesialist som er feilkodet */
																						/*(Særlig mange LCA10, påvirker Vestfold og Sørlandet BoHF) */

run;



%mend KrafHypBlod;

 

