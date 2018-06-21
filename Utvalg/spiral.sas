%macro Spiral(datasett =);

data &datasett;
set &datasett;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if prosedyre{i} in ('LCX00','TLC00') then Spiral_pros=1;


	end;

array takst {*} Normaltariff:;
    do i=1 to dim(takst); 

		if substr(takst{i},1,4) in ('214a') then SpiralPstav=1; 
		if substr(takst{i},1,4) in ('149a') then LokalAn=1; 


end;

/*Tar med alle som har prosedyrekode for spiral registrert*/
if Spiral_pros=1 then Spiral_p=1;

/*Hvis ikke prosedyrekode for spiral er registrert*/
/*Tar med alle som har takstkode for spiral/pstav, men ikke Lokalanestesi*/
if Spiral_pros ne 1 and SpiralPstav=1 and LokalAn ne 1 then do;
	Spiral_takst=1;
	Spiral_p=1;
end;
	
run;



%mend Spiral;