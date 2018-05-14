%macro rekonstruksjon(datasett=);

data &datasett;
set  &datasett;

array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
		if prosedyre{i} in ('HAE00','HAE05','HAE10','HAE20','HAE99') then Rekonstruksjon_p=1;
end;


run;

%mend rekonstruksjon;