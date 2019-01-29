USE db_testLibrary
GO

CREATE PROCEDURE dbo.libGetTribeCopyNo
AS 

SELECT bkc_Number_of_Copies AS 'Number of Copies' FROM Book_Copies	
	INNER JOIN Library_Branch ON lib_BranchID = bkc_BranchID
	INNER JOIN Books ON bk_BookID = bkc_BookID
	WHERE lib_BranchName = 'Sharpstown'
	AND bk_Title = 'The Lost Tribe'
GO
