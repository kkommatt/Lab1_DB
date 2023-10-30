CREATE PROCEDURE AssignProjectAccess
  @projectId int,
  @userId int
AS
BEGIN
  -- ��������, �� ���������� � ������ �������
  IF EXISTS (SELECT 1 FROM Projects WHERE id = @projectId) AND
     EXISTS (SELECT 1 FROM Users WHERE id = @userId)
  BEGIN
    -- ��������, �� ������ ��� ����� ����������� �� ����� ������� ��� ����
    IF NOT EXISTS (SELECT 1 FROM ProjectAccess WHERE project_id = @projectId AND user_id = @userId)
    BEGIN
      -- ���� ������� �� ����, ������ ����� � ������� ProjectAccess
      INSERT INTO ProjectAccess (project_id, user_id)
      VALUES (@projectId, @userId);
      PRINT '������ �� ������� ���������� ������.';
    END
    ELSE
    BEGIN
      PRINT '������ �� ������� ��� ���������� ��� ����� �����������.';
    END
  END
  ELSE
  BEGIN
    PRINT '���������� ��� ������ �� �������.';
  END
END
