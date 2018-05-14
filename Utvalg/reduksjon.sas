%macro reduksjon(datasett=);

data &datasett;
set  &datasett;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
		if prosedyre{i} in ('HAD30','HAD35','HAD20') then Reduksjon_p=1;
end;

run;

%mend reduksjon;