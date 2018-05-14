%macro fodsel(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);
	/*Z37 Resultat av forløsning; levendefødt, dødfødt, noen levendefødt-noen dødfødt*/
         if substr(diagnose{i},1,4) in ('Z370') then Levende_fodt=1;/*Enkeltfødsel med levendefødt barn*/
		 if substr(diagnose{i},1,4) in ('Z371') then Dod_fodt=1;/*Enkeltfødsel med dødfødt barn*/
		 if substr(diagnose{i},1,4) in ('Z372') then Levende_fodt=1;/*Tvillingfødsel med levendefødte barn*/
		 if substr(diagnose{i},1,4) in ('Z373') then Levende_Dodfodt=1;/*Tvillingfødsel med ett levendefødt og ett dødfødt barn*/
		 if substr(diagnose{i},1,4) in ('Z374') then Dod_fodt=1;/*Tvillingfødsel med dødfødte barn*/
		 if substr(diagnose{i},1,4) in ('Z375') then Levende_fodt=1;/*Annen flerfødsel med levendefødte barn*/
		 if substr(diagnose{i},1,4) in ('Z376') then Levende_Dodfodt=1;/*Annen flerfødsel med noen levendefødte barn*/
		 if substr(diagnose{i},1,4) in ('Z377') then Dod_fodt=1;/*Annen flerfødsel med dødfødte barn*/
		 if substr(diagnose{i},1,4) in ('Z379') then Levende_Dodfodt=1;/*Uspesifisert resultat av forløsning*/
     end;

if Levende_fodt=1 or Dod_fodt=1 or Levende_Dodfodt=1 then fodt=1;


run;

%mend;

