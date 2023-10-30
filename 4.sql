CREATE TRIGGER UpdateTaskLastModified
ON Tasks
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  -- Оновлення дати останньої зміни в таблиці "Завдання"
  UPDATE Tasks
  SET date_of_last_modification = GETDATE()
  FROM inserted i
  WHERE Tasks.id = i.id;
END
