use [CB_MYSPACE_PAA]
--1_ColumnRenamer.sql

IF OBJECT_ID('dbo.tmp_renamer', 'U') IS NOT NULL 
 DROP TABLE dbo.tmp_renamer; 

--char(34) = "


-- amend line 3 to strip out any references to years 

select table_name
, column_name 
--,replace(column_name,char(34),'') as Newname -- this is "
,lower(replace(column_name,'&','and')) as Newname
--, charindex(char(38),column_name)
--  , lower(substring(column_name,(CHARINDEX('_',column_name))+1,(len(column_name)-(CHARINDEX('_',column_name))))) as Newname
--, substring(column_name,1,7) + substring(column_name,10,(len(column_name)-9)) as NewName
 into tmp_renamer
from INFORMATION_SCHEMA.COLUMNS
 where table_name like '%Death%'

--and charindex(char(38),column_name) >0
order by table_name, column_name



--select table_name
--, Newname
---- ,lower(replace(column_name,char(38),'')) as Newname
--,lower(replace(Newname,'&','')) as Newname2
-- into tmp_renamer2
--from tmp_renamer
----where table_name not like 'tmp_re%'
----and table_name like 'src_SUS_%'
------and charindex(char(38),column_name) >0
--order by table_name, Newname

-- This just does a general replace on the newname

  update tmp_renamer
  set Newname = replace(Newname,'&','and') 

  update [tmp_renamer]
  set Newname = replace(Newname,'(','') 

   update [tmp_renamer]
  set Newname = replace(Newname,')','') 

    update [tmp_renamer]
  set Newname = replace(Newname,'_-_','_') 


      update [tmp_renamer]
  set Newname = replace(Newname,'-','') 

      update [tmp_renamer]
  set Newname = replace(Newname,' ','_') 


        update [tmp_renamer]
  set Newname = replace(Newname,'__','_') 

          update [tmp_renamer]
  set Newname = replace(Newname,'__','_') 

        update [tmp_renamer]
  set Newname = replace(Newname,'"','') 



  update tmp_renamer 
  set Newname = case when isnumeric(left(Newname,1)) = '1' 
	  then 'a'+ Newname else Newname end 

-- renames the nhs numbers to digests - needs validation	  
update tmp_renamer
set Newname = REPLACE(Newname,'nhs','digest') 
where (column_name like 'NHS_N%'
or column_name like 'NHSN%')
and column_name not like '%st%'


update tmp_renamer
set Newname = REPLACE(Newname,'OPENPSEUDO_NHS_NUMBER','digest') 
where (column_name like 'OPENPSEUDO_NHS_NUMBER')


        update [tmp_renamer]
  set Newname = 'dmic_dec_month_of_birth'
where (column_name like '%DMIC_DEC_MONTH_OF_BIRTH%')

--select * from tmp_renamer