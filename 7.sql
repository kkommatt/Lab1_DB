CREATE FUNCTION CheckUserPassword
(
  @userId int,
  @password nvarchar(100)
)
RETURNS bit
AS
BEGIN
  DECLARE @isPasswordValid bit;

  -- Перевірка правильності пароля користувача
  SELECT @isPasswordValid = CASE WHEN password = @password THEN 1 ELSE 0 END
  FROM Users
  WHERE id = @userId;

  RETURN @isPasswordValid;
END
