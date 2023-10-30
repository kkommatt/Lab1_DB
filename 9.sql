CREATE PROCEDURE CreateServer
  @serverName nvarchar(50),
  @ipAddress nvarchar(50),
  @adminId int,
  @serverDetails nvarchar(max)
AS
BEGIN
  -- Вставка даних про новий сервер в таблицю "Servers"
  INSERT INTO Servers (server_name, IP_adress, admin_id, details)
  VALUES (@serverName, @ipAddress, @adminId, @serverDetails);
END
