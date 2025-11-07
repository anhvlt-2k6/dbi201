CREATE OR ALTER FUNCTION dbo.F1 (@DepartmentID INT)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT;

	SET @Result = (
		SELECT COUNT(DISTINCT a.PatientID) AS CountPatientID
		FROM Departments AS d
			JOIN Doctors AS dc ON d.DepartmentID = dc.DepartmentID
			JOIN Appointments AS a ON dc.DoctorID = a.DoctorID
		WHERE d.DepartmentID = @DepartmentID
		GROUP BY d.DepartmentID
	)

	RETURN ISNULL(@Result, 0);
END
