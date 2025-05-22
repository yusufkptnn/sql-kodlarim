create table calisanlistesi2(
ID int primary key identity(1,1),
ad varchar(50) not null,
soyad varchar(50) not null,
eposta varchar(120) not null)


CREATE TRIGGER tr_HosgeldinMaili 
ON calisanlistesi2
AFTER INSERT
AS
BEGIN

DECLARE @Email VARCHAR(255), @AdSoyad VARCHAR(255)
DECLARE @profile_name VARCHAR(100), @recipients VARCHAR(100)



SELECT @Email = eposta, @AdSoyad = CONCAT(ad, ' ', soyad) FROM inserted

SET @profile_name = 'SERVERDAK� CONF�GRASYON YAPILAN PROF�L ADI'
SET @recipients = @Email


EXEC msdb.dbo.sp_send_dbmail
    @profile_name = @profile_name,
    @recipients = @recipients,
    @subject = 'Ho�geldiniz',
    @body =  ' Ho�geldiniz! Yeni �al��ma hayat�n�zda ba�ar�lar dileriz.'
	END;
IF @@ERROR <> 0
    BEGIN
        PRINT 'E-posta g�nderimi ba�ar�s�z oldu.'
        
		END;




		INSERT INTO calisanlistesi2(ad,soyad,eposta)
		VALUES('habip','polat','habip1921@gmail.com')

