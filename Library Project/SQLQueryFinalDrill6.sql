USE db_Library
GO

CREATE PROCEDURE dbo.HighVolBorrowers
AS
SELECT bwr_Name AS 'Borrower Name', bwr_Address AS 'Address', Count(bkl_BookID) AS 'Number Checked Out'
FROM Borrower
	INNER JOIN Book_Loans ON bkl_CardNo = bwr_CardNo
GROUP BY bwr_Name, bwr_Address
HAVING Count(bkl_BookID) > 5
ORDER BY bwr_Name
GO