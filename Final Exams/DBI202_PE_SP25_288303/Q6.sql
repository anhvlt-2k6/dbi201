WITH s AS (
    SELECT a.DoctorID, SUM(b.TotalAmount) AS SumOfTotalAmount
        FROM Billing AS b, Appointments AS a
        WHERE b.AppointmentID = a.AppointmentID
        GROUP BY a.DoctorID
), m AS (
    SELECT DISTINCT Specialty, MAX(SumOfTotalAmount) AS MaxPerSpecTotalAmount
        FROM s, Doctors AS d
        WHERE s.DoctorID = d.DoctorID
        GROUP BY Specialty
)

SELECT d.Specialty, d.DoctorID, d.FullName, s.SumOfTotalAmount
    FROM m, s, Doctors AS d
    WHERE m.MaxPerSpecTotalAmount = s.SumOfTotalAmount AND s.DoctorID = d.DoctorID
    ORDER BY d.Specialty