WITH s AS (
    SELECT u.UniversityName, f.FacultyName, COUNT(r.RankingID) AS CountN 
        FROM University AS u
            JOIN Faculty AS f ON f.UniversityID = u.UniversityID
            JOIN Ranking AS r ON u.UniversityID = r.UniversityID
            JOIN Country AS c ON c.CountryCode = u.CountryCode AND c.CountryName = 'Vietnam'
        GROUP BY u.UniversityName, f.FacultyName
)

SELECT s.UniversityName, s.FacultyName
    FROM s
    WHERE s.CountN = (
        SELECT MAX(s.CountN)
            FROM s
    )