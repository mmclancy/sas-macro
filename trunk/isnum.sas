/***********************************************************
   Name: IsNum
  Desc.: Test if a value is a valid floating point number   
   Type: SAS macro function
   Parm: Value to be tested
 Result: Boolean 
           1 if &parm is a valid SAS floating point value
           0 otherwise
Depends: SQL view MacView.IsNum, defined as
            select input(symget('parm'),?? best32.) is not null as isnum 
               from dictionary.macros   
         which is created in preprocess/IsNum.sas
  Usage: Replaces SAS institute macro %datatyp, which is
           - slower
           - does not check for overflow/underflow
           - syntactically more complicated
Example: %if %isnum(&value) %then %do; 

  Version  Date       Description                
  1.0      19jun2009  Created, Søren Lassen
    
**************************************************************/
 
%macro isnum(parm);
  %local dsid rc;
  %let dsid=%sysfunc(open(macview.isnum));
  %let rc=%sysfunc(fetch(&dsid));
  %do;%sysfunc(getvarn(&dsid,1))%end;
  %let rc=%sysfunc(close(&dsid));
%mend;
