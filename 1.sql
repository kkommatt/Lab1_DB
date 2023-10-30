CREATE PROCEDURE CreateProject
  @projectName nvarchar(50),
  @creatorId int,
  @categoryId int
AS
BEGIN
  DECLARE @newProjectID int; -- ���������� ����� ��� ���������� �������������� ������ �������

  -- ������� ����� ��� ����� ������ � ������� "Projects"
  INSERT INTO Projects (project_name, date_of_creation, date_of_last_modification, creator_id, category_id)
  VALUES (@projectName, SYSDATETIME(), SYSDATETIME(), @creatorId, @categoryId);

  -- ��������� �������������� ������ �������
  SELECT @newProjectID = SCOPE_IDENTITY();
END
