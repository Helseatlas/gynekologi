%macro svkontr(datasett =);

data &datasett (drop=Z34 Z35 Z369 Takst: O_diag);
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);
         if substr(diagnose{i},1,3) in ('Z34') then Z34=1;/*Kontroll av normalt svangerskap*/
	     if substr(diagnose{i},1,3) in ('Z35') then Z35=1;/*Kontroll av høyrisikosvangerskap*/
		 if diagnose{i} in ('Z369') then Z369=1;/*Uspesifisert prenatal diagnostikk*/
		 if substr(diagnose{i},1,2) in ('O1','O2','O3','O4') then O_diag=1;
		 if substr(diagnose{i},1,3) in ('O98','O99') then O_diag=1;
     end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
 		if prosedyre{i} eq 'SMA0BK' then UL=1;
		if prosedyre{i} eq 'MADE10' then UL=1;
		if prosedyre{i} eq 'SMA0CK' then UL=1;
		if prosedyre{i} eq 'LXDE05' then UL=1;
		if prosedyre{i} eq 'SLX0BK' then UL=1;
end;

array takst {*} Normaltariff:;
    do i=1 to dim(takst); 

		if substr(takst{i},1,4) in ('211a') then Takst211a=1; 
		if substr(takst{i},1,4) in ('211b') then Takst211b=1; 
		if substr(takst{i},1,4) in ('211c') then Takst211c=1;
		if substr(takst{i},1,4) in ('211e') then Takst211e=1;
		if substr(takst{i},1,3) in ('216') then Takst216=1;
		if substr(takst{i},1,4) in ('217a') then Takst217a=1; 
		if substr(takst{i},1,4) in ('217b') then Takst217b=1;
		if substr(takst{i},1,4) in ('217c') then Takst217c=1; 
		if substr(takst{i},1,4) in ('217d') then Takst217d=1; 

end;


/*Bruker if ... else for å utelukke at kontakter kategoriseres som både normal og høyrisiko, både høyrisiko og o-diagnose etc.*/
if Z34=1 or z369=1 then Kontroll_normal=1;
else if z35=1 then Kontroll_hoyrisk=1;	
else if O_diag=1 and EoC_aktivitetskategori3 ne 1 then Kontroll_Odiag=1;		/*Tar bare med Poli og Dag for O-diagnoser*/

/*Hvis ingen av tilstandskodene tilsier svangerskapskontroll, men kontrollen har takst for svangerskapskontroll så kategoriseres den som Kontroll_takst*/
else if Takst211a=1 or Takst211b=1 or Takst216=1 or Takst211e=1 or Takst217a=1 or Takst217b=1 or Takst217c=1 or Takst217d=1 then Kontroll_takst=1;

if Takst211a=1 or Takst211b=1 or Takst211c=1 then UL=1;

if Kontroll_normal=1 or Kontroll_hoyrisk=1 or Kontroll_Odiag=1 or Kontroll_takst=1 then Kontroll=1;


run;

%mend svkontr;


