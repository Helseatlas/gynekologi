%macro nordland_priv_fix(inndata = , utdata = );

/*!
Makro for å bytte ut verdier i 2017 med snitt for perioden 2015-2016 for private i Bodø/Nordlandssykehuset

- Vil erstatte verdiene priv og priv_poli i 2017 med snitt for 2015-2016. 
- tot redefineres som off + priv
- poli redefineres som poli_off + poli_priv
- De andre verdiene beholdes slik som de er.

*/

data qwerty_inn;
set &inndata;

%boomraader;

run;

data nordland2015;
set qwerty_inn;
where aar = 2015 and bohf = 3;
keep alder komnr priv poli_priv priv_unik tmp_alder tmp_komnr;
rename priv      = priv2015;
rename poli_priv = poli_priv2015;
rename priv_unik = priv_unik2015;
tmp_alder = alder;
tmp_komnr = komnr;

run;

data nordland2016;
set qwerty_inn;
where aar = 2016 and bohf = 3;
keep alder komnr priv poli_priv priv_unik tmp_alder tmp_komnr;
rename priv      = priv2016;
rename poli_priv = poli_priv2016;
rename priv_unik = priv_unik2016;
tmp_alder = alder;
tmp_komnr = komnr;

run;

data nordland2017;
set qwerty_inn;
where aar = 2017 and bohf = 3;
run;


proc sql;
    create table qwerty_set_1 as
    select 
    a.*, b.*
    from nordland2017 a 
    full outer join nordland2016 b on (b.alder = a.alder and b.komnr = a.komnr);
    quit;

data qwerty_set_1;
set qwerty_set_1;
if alder = . then alder = tmp_alder;
if komnr = . then komnr = tmp_komnr;

drop tmp_alder tmp_komnr;
run;

proc sql;
    create table qwerty_set_2 as
    select 
    a.*, b.*
    from qwerty_set_1 a 
    full outer join nordland2015 b on (b.alder = a.alder and b.komnr = a.komnr);
    quit;


data qwerty_set_2;
set qwerty_set_2;
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
priv_unik = (priv_unik2015 + priv_unik2016)/2;


aar = 2017;

/* Bytt alle null-verdier med missing */
array change2 _numeric_;
    do over change2;
        if change2=0 then change2=.;
    end;

/*
Behold ermann som null
*/
ermann = 0;
run;

data original;
set qwerty_inn;
where not (bohf = 3 and aar = 2017);
run;

data &utdata;
set original qwerty_set_2;
drop BoShHN VertskommHN BoHF BoRHF Fylke priv2015 priv2016 poli_priv2015 poli_priv2016;
run;

proc datasets nolist;
delete qwerty_: original nordland2015 nordland2016 nordland2017;
run;

%mend;
