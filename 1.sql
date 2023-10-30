CREATE PROCEDURE CreateProject
  @projectName nvarchar(50),
  @creatorId int,
  @categoryId int
AS
BEGIN
  DECLARE @newProjectID int; -- Оголошення змінної для збереження ідентифікатора нового проекту

  -- Вставка даних про новий проект в таблицю "Projects"
  INSERT INTO Projects (project_name, date_of_creation, date_of_last_modification, creator_id, category_id)
  VALUES (@projectName, SYSDATETIME(), SYSDATETIME(), @creatorId, @categoryId);

  -- Отримання ідентифікатора нового проекту
  SELECT @newProjectID = SCOPE_IDENTITY();
END
