SELECT a.AppointmentID, a.AppointmentDate, d.DoctorID, d.FullName AS DoctorFullName, d.Specialty, p.PatientID, (p.FirstName + ' ' + p.LastName) AS PatientFullName
    FROM MedicalRecords AS m, Appointments AS a, Patients AS p, Doctors AS d
    WHERE a.PatientID = p.PatientID AND a.AppointmentID = m.AppointmentID AND a.DoctorID = d.DoctorID
        AND d.Specialty LIKE 'Orthopedics'