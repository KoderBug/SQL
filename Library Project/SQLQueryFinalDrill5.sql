USE db_Library
GO

CREATE PROCEDURE dbo.TotalBooksLoaned
AS
Select lib_BranchName AS 'Library Branch', Count(bkl_BookID) AS 'Books Loaned Out' 
FROM Library_Branch
	INNER JOIN Book_Loans ON bkl_BranchID = lib_BranchID
GROUP BY lib_BranchName
GO
