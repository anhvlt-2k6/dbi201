SELECT p.ProgramName, f.FacultyName, u.UniversityName
    FROM Program AS p
        JOIN Faculty AS f ON f.FacultyID = p.FacultyID
        JOIN University AS u ON u.UniversityID = f.UniversityID
        JOIN Country AS c ON u.CountryCode = c.CountryCode AND c.CountryName = 'United States';