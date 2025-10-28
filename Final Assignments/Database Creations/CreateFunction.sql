CREATE OR ALTER TRIGGER prevent_table_alteration ON DATABASE
        FOR ALTER_TABLE
    AS
    BEGIN
        PRINT 'Table alterations are not allowed in this database.';
        ROLLBACK;
    END;
GO