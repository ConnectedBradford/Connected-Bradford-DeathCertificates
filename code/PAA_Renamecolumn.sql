Use [CB_MYSPACE_PAA];
ALTER TABLE [dbo].[Output Specification_1]
ALTER COLUMN cb_datasetref VARCHAR(11);


USE[CB_MYSPACE_PAA];

EXEC sp_rename 'dbo.[Output Specification_1].[Column 0]', 'Field Name', 'COLUMN';
EXEC sp_rename 'dbo.[Output Specification_1].[Column 1]', 'Format', 'COLUMN';
EXEC sp_rename 'dbo.[Output Specification_1].[Column 2]', 'Field Description', 'COLUMN';

-- This will rename the columns accordingly. 