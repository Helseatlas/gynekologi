* CHECK THAT MACROS SHOULD NOT ALTER THE OUTPUT FILES FROM RATEPROGRAM, E.G. HYSTEREKTOMI_BOHF, HYSTEREKTOMI_KREFT_BOHF, HYSTEREKTOMI_ANNEN_BOHF;
* CHANGE THE MACRO SO THAT WHAT WE GRAPH WITH IS MORE DYNAMIC, E.G. hbarparm category=bohf response=RATESNITT3;

/*OVERORDNET INPUT:*/




%let tema=IVF;



/*INPUT FOR HVER FIGUR:*/

%let agg_var2 = Insem_p; *D-diagnose, P-prosedure;
%let agg_var1 = IVF_p; *D-diagnose, P-prosedure;

%let dsn1=&agg_var1._tot_bohf; %let rv1=&agg_var1._tot;
%let dsn2=&agg_var2._tot_bohf; %let rv2=&agg_var2._tot;

%merge(ant_datasett=2, dsn_ut=merged_&tema);


/*INPUT FOR HVER FIGUR:*/

%let fignavn=IVF_IUI; *additional info for figure name, can be empty;
%let type=inngr;    *inngrep, konsultasjoner, or undersøkelser;
%let tittel=Antall inngrep ved in-vitro fertilisering. Aldersstandardiserte rater per 100 000 innbyggere. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Assistert befruktning ved IVF, pr. 100 000 innbyggere. Aldersjusterte rater.;

* variables to use, and column and label names for the table on the right of the figure;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=Innbyggere;
%let label_2=IUI;
%let label_1=IVF;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar2="IUI" &tabellvar1="IVF" &tabellvar3="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 &tabellvar3 NLnum8.0;

%let skala=/*values=(0 to 1.6 by 0.2)*/;

%ratefig_todeltSoyle(datasett=merged_&tema);



%let dsnIVF=&agg_var2._tot_bohf; %let rv1=&agg_var2._tot;


%let fignavn=IVF;
%let tittel=Antall IVF (eggoverføring) per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= IVF (eggoverføring), pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&agg_var2._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="IVF" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;
%ratefig(datasett=&dsnIVF);


%let dsnIUI=&agg_var1._tot_bohf; %let rv1=&agg_var1._tot;

%let fignavn=IUI;
%let tittel=Antall IUI per 100 000 innbyggere. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2014-16.;
%let xlabel= Intrauterin inseminasjon (IUI), pr. 100 000 innbyggere. Aldersjusterte rater.;
%let tabellvar1=&agg_var1._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="IUI" &tabellvar2="Kvinner";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0 ;
%let skala=;
%ratefig(datasett=&dsnIUI);





