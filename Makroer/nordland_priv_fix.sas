/*
Makro for å bytte ut verdier i 2017 med snitt for perioden 2015-2016 for private i Bodø

1. Definerer BOHF
2. 

*/

%macro nordland_priv_fix(datasett = );

data tmp;
set &datasett;

%boomraader;

run;

data nordland2015;
set tmp;
where aar = 2015 and bohf = 3;
keep alder komnr priv poli_priv tmp_alder tmp_komnr;
rename priv      = priv2015;
rename poli_priv = poli_priv2015;
tmp_alder = alder;
tmp_komnr = komnr;

run;

data nordland2016;
set tmp;
where aar = 2016 and bohf = 3;
keep alder komnr priv poli_priv tmp_alder tmp_komnr;
rename priv      = priv2016;
rename poli_priv = poli_priv2016;
tmp_alder = alder;
tmp_komnr = komnr;

run;

data nordland2017;
set tmp;
where aar = 2017 and bohf = 3;
rename tot       = tot2017;
rename priv      = priv2017;
rename poli      = poli2017;
rename poli_priv = poli_priv2017;
*tmp_alder = alder;
*tmp_komnr = komnr;
run;


proc sql;
    create table test2 as
    select 
    a.*, b.*
    from nordland2017 a 
    full outer join nordland2016 b on (b.alder = a.alder and b.komnr = a.komnr);
    quit;

data test2;
set test2;
if alder = . then alder = tmp_alder;
if komnr = . then komnr = tmp_komnr;

drop tmp_alder tmp_komnr;
run;

proc sql;
    create table test3 as
    select 
    a.*, b.*
    from test2 a 
    full outer join nordland2015 b on (b.alder = a.alder and b.komnr = a.komnr);
    quit;


data test3;
set test3;
if alder = . then alder = tmp_alder;
if komnr = . then komnr = tmp_komnr;

drop tmp_alder tmp_komnr;

/* Bytt alle missing-verdier med null, for å kunne lage snitt */
array change _numeric_;
    do over change;
        if change=. then change=0;
    end;

priv      = (priv2015 + priv2016)/2;
tot       = off + priv;
poli_priv = (poli_priv2015 + poli_priv2016)/2;
poli      = poli_off + poli_priv;

run;

%mend;
