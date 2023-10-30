CREATE FUNCTION GetTaskCountInProject
(
  @projectId int
)
RETURNS int
AS
BEGIN
  DECLARE @taskCount int;

  -- ϳ�������� ������� �������, �� ���������� �� ��������� �������
  SELECT @taskCount = COUNT(*) FROM Tasks WHERE project_id = @projectId;

  RETURN @taskCount;
END
