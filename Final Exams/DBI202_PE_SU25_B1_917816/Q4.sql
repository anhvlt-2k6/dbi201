SELECT u.UniversityName, c.CountryName, f.FacultyName, p.ProgramName, p.DegreeType
    FROM University AS u
        JOIN Country AS c ON c.CountryCode = u.CountryCode AND c.CountryName = 'Vietnam'
        LEFT JOIN Faculty AS f ON u.UniversityID = f.UniversityID
        LEFT JOIN Program AS p ON p.FacultyID = f.FacultyID
    ORDER BY u.UniversityName ASC, f.FacultyName DESC, p.ProgramName ASC; 