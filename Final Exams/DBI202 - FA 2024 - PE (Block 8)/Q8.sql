CREATE TRIGGER dbo.Tr1 ON dbo.MedicalRecords
        INSTEAD OF INSERT
    AS BEGIN
        SET NOCOUNT ON;
        INSERT INTO dbo.MedicalRecords
            (RecordID, PatientID, DoctorID, AppointmentID, Diagnosis, Treatment, Notes, RecordDate)
        SELECT
            i.RecordID, i.PatientID, i.DoctorID, i.AppointmentID, i.Diagnosis, i.Treatment, i.Notes, i.RecordDate
        FROM inserted i
        INNER JOIN dbo.Appointments a
            ON i.AppointmentID = a.AppointmentID
        WHERE i.PatientID = a.PatientID
        AND i.DoctorID  = a.DoctorID
        AND i.RecordDate >= a.AppointmentDate;
    END;
GO
