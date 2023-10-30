CREATE FUNCTION GetTaskCountInProject
(
  @projectId int
)
RETURNS int
AS
BEGIN
  DECLARE @taskCount int;

  -- Підрахунок кількості завдань, що відносяться до вказаного проекту
  SELECT @taskCount = COUNT(*) FROM Tasks WHERE project_id = @projectId;

  RETURN @taskCount;
END
