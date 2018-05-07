/***********REKONSTRUKSJON***********************/

%let agg_var = rekonstruksjon_p;
%Let aldersspenn=in (16:105); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/

%include "&filbaneKvinSAS.Rater\rater_felles.sas";

/***********REDUKSJON***********************/

%let agg_var = reduksjon_p;
%Let aldersspenn=in (16:105); /*Definerer det aktuelle aldersspennet: (0:105) --> 0 til 105 år*/


%include "&filbaneKvinSAS.Rater\rater_felles.sas";


