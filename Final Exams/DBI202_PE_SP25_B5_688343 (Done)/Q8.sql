CREATE OR ALTER PROCEDURE AddReservation
    @ReservationID INT,
    @CustomerID INT,
    @TableID INT,
    @ReservationTime DATETIME,
    @NumberOfPeople INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
            FROM Reservations
            WHERE TableID = @TableID AND ReservationTime = @ReservationTime AND Status = 'Confirmed'
    )
        BEGIN
            PRINT 'The table must not already be reserved at the same time'
        END
    ELSE
        BEGIN
            INSERT Reservations (ReservationID, CustomerID, TableID, ReservationTime, NumberOfPeople, [Status])
                VALUES (@ReservationID, @CustomerID, @TableID, @ReservationTime, @NumberOfPeople, 'Confirmed');
        END
END
