CREATE FUNCTION F1 (@diag NVARCHAR(255), @year INT)
RETURN INT
AS
BEGIN

END;

SELECT Diagnosis, COUNT(RecordID) AS CountRID
    FROM MedicalRecords AS m
    WHERE YEAR(m.RecordDate) IN ('2019', '2020', '2021')
    GROUP BY Diagnosis
    