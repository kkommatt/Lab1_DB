CREATE PROCEDURE CreateUser
  @firstName nvarchar(50),
  @lastName nvarchar(50),
  @email nvarchar(100),
  @password nvarchar(100)
AS
BEGIN
  -- ������� ����� ��� ������ ����������� � ������� "Users"
  INSERT INTO Users (firstname, surname, email, [password], date_of_creation, date_of_last_modification)
  VALUES (@firstName, @lastName, @email, @password, SYSDATETIME(), SYSDATETIME());
END
