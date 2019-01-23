

%let tema=IVF_p;

%let rv1=&tema._tot_unik;

%let fignavn=personer; 
%let type=inngr;    
%let tittel=Pasienter som har fått assistert befruktning ved IVF. Aldersstandardiserte rater per 10 000 innbyggere. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall pr. 10 000 kvinner;
%let tabellvar1=&tema._tot_unik;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;

%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_unik_bohf);



%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._tot_unik_bohf, bildeformat=pdf );


/* Lager datasett for Instant Atlas */
%Let beskrivelse=IVF_rate;
data helseatl.IA_gyn_&beskrivelse;
  set IVF_p_tot_unik_bohf (keep = bohf Ratesnitt IVF_p_tot_unik innbyggere rename=(Ratesnitt=Rate IVF_p_tot_unik=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva = 10;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;





