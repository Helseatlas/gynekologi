

%let agg_var=steril_p;

%let ratefil=helseatl.k_u_&agg_var._18;

%Let innbyggerfil=Innbygg.innb_2004_2017_bydel_allebyer;

%let RV_variabelnavn=tot; 

%Let forbruksmal =&agg_var._&RV_variabelnavn._IJ;
%let dsn_ut=&forbruksmal._bohf;

%let rate_pr=10000;
%let ratestart=2015;

%include "&filbane.rateprogram\sas\indirekterate.sas";

%indirekterate;


%forholdstall(ds=&dsn_ut);

/***************************************************/
/* Enkel ratefigur, INDIREKT og UJUST              */
/***************************************************/

%let tema=Steril;
%let rv1=&forbruksmal;

%let fignavn=IJ;
%let type=&RV_variabelnavn; /*Angir populasjon/nevner*/
%let tittel=&tema. INDIREKT aldersstandariserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=&tittel;
%let tabellvar1=indirekt_justratesnitt;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="indirekte rate" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&dsn_ut, aar1=2015, aar2=2016, aar3=2017);


%let tema=Steril;
%let rv1=&forbruksmal;

%let fignavn=;
%let type=&RV_variabelnavn; /*Angir populasjon/nevner*/
%let tittel=&tema. UJUST. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel=&tittel;
%let tabellvar1=ujust_ratesnitt;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="ujust rate" &tabellvar2="Innbyggere";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%ratefig(datasett=&dsn_ut, aar1=2015, aar2=2016, aar3=2017);

