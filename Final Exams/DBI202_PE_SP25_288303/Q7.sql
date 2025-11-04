WITH c AS (
    SELECT DISTINCT DoctorID, Diagnosis, COUNT(RecordID) AS CountRID
        FROM MedicalRecords
        GROUP BY DoctorID, Diagnosis
), m AS (
    SELECT DISTINCT DoctorID, MAX(CountRID) AS MaxRID
        FROM c
        GROUP BY DoctorID
), mPer AS (
    SELECT c.DoctorID, c.Diagnosis
        FROM m, c
        WHERE m.DoctorID = c.DoctorID AND m.MaxRID = c.CountRID
), pPer AS (
    SELECT mr.DoctorID, mPer.Diagnosis, PatientID
        FROM mPer, MedicalRecords AS mr
        WHERE mPer.DoctorID = mr.DoctorID AND mPer.Diagnosis = mr.Diagnosis
)

SELECT d.DoctorID, d.FullName, pPer.Diagnosis, p.PatientID, (p.FirstName + ' ' + p.LastName) AS PatientFullName
    FROM pPer, Doctors AS d, Patients AS p
    WHERE pPer.DoctorID = d.DoctorID AND pPer.PatientID = p.PatientID
    ORDER BY d.FullName, pPer.Diagnosis, p.PatientID;