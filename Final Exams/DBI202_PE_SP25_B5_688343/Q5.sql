SELECT d.DoctorID, d.FullName, d.Specialty, 
        COUNT(a.AppointmentID) AS NumberOfAppointments, 
        COALESCE(SUM(TotalAmount), 0) AS SumOfBillingTotalAmount
    FROM Doctors AS d
        LEFT JOIN Appointments AS a ON d.DoctorID = a.DoctorID 
            AND a.AppointmentDate >= '2021-01-01' 
            AND a.AppointmentDate < '2023-01-01'
        LEFT JOIN Billing AS b ON a.AppointmentID = b.AppointmentID
    WHERE d.Specialty = 'Neurology' 
    GROUP BY d.DoctorID, d.FullName, d.Specialty
    ORDER BY d.DoctorID;