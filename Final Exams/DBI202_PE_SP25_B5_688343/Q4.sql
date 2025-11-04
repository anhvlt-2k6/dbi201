SELECT d.DoctorID, d.FullName AS DocterFullName, p.PrescriptionID, p.Medicine, p.Dosage, p.PrescriptionDate, (pa.FirstName + ' ' + pa.LastName) AS PatientFullName
    FROM Doctors AS d
        LEFT JOIN Prescriptions AS p ON p.DoctorID = d.DoctorID AND (p.PrescriptionDate BETWEEN '2020-05-15' AND '2020-09-15')
        LEFT JOIN Patients AS pa ON pa.PatientID = p.PatientID
    ORDER BY d.FullName, p.PrescriptionDate;