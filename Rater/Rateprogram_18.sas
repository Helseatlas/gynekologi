/*!
Denne filen inneholder et eksempel på hvordan man kjører rateprogrammet, med en beskrivelse av de ulike variablene
man kan bruke. Filen skal være kjørbar som et *sas*-program slik den er.

Den kan også fungere som en test av rateprogrammet. Kjøres slik:
```
%let filbane=\\tos-sas-skde-01\SKDE_SAS\;
%include "&filbane.rateprogram\master\Rateprogram.sas";
```
*/

%let filbane=\\tos-sas-skde-01\SKDE_SAS\felleskoder\master\;
options sasautos=("&filbane.Makroer" SASAUTOS);

/*Options symbolgen mlogic mprint;*/

%include "&filbane.Formater\SKDE_somatikk.sas";
%include "&filbane.Formater\NPR_somatikk.sas";
%include "&filbane.Formater\bo.sas";
%include "&filbane.Formater\beh.sas";
%include "&filbane.Formater\komnr.sas";

%include "&filbane.rateprogram\rateberegninger.sas";

%include "&filbane.Stiler\stil_figur.sas";
%include "&filbane.Stiler\Anno_logo_kilde_NPR_SSB.sas";

/******  DATAGRUNNLAG  ****************************************************************/

%Let innbyggerfil=Innbygg.innb_2004_2017_bydel_allebyer;

/******  HVA ØNSKER DU Å FÅ UT?  **************************************************************/
%let aarsvarfigur=1; /* Ønsker du Årsvariasjonsfigurer og/eller Konfidensintervallfigurer? */
%let aarsobs=1;/* dersom du ønsker årsobservasjonene med i figur - dersom ikke må denne stå tom */
%let NorgeSoyle=1; /* dersom du ønsker Norge som søyle i figur - dersom ikke må det stå =0 */
%let KIfigur=;
%let Mine_boomraader=; /* Utvalgte områder til figurer - eks: komnr in (1900:1930) eller bydel in (1:15)*/ 
%let vis_ekskludering=; /* Vis tabeller for ekskludering*/
/* Hvilke bonivåer ønskes? ja eller nei, hvor 1 betyr ja */
%let kommune=; 		/*Bildefiler*/ %let Fig_AA_kom=; 	%let Fig_KI_kom=;
%let kommune_HN=; 	/*Bildefiler*/ %let Fig_AA_komHN=; 	%let Fig_KI_komHN=;
%let fylke=; 		/*Bildefiler*/ %let Fig_AA_fylke=; 	%let Fig_KI_fylke=;
%let sykehus_HN=; 	/*Bildefiler*/ %let Fig_AA_ShHN=; 	%let Fig_KI_ShHN=;
%let HF=1; 			/*Bildefiler*/ %let Fig_AA_HF=; 	%let Fig_KI_HF=;
%let RHF=;			/*Bildefiler*/ %let Fig_AA_RHF=; 	%let Fig_KI_RHF=;
%let Oslo=; 		/*Bildefiler*/ %let Fig_AA_Oslo=; 	%let Fig_KI_Oslo=;
%let Verstkommune_HN=;
/* Dersom du skal ha bilde-filer */
%let bildeformat=png; /*Format*/
%let lagring="\\hn.helsenord.no\UNN-Avdelinger\SKDE.avd\Analyse\Data\SAS\Bildefiler"; /*Hvor skal filene lagres*/
%let hoyde=8.0cm; %let bredde=11.0cm; /*Høyde (8) og Bredde (11) på bildefilene, gjelder kun bilde-filer*/
%let skala=; /* Skala på x-aksen på figurene - eks: values=(0 to 0.8 by 0.2) */

/* Hvilke tabeller ønsker du? */
%Let Vis_Tabeller=1; /*1=Enkel tabell, 2=Enkel + CV og SCV, 3=Enkel + CV og SCV + Ujusterte rater og KI*/
%Let TallFormat=Excel; /*Tallformat i tabeller: NLnum=tusenskilletegn, Excel=klart til excel */
/* Vil du ha kart? */
%let kart=; /* ja eller nei */

%let rateformat=2; /*Antall desimaler på rate: 0,1 eller 2*/

%let Ut_sett=; /*Utdata, dersom du ønsker stor tabell med KI osv., --> Ut_sett=1 */

/******  PERIODE OG ALDER  **************************************************************/
%let StartÅr=2015;
%let SluttÅr=2017;
%Let aar=2016; /* Standardiseringsår defineres her*/


/******  JUSTERING  ********************************************************************/
%Let aldjust=Ermann=0; /*Aktiveres KUN dersom KUN aldersjustering*/
%Let standard = Aldersstandardiserte; /*Brukes til å lage figur og tabell-overskrifter */
%Let kjonn=(0); /*Dersom både menn og kvinner (0,1), dersom kun menn (1), dersom kun kvinner (0)*/
%Let rate_pr=10000; /*Definerer rate pr 1.000 eller 100.000 innbyggere eller osv */
%Let boomraade=BoRHF in (1:4); /*Definerer Boområder det skal beregnes rater for utfra BoRHF - her kan man velge andre kriterier, feks BoHF, komnr osv*/
%Let boomraadeN=BoRHF in (1:4); /*Definerer Boområder som det beregnes "nasjonale" andeler utfra BoRHF - her kan man velge andre kriterier, feks BoHF, komnr osv*/
%let SnittOmraade=Norge; /*Definerer Snittlinja på figurene - må være samsvar med boomraade ovenfor*/

/******  DU ER FERDIG  *******************************************************************/

