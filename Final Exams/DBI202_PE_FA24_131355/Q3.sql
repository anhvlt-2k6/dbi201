SELECT a.AppointmentID, a.AppointmentDate, d.DoctorID, d.FirstName, d.LastName, a.Reason
    FROM Doctors AS d
        JOIN Appointments AS a ON a.DoctorID = d.DoctorID
    WHERE d.FirstName = 'Linda' AND d.LastName = 'Brown'