CREATE TRIGGER DeleteRelatedDataOnAttachmentDeletion
ON Attachments
AFTER DELETE
AS
BEGIN
  DECLARE @userId int;
  DECLARE @taskId int;
  SELECT @userId = uploader_id FROM deleted;
  SELECT @taskId = task_id FROM deleted;
  IF @userId IS NOT NULL
  BEGIN
    DELETE FROM Users WHERE id = @userId;
  END
  IF @taskId IS NOT NULL
  BEGIN
    DELETE FROM Tasks WHERE id = @taskId;
  END
END
