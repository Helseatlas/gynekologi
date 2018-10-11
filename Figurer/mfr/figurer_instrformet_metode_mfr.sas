%let tema=instrformet;

/***************************************************/
/* Lag andelsfigur               */
/***************************************************/


%let dsn1=&tema._tang_allevagUJ_bohf;
%let rv1=&tema._tang_allevag;

%let dsn2=&tema._vak_allevagUJ_bohf;
%let rv2=&tema._vak_allevag;
%merge(ant_datasett=2, aar1=2015, aar2=2016, aar3=2017, dsn_ut=&tema._allevag_met_bohf); 

%let andel=andel_rate2;

%let fignavn=vakum;
%let type=vag; /*Angir populasjon/nevner*/
%let tittel=Andel f�dsler med vakuumekstraksjon av alle f�dsler med instrumentell forl�sning. Gjennomsnitt per �r i perioden 2015-17.;
%let xlabel= F�dsler med vakuumekstraksjon av alle f�dsler med instrumentell forl�sning.;
%let tabellvar1=antall_2;
%let tabellvar2=tot_antall;
%let tabellvar3=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Vakuumekstraksjon" &tabellvar2="F�dsler med instr. forl�sning" &tabellvar3="Vaginale f�dsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.0;
%let skala=;

%andelsfig(datasett=&tema._allevag_met_bohf);
