CREATE OR ALTER PROCEDURE prcgetDepartment
    @In VARCHAR(100),
    @X VARCHAR(50) OUTPUT
    AS BEGIN
        SET @X = (
            SELECT d.Name
                FROM Departments AS d
                JOIN Students AS s ON d.Code = s.Department AND s.Name = @In
        )
    END
