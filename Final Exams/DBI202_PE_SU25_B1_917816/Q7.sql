SELECT TOP(1) WITH TIES ra.AgencyID, ra.AgencyName, u.UniversityName
    FROM RankingAgency AS ra
        LEFT JOIN Ranking AS r ON ra.AgencyID = r.AgencyID
        LEFT JOIN University AS u ON r.UniversityID = u.UniversityID
        LEFT JOIN Country AS c ON c.CountryCode = u.CountryCode
    ORDER BY ra.AgencyID, ra.AgencyName