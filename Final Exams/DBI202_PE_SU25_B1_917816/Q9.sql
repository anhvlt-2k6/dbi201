CREATE OR ALTER TRIGGER PreventDuplicateRanking ON [Ranking]
   AFTER INSERT
AS 
BEGIN
	IF EXISTS (
        SELECT TOP(1) *
            FROM inserted i
                JOIN Ranking AS r ON i.UniversityID = r.UniversityID 
                    AND i.AgencyID = r.AgencyID 
                    AND i.RankingYear = r.RankingYear
                    AND i.RankingID <> r.RankingID
    ) BEGIN
        ROLLBACK TRANSACTION;
    END
END
