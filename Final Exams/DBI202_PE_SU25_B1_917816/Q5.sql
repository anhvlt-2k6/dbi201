SELECT u.UniversityName, r.RankingID, r.RankingYear, COUNT(*) AS NumberOfCriterion, AVG(rd.Score) AS AverageScore
    FROM University AS u
        LEFT JOIN Ranking AS r ON u.UniversityID = r.UniversityID AND r.RankingYear = 2024
        LEFT JOIN RankingDetail AS rd ON r.RankingID = rd.RankingID
        JOIN Country AS c ON c.CountryCode = u.CountryCode AND CountryName IN ('Vietnam', 'United Kingdom', 'United States')
    GROUP BY u.UniversityName, r.RankingID, r.RankingYear
    ORDER BY u.UniversityName ASC, r.RankingID ASC;