USE db_Library
GO

CREATE PROCEDURE dbo.CentralKingCopies
AS
SELECT lib_BranchName AS 'Branch Name', bk_Title AS 'Title', bkc_Number_of_Copies AS 'Number of Copies'
FROM Books
	INNER JOIN Book_Copies ON bkc_BookID = bk_BookID
	INNER JOIN Book_Authors ON bka_BookID = bk_BookID
	INNER JOIN Library_Branch ON lib_BranchID = bkc_BranchID
WHERE lib_BranchName = 'Central'
AND bka_AuthorName = 'Stephen King'
GO
