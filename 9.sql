CREATE PROCEDURE CreateServer
  @serverName nvarchar(50),
  @ipAddress nvarchar(50),
  @adminId int,
  @serverDetails nvarchar(max)
AS
BEGIN
  -- ������� ����� ��� ����� ������ � ������� "Servers"
  INSERT INTO Servers (server_name, IP_adress, admin_id, details)
  VALUES (@serverName, @ipAddress, @adminId, @serverDetails);
END
