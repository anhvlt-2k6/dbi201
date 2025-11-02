SELECT d.DoctorID, d.FullName AS DoctorFullName, p.PrescriptionID, p.Medicine, p.Dosage, p.PrescriptionDate, pa.PatientID, (pa.FirstName + ' ' + pa.LastName) AS PatientFullName
    FROM Doctors AS d
        LEFT JOIN Prescriptions p ON d.DoctorID = p.DoctorID AND p.PrescriptionDate >= '2020-05-15' AND p.PrescriptionDate <= '2020-09-15'
        LEFT JOIN Patients pa ON p.PatientID = pa.PatientID
    ORDER BY d.FullName, p.PrescriptionDate;