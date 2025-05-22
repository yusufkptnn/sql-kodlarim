


CREATE TABLE SIPTABLOSU(
Sipno int IDENTITY(1,1),
urunAD VARCHAR(20),
siparis_tarihi DATETIME NOT NULL,
teslim_tarihi DATETIME NOT NULL)

CREATE TRIGGER trg_chk_teslimat_tarihi
ON SIPTABLOSU
FOR INSERT, UPDATE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM inserted WHERE teslim_tarihi >= siparis_tarihi)
    BEGIN
        RAISERROR('Teslimat tarihi, sipariş tarihinden önce olamaz.', 16, 1)
        ROLLBACK TRANSACTION
    END
END
