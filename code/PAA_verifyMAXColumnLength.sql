-- Create a stored procedure to dynamically alter columns based on their lengths
USE [CB_MYSPACE_PAA];
GO
CREATE PROCEDURE AlterColumnLengths
AS
BEGIN
    DECLARE @sql VARCHAR(MAX);

    -- Check maximum character lengths for each column
    SELECT @sql = 
        'IF (SELECT MAX(LEN(Postcode_Country_Pseudo_Code)) FROM [dbo].[reference.PostcodeGeography]) > 8
            ALTER TABLE [dbo].[reference.PostcodeGeography] ALTER COLUMN Postcode_Country_Pseudo_Code VARCHAR(8);
         IF (SELECT MAX(LEN(Postcode_Country_Pseudo_Name)) FROM [dbo].[reference.PostcodeGeography]) > 1000
            ALTER TABLE [dbo].[reference.PostcodeGeography] ALTER COLUMN Postcode_Country_Pseudo_Name VARCHAR(1000);
         IF (SELECT MAX(LEN(CareHomeAtPostcode)) FROM [dbo].[reference.PostcodeGeography]) > 1000
            ALTER TABLE [dbo].[reference.PostcodeGeography] ALTER COLUMN CareHomeAtPostcode VARCHAR(1000);
         IF (SELECT MAX(LEN(CQC_ServiceTypes)) FROM [dbo].[reference.PostcodeGeography]) > 353
            ALTER TABLE [dbo].[reference.PostcodeGeography] ALTER COLUMN CQC_ServiceTypes VARCHAR(353);
         IF (SELECT MAX(LEN(DMIC_RECORD_VALID_IS_LATEST)) FROM [dbo].[reference.PostcodeGeography]) > 130
            ALTER TABLE [dbo].[reference.PostcodeGeography] ALTER COLUMN DMIC_RECORD_VALID_IS_LATEST VARCHAR(130);';

    -- Execute the dynamic SQL
    EXEC(@sql);
END;
-- After creating this stored procedure, we can execute it to dynamically alter the columns in
-- our table [dbo].[reference.PostcodeGeography] based on their lengths.


-- Since the above stored procedure doesn't return any results, SQL Server Management Studio or 
-- our SQL client may not display any output. However, we can verify if the alterations were
-- successful by checking the column lengths in the [dbo].[reference.PostcodeGeography] table.

USE [CB_MYSPACE_PAA];

SELECT 
    MAX(LEN(Postcode_Country_Pseudo_Code)) AS Max_Postcode_Country_Pseudo_Code,
    MAX(LEN(Postcode_Country_Pseudo_Name)) AS Max_Postcode_Country_Pseudo_Name,
    MAX(LEN(CareHomeAtPostcode)) AS Max_CareHomeAtPostcode,
    MAX(LEN(CQC_ServiceTypes)) AS Max_CQC_ServiceTypes,
    MAX(LEN(DMIC_RECORD_VALID_IS_LATEST)) AS Max_DMIC_RECORD_VALID_IS_LATEST
FROM 
    [dbo].[reference.PostcodeGeography];

	-- This will show us the maximum lengths of the columns after the alterations. If the 
	-- alterations were successful, the maximum lengths should be within the desired limits.



	-- To verify that the character counts for each column are correct before altering them, 
	-- we can run individual queries to check the maximum lengths of the columns. 


	-- Check maximum character length for Postcode_Country_Pseudo_Code column
SELECT MAX(LEN(Postcode_Country_Pseudo_Code)) AS Max_Postcode_Country_Pseudo_Code
FROM [dbo].[reference.PostcodeGeography];

-- Check maximum character length for Postcode_Country_Pseudo_Name column
SELECT MAX(LEN(Postcode_Country_Pseudo_Name)) AS Max_Postcode_Country_Pseudo_Name
FROM [dbo].[reference.PostcodeGeography];

-- Check maximum character length for CareHomeAtPostcode column
SELECT MAX(LEN(CareHomeAtPostcode)) AS Max_CareHomeAtPostcode
FROM [dbo].[reference.PostcodeGeography];

-- Check maximum character length for CQC_ServiceTypes column
SELECT MAX(LEN(CQC_ServiceTypes)) AS Max_CQC_ServiceTypes
FROM [dbo].[reference.PostcodeGeography];

-- Check maximum character length for DMIC_RECORD_VALID_IS_LATEST column
SELECT MAX(LEN(DMIC_RECORD_VALID_IS_LATEST)) AS Max_DMIC_RECORD_VALID_IS_LATEST
FROM [dbo].[reference.PostcodeGeography];
-- After running each of these queries individually to get the maximum length of characters for
-- each column in the [dbo].[reference.PostcodeGeography] table. Once we have verified these 
-- lengths, we can decide whether to proceed with altering the columns based on your requirements.



-- To directly inspect the data in each column. We can do this by querying sample data from the
-- columns and manually verifying the character counts.

-- Sample data for Postcode_Country_Pseudo_Code column
SELECT TOP 10 Postcode_Country_Pseudo_Code
FROM [dbo].[reference.PostcodeGeography];

-- Sample data for Postcode_Country_Pseudo_Name column
SELECT TOP 10 Postcode_Country_Pseudo_Name
FROM [dbo].[reference.PostcodeGeography];

-- Sample data for CareHomeAtPostcode column
SELECT TOP 10 CareHomeAtPostcode
FROM [dbo].[reference.PostcodeGeography];

-- Sample data for CQC_ServiceTypes column
SELECT TOP 10 CQC_ServiceTypes
FROM [dbo].[reference.PostcodeGeography];

-- Sample data for DMIC_RECORD_VALID_IS_LATEST column
SELECT TOP 10 DMIC_RECORD_VALID_IS_LATEST
FROM [dbo].[reference.PostcodeGeography];

-- By examining sample data from each column, you can manually count the characters to ensure 
-- accuracy. If we find any discrepancies or irregularities, we can investigate further and 
-- take appropriate action, such as modifying the data or altering the column definitions.
