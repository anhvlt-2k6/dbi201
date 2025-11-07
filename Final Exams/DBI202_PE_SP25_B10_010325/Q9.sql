CREATE OR ALTER PROCEDURE proc_report
	@deptname VARCHAR(50),
	@result INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @result = (
		SELECT COUNT(StudentID)
			FROM Students
			WHERE DepartmentID = (
				SELECT DepartmentID
					FROM Departments
					WHERE DepartmentName = @deptname
			)
	)
END
