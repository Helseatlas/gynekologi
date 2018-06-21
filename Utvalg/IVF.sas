%macro IVF(datasett = );

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;

    do i=1 to dim(diagnose);
    if substr(diagnose{i},1,3) in ('N97','N46') then Infertil_d=1;
	/*if diagnose{i} in ('Z311','Z312','Z313','Z314') then Infertil_d=1;*/
	/*if diagnose{i} in ('Z311','Z312','Z313','Z314') then ZInfertil_d=1;*/
    end;

array prosedyre {*} NC:;
	do i=1 to dim(prosedyre);
/*/*LCA 30 Overføring av egg eller embryo til uterus ved assistert befruktning*/
	if prosedyre{i} in ('LCA30') then IVF_p=1;
	/*if prosedyre{i} in ('LCGX10') then Spermie_injeksjon=1;*/ 	/*BRUKES IKKE*/
	/*if prosedyre{i} in ('LCGX15') then Egg_frysing=1;*/			/*BRUKES IKKE*/
	if prosedyre{i} in ('LCGX20') then Insem_p=1;
	/*if prosedyre{i} in ('LAA20K') then Uthenting_egg=1;*/			/*BRUKES IKKE*/
	if prosedyre{i} in ('LCW30K') then IVF_p=1;

    end;  

/*if Infertil_mann = 1 or Infertil_annen=1 or Infertil_uspes=1 or Kontakt_IVF=1 then IVF_d=1;*/

/*	if frozen_Egg_overforing = 1 or Spermie_injeksjon=1 or Egg_frysing=1 or Insem_Intrauterin=1 or Uthenting_egg=1 or fresh_Egg_overforing=1 then IVF_p=1;

        if frozen_Egg_overforing or fresh_egg_overforing then Egg_overforing=1;*/

run;

%mend IVF;
