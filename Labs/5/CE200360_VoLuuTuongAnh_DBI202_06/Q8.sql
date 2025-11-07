CREATE OR ALTER TRIGGER trgDelayEndSemester
   ON  [Semesters]
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF UPDATE (BeginDate)
	BEGIN
		UPDATE s
			SET s.EndDate = d.EndDate
			FROM Semesters AS s
				JOIN inserted AS i ON s.Id = i.Id
				JOIN deleted AS d ON s.Id = d.Id
			WHERE i.EndDate < d.EndDate
	END
END;
