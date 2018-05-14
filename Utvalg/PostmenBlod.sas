%macro PostmenBlod(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);

/*		if substr(diagnose{i},1,3) in ('C53','C54','C55','C56','C57') then GynKreftCIS_d=1; 
		if substr(diagnose{i},1,4) in ('D060','D061','D067','D069','D070','D071','D072','D073') then GynKreftCIS_d=1; */
		if substr(diagnose{i},1,4) in ('N950') then PostmenBlod_d=1; 
		/*if substr(diagnose{i},1,4) in ('N840') then PostMenBlod_d=1;*/		/*TAR UT N84.0 SOM TILSTANDSKODE FORDI VI FÅR MED FOR MANGE UNGE KVINNER*/

end;

/*USIKKER PÅ PROSEDYREKODER; MÅ DISKUTERES MED REFERANSEGRUPPE*/
/*Prosedyrekode for livmorkirurgi (hysterektomi)*/
/*array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 

end;*/

/*Postmenopausale blødninger*/

/*if Diag_GynKreft=1 and PostMenBlod_d then PostMenBlod_Kreft_d=1;*/
/*if PostMenBlod_d=1 and PostMenBlod_p=1 and AvtSpes=. then PostMenBlod_dp=1; */ /*Tar ikke med 400 kontakter hos avtalespesialist som er feilkodet*/
																	/*(Særlig mange LCA10, påvirker Vestfold, Sørlandet og Akershus BoHF) */

run;



%mend PostmenBlod;