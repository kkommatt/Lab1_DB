CREATE PROCEDURE AssignProjectAccess
  @projectId int,
  @userId int
AS
BEGIN
  -- Перевірка, чи користувач і проект існують
  IF EXISTS (SELECT 1 FROM Projects WHERE id = @projectId) AND
     EXISTS (SELECT 1 FROM Users WHERE id = @userId)
  BEGIN
    -- Перевірка, чи доступ для цього користувача до цього проекту вже існує
    IF NOT EXISTS (SELECT 1 FROM ProjectAccess WHERE project_id = @projectId AND user_id = @userId)
    BEGIN
      -- Якщо доступу ще немає, додаємо запис у таблицю ProjectAccess
      INSERT INTO ProjectAccess (project_id, user_id)
      VALUES (@projectId, @userId);
      PRINT 'Доступ до проекту призначено успішно.';
    END
    ELSE
    BEGIN
      PRINT 'Доступ до проекту вже призначено для цього користувача.';
    END
  END
  ELSE
  BEGIN
    PRINT 'Користувач або проект не існують.';
  END
END
