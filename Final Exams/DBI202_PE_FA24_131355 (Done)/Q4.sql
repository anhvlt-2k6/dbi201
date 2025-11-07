SELECT DISTINCT p.PatientID, p.FirstName, p.LastName, p.DateOfBirth, p.Email
    FROM Patients AS p
        JOIN Appointments AS a ON p.PatientID = a.PatientID 
            AND a.DoctorID IN (
                                SELECT d.DoctorID
                                    FROM Doctors AS d
                                        JOIN Departments AS da ON d.DepartmentID = da.DepartmentID
                                    WHERE da.Name = 'Cardiology'
                            )
            AND (YEAR(a.AppointmentDate) >= 2021 AND YEAR(a.AppointmentDate) <= 2024)
    ORDER BY p.PatientID ASC;