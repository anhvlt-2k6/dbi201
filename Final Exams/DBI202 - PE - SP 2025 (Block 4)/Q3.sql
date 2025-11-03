SELECT a.AppointmentID, a.AppointmentDate, d.DoctorID, d.FullName, d.Specialty, p.PatientID, (p.FirstName + ' ' + p.LastName) AS PatientFullName
    FROM Appointments AS a
        JOIN Doctors AS d ON d.DoctorID = a.DoctorID
        JOIN Patients AS p ON p.PatientID = a.PatientID
    WHERE d.Specialty = 'Orthopedics';