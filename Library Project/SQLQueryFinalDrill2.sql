USE db_Library
GO

CREATE PROCEDURE dbo.BranchesWTribe
AS
SELECT lib_BranchName AS 'Library Branch', bkc_Number_of_Copies AS 'Number of Copies'
FROM Book_Copies
	INNER JOIN Library_Branch ON lib_BranchID = bkc_BranchID 
	INNER JOIN Books ON bk_BookID = bkc_BookID
WHERE bk_Title = 'The Lost Tribe'
ORDER BY lib_BranchName
GO

