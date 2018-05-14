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
%mend hysterektomi;