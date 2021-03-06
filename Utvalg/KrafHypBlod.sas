

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

		if prosedyre{i} in ('LCA10','LCA13','LCA16','LCB28','LCB32') then KHB_ud_p=1;/*Utskraping av corpus uteri*/
		if prosedyre{i} in ('LCA10') then KHB_u_p=1;/*Utskraping av corpus uteri*/
		if prosedyre{i} in ('LCA13') then KHB_u_p=1;/*Fraksjonert utskraping*/
		if prosedyre{i} in ('LCA16') then KHB_d_p=1;/*Destruksjon av endometrium*/
		if prosedyre{i} in ('LCB10') then KHB_p=1;/*Enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB11') then KHB_p=1;/*Laparoskopisk enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB14') then KHB_p=1;/*Laparoskopisk diatermidestruksjon av myomknute*/	
		if prosedyre{i} in ('LCB20') then KHB_p=1;/*Transvaginal enukleasjon av myoma uteri*/	
		if prosedyre{i} in ('LCB25') then KHB_p=1;/*Hysteroskopisk ekstirpasjon av lesjon*/	
		if prosedyre{i} in ('LCB28') then KHB_d_p=1;/*Hysteroskopisk eksisjon av endometrium*/
		if prosedyre{i} in ('LCB32') then KHB_d_p=1;/*Hysteroskopisk destruksjon av endometrium*/
		if prosedyre{i} in ('LCC00','LCC01','LCC05','LCC96','LCC97') then KHB_p=1;
		if prosedyre{i} in ('LCD00','LCD30','LCD96') then KHB_h_p=1;
		if prosedyre{i} in ('LCD10','LCD40') then KHB_h_p=1;
		if prosedyre{i} in ('LCD01','LCD04','LCD11','LCD31','LCD97','LCC10','LCC11','LCC20') then KHB_h_p=1;
		
		if prosedyre{i} in ('LCC05','LCC20','LCA16','LCB20','LCB25','LCB28','LCB32','LCD10','LCD40') then KHB_vag=1; /*'LCA10','LCA13',*/
		if prosedyre{i} in ('LCC01','LCC11','LCC97','LCB11','LCB14','LCD01','LCD04','LCD11','LCD31','LCD97') then KHB_lap=1;
		if prosedyre{i} in ('LCC00','LCC10','LCC96','LCB10','LCD00','LCD30','LCD96') then KHB_apen=1;

end;

if KHB_p=1 or KHB_h_p=1 or KHB_d_p=1 then KrafHypBlod_p=1;

/*KrafHypBlodning*/
if KrafHypBlod_d=1 and KrafHypBlod_p=1 and AvtSpes=. then KrafHypBlod_dp=1;		/*Tar ikke med 266 kontakter hos avtalespesialist som er feilkodet */
																						/*(S�rlig mange LCA10, p�virker Vestfold og S�rlandet BoHF) */
																						/*Det er hovedsakelig kvinner 40+ som har f�tt endometriebiopsi (LCA06)*/
/*KrafHypBlodning*/
if KrafHypBlod_d=1 and KHB_h_p=1 and AvtSpes=. then KHB_h_dp=1;	
else if KrafHypBlod_d=1 and KHB_p=1 and AvtSpes=. then KHB_dp=1;
else if KrafHypBlod_d=1 and KHB_d_p=1 and AvtSpes=. then KHB_d_dp=1;

/*if KHB_ud_dp=1 then do;
	if KHB_d_p=1 then KHB_d_dp=1;
	else if KHB_u_p=1 then KHB_u_dp=1;
end;*/

if KrafHypBlod_d=1 and KHB_apen=1 and AvtSpes=. then KHB_apen_dp=1;
else if KrafHypBlod_d=1 and KHB_vag=1 and AvtSpes=. then KHB_vag_dp=1;
else if KrafHypBlod_d=1 and KHB_lap=1 and AvtSpes=. then KHB_lap_dp=1;

run;



%mend KrafHypBlod;

 		/*if prosedyre{i} in ('LCB96') then LCB96=1;/*Annen ekstirpasjon av lesjon i uterus*/
		/*if prosedyre{i} in ('LCB97') then LCB97=1;/*Annen laparoskopisk ekstirpasjon av lesjon i uterus*/
		/*if prosedyre{i} in ('LCB98') then LCB98=1;/*Annen transluminal endoskopisk ekstirpasjon av lesjon i uterus*/

