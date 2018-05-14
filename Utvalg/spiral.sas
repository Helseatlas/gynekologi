%macro Spiral(datasett =);

data &datasett;
set &datasett;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
			if prosedyre{i} in ('LCX00','TLC00') then Spiral_p=1;


	end;

run;

%mend Spiral;