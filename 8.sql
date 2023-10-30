CREATE TRIGGER CreateUserHistoryRecord
ON Users
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  SET NOCOUNT ON;
  
  DECLARE @entityName nvarchar(50);
  DECLARE @userId int;
  DECLARE @changeDate datetime;

  SELECT @entityName = 'Users';
  SELECT @userId = CASE
    WHEN EXISTS (SELECT * FROM inserted) THEN (SELECT id FROM inserted)
    WHEN EXISTS (SELECT * FROM deleted) THEN (SELECT id FROM deleted)
    ELSE NULL
  END;
  SET @changeDate = GETDATE();

  IF @userId IS NOT NULL
  BEGIN
    INSERT INTO History (entity_name, user_id, date_of_change)
    VALUES (@entityName, @userId, @changeDate);
  END
END
