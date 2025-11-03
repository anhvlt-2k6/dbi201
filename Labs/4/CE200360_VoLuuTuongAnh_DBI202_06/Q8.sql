CREATE OR ALTER TRIGGER trgDelayEndSemester ON [Semesters]
        AFTER UPDATE
    AS BEGIN
        DECLARE @Id INT;

        SET @Id = (
            SELECT DISTINCT TOP(1) Id
                FROM inserted
        )

        IF EXISTS (
            SELECT BeginDate, EndDate
                FROM Semesters
                WHERE BeginDate <= EndDate
        ) BEGIN
            ROLLBACK TRANSACTION;
        END

        SELECT s.EndDate
            FROM Semesters AS s
            WHERE Id = @ID
    END;