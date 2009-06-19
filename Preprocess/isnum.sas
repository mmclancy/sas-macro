/**************************************************************

   Name: Preprocess/IsNum.SAS
   Type: SQL view definition
  Desc.: Creates SQL view for use with %isnum macro
Depends: Libname MacView must be open for write
         Using input() with ?? may not work in SAS 8   


Version Date       Description
1.0     19jun2009  Created, Søren Lassen

***************************************************************/
   
proc sql;
  create view macview.isnum as 
    select input(symget('parm'),?? best32.) is not null as isnum 
    from dictionary.macros;
quit;
