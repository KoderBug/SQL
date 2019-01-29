USE db_Library
GO

CREATE PROCEDURE dbo.BooksDue
AS 
SELECT bwr_Name AS 'Borrower Name', bwr_Address AS 'Address', bk_Title AS 'Title'
FROM Borrower
	INNER JOIN Book_Loans ON bkl_CardNo = bwr_CardNo
	INNER JOIN Books ON bk_BookID = bkl_BookID
	INNER JOIN Library_Branch ON lib_BranchID = bkl_BranchID
WHERE bkl_DateDue = (SELECT CONVERT(DATE, GetDate()))
AND lib_BranchName = 'Sharpstown'
GO

