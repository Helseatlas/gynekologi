

%let tema=IVF_p;

%let rv1=&tema._tot_unik;

%let fignavn=personer; 
%let type=inngr;    
%let tittel=Pasienter som har fått assistert befruktning ved IVF. Aldersstandardiserte rater per 10 000 innbyggere. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Number per 10,000 women;
%let tabellvar1=&tema._tot_unik;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Women";
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 comma8.0;

%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_unik_bohf, sprak = en);



%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._tot_unik_bohf, bildeformat=pdf, sprak = en);


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





