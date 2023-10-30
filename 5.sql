CREATE PROCEDURE AddTaskComment
  @taskId int,
  @commentText nvarchar(max),
  @userId int
AS
BEGIN
  -- Вставка даних про новий коментар до завдання в таблицю "TaskComments"
  INSERT INTO TaskComments (task_id, comment, date_of_creation, user_id)
  VALUES (@taskId, @commentText, SYSDATETIME(), @userId);
END
