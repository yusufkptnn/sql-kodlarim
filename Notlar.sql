CREATE TABLE Notlar(
ilk_not tinyint,
ikinci_not tinyint,
ucuncu_not tinyint,
Ortalama AS (ilk_not+ikinci_not+ucuncu_not)/3)
 

INSERT INTO Notlar
VALUES(74,45,50)
