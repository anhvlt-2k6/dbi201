CREATE OR ALTER TRIGGER Tr1 ON MedicalRecords
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DELETE MR
		FROM MedicalRecords MR
		JOIN inserted i ON MR.RecordID = i.RecordID
		LEFT JOIN Appointments A ON i.AppointmentID = A.AppointmentID
    WHERE A.AppointmentID IS NULL
        OR i.RecordDate < A.AppointmentDate
        OR ISNULL(i.PatientID, -1) <> ISNULL(A.PatientID, -1)
        OR ISNULL(i.DoctorID, -1) <> ISNULL(A.DoctorID, -1);

END
