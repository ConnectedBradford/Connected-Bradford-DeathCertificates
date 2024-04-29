Use [CB_MYSPACE_PAA];
SELECT*From[dbo].[reference.PostcodeGeography];

 
ALTER TABLE [dbo].[reference.PostcodeGeography]
ADD cb_datasetref VARCHAR(35);


UPDATE [dbo].[reference.PostcodeGeography]
SET cb_datasetref = 'Release3.7';
-- This statement will set the value of the cb_datasetref column to  reference.PostcodeGeography for all existing rows in the [dbo].[reference.PostcodeGeography] table. 


Use [CB_MYSPACE_PAA];
SELECT*From[dbo].[reference.PostcodeGeography_1];

 
ALTER TABLE [dbo].[reference.PostcodeGeography_1]
ADD cb_datasetref VARCHAR(35);


UPDATE [dbo].[reference.PostcodeGeography_1]
SET cb_datasetref = 'Release4.7';
-- This statement will set the value of the cb_datasetref column to  reference.PostcodeGeography_1 for all existing rows in the [dbo].[reference.PostcodeGeography_1] table. 


Use [CB_MYSPACE_PAA];
SELECT*From [dbo].[Output Specification_1] ;

 
ALTER TABLE [dbo].[Output Specification_1]
ADD cb_datasetref VARCHAR(35);


UPDATE [dbo].[Output Specification_1]
SET cb_datasetref = 'Release4.7';
-- This statement will set the value of the cb_datasetref column to  reference.PostcodeGeography for all existing rows in the [dbo].[reference.PostcodeGeography] table. 


