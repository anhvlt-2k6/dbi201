CREATE OR ALTER TRIGGER trgDelayEndSemester
   ON  [Semesters]
   AFTER UPDATE
AS 
BEGIN
	DECLARE @id INT;
	DECLARE @oldBeginDate DATE;
	
	SET @Id = (
		SELECT DISTINCT Id
			FROM inserted
	)

	SET @oldBeginDate = (
		SELECT BeginDate
			FROM Semesters
			WHERE Id = @Id
	)

	IF EXISTS (
		SELECT 1
			FROM inserted AS i
				JOIN Semesters AS s ON i.Id = s.Id AND i.EndDate <= s.EndDate
	)
	BEGIN
		UPDATE [Semesters]
			SET BeginDate = @oldBeginDate
			WHERE Id = @id
	END
END
