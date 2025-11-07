CREATE FUNCTION dbo.F1 (@Diagnosis NVARCHAR(255), @Year INT)
    RETURNS INT
    AS BEGIN
        DECLARE @Num INT;

        SELECT @Num =
            COUNT(*)
        FROM
        (
            SELECT DISTINCT PatientID
            FROM dbo.MedicalRecords
            WHERE Diagnosis = @Diagnosis
            AND DATEPART(YEAR, RecordDate) = @Year
        ) AS t;

        RETURN ISNULL(@Num, 0);
    END;
