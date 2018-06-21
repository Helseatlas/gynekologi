%macro hysterektomi(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);

        /*if substr(diagnose{i},1,3) in ('C53','C54','C55','C56','C57') then Diag_GynKreft=1;*/ 
	if substr(diagnose{i},1,1) in ('C') then Kreft_d=1; 
	if substr(diagnose{i},1,4) in ('D060','D061','D067','D069','D070','D071','D072','D073') then Kreft_d=1; 
end;

/*Prosedyrekode for livmorkirurgi (hysterektomi)*/
array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre);
 
	if prosedyre{i} in ('LCD00','LCD30','LCD96') then Hysterektomi_Aapen_p=1;
	if prosedyre{i} in ('LCD10','LCD40','LEF13') then Hysterektomi_Vaginal_p=1;
	if prosedyre{i} in ('LCD01','LCD04','LCD11','LCD31','LCD97') then Hysterektomi_Lap_p=1;

end;

/*Utelukke diagnose (kreft) ved prosedyre for hysterektomi(åpen, vaginal og laparaskopisk), samt slå sammmen alt*/
	if Kreft_d ne 1 and Hysterektomi_Aapen_p= 1 then Hyster_Aapen_dp=1;
	if Kreft_d ne 1  and Hysterektomi_Vaginal_p= 1 then Hyster_Vaginal_dp=1;
	if Kreft_d ne 1  and Hysterektomi_Lap_p= 1 then Hyster_Lap_dp=1;
	if Hyster_Aapen_dp= 1 or Hyster_Vaginal_dp= 1 or Hyster_Lap_dp= 1 then Hysterektomi_dp=1;

	
	
    /*if Hysterektomi_Kreft_dp=1 or Hysterektomi_dp=1 then Hysterektomi_total_dp=1;*/
	


run;


/* hyppigste hdiag innefor hysterektomi diagnose / prosedyre */
/*
data hyst;
  set npr_utva.ka_utvalg;
  where Hysterektomi_dp;
run;

proc freq data=hyst order=freq;
  tables hdiag3tegn hdiag ;
run;
*/

/*
D25 Leiomyom i livmor (30%)
N92 Kraftig, hyppig og uregelmessig menstruasjon(25%)
N81 Fremfall av kvinnelige kjønnsorganer(13%)
N80 Endometriose (6%)
*/

data &datasett;
set &datasett;

    array prosedyre {*} NC:;
          do i=1 to dim(prosedyre);
          if prosedyre{i} in ('ZXC96') then RobotAssKirurgi=1;
          end;

     if hysterektomi_dp=1 then do;
	 
	   if hdiag3tegn='D25' then hyster_myom_dp=1;
       if hdiag3tegn='N92' then hyster_blod_dp=1;
	   if hyster_myom_dp ne 1 and hyster_blod_dp ne 1 then hyster_annen_dp=1;

       if RobotAssKirurgi= 1 then hyster_robot_dp=1; else hyster_ikkerobot_dp=1;

	 end;

run;

%mend hysterektomi;