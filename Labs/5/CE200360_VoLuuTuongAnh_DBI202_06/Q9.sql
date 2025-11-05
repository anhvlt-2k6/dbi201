CREATE OR ALTER PROCEDURE prcgetDepartment
    @In VARCHAR(100),
    @X VARCHAR(50) OUTPUT
AS
BEGIN
    SET @X = (
        SELECT de.Name AS Department
                FROM Students AS s
                    JOIN Departments AS de ON s.Department = de.[Code]
                WHERE s.Name = @In
    );
END