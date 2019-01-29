USE db_Library
GO

CREATE PROCEDURE dbo.NoCheckOuts
AS
SELECT bwr_Name AS 'Borrower with No Check Outs' 
FROM Borrower
	LEFT JOIN Book_Loans ON bkl_CardNo = bwr_CardNo
GROUP BY bwr_Name
HAVING Count(bkl_BookID) = 0
ORDER BY bwr_Name
GO



