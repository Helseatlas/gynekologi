%macro diagEndo(datasett =);

data &datasett;
set &datasett;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre);

	if substr(prosedyre{i},1,5) in ('LCA06') then diagEndoB_p=1;  /*Endometriebiopsi*/
	if substr(prosedyre{i},1,5) in ('LCA13') then diagEndoU_p=1;  /*Fraksjonert abrasio*/

end;





run;


%mend diagEndo;