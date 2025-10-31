WITH numApp AS (
    SELECT PatientID, COUNT(BillID) AS num
                FROM Billing
                GROUP BY PatientID
), sumApp AS (
    SELECT PatientID, SUM(TotalAmount) AS sum
            FROM Billing
            GROUP BY PatientID
)

SELECT p.PatientID, p.FirstName, p.LastName, p.BloodType, 
    CASE 
        WHEN n.num IS NULL THEN 0
        ELSE n.num
    END AS NumberOfAppointments,
    CASE 
        WHEN s.sum IS NULL THEN 0
        ELSE s.sum
    END AS SumOfBillingTotalAmount
        FROM Patients AS p
            LEFT JOIN numApp n ON n.PatientID = p.PatientID
            LEFT JOIN sumApp s ON s.PatientID = p.PatientID
            LEFT JOIN Appointments a ON p.PatientID = a.PatientID
        WHERE p.BloodType IN ('A+', 'A-') AND YEAR(a.AppointmentDate) IN ('2020', '2021');