CREATE OR ALTER TRIGGER insertDoctor ON dbo.Doctors
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @DEFDEPARTMENT INT;
	SET @DEFDEPARTMENT =  (
		SELECT DepartmentID
			FROM Departments
			WHERE [Name] = 'Cardiology'
	);

	INSERT INTO Doctors(DoctorID, FirstName, LastName, PhoneNumber, Email, DepartmentID)
		SELECT i.DoctorID, i.FirstName, i.LastName, i.PhoneNumber, i.Email, COALESCE(i.DepartmentID, @DEFDEPARTMENT)
			FROM inserted AS i
END;