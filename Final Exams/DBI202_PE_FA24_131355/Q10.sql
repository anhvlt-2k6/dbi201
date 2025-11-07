DELETE FROM AppointmentTests
    WHERE TestID IN (
        SELECT TestID
            FROM Tests
            WHERE Name IN ('MRI Scan', 'X-Ray')
    )

DELETE FROM Tests
    WHERE Name IN ('MRI Scan', 'X-Ray')