CREATE OR ALTER TRIGGER TrlInsertReservation
   ON  Reservations
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (
		SELECT 1
			FROM inserted AS i
				JOIN RestaurantTables rt ON i.TableID = rt.TableID
			WHERE i.NumberOfPeople > rt.Capacity
	)
		BEGIN
			RETURN;
		END
	ELSE
		BEGIN
			INSERT INTO Reservations(ReservationID, CustomerID, TableID, ReservationTime, NumberOfPeople, [Status])
				SELECT i.ReservationID, i.CustomerID, i.TableID, i.ReservationTime, i.NumberOfPeople, i.[Status]
					FROM inserted AS i
		END
END
