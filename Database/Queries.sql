//1 Kwerendy
//1 - Top 5 wypożyczanych książek
SELECT top 5
K.title
,COUNT(*) as [Borrows counter]
FROM
Borrows W
join Books K on W.id_book = K.id_book
GROUP BY
K.title
,W.id_book
ORDER BY
COUNT(*) desc

//2 – Czytelnicy którzy nie osiągnęli pełnoletności
SELECT id_reader, login, phone_number, birth_date
FROM Readers
WHERE YEAR(GETDATE()) - YEAR(birth_date) < 18

//3 – Sprawdzenie poprawności adresów email
SELECT id_reader, login, email FROM Readers WHERE email NOT LIKE '%_@__%.__%';

//4 – Wyświetlanie ile lat mają czytelnicy
SELECT login,
CASE WHEN dateadd(year, datediff (year, birth_date , getdate()), birth_date) > getdate()
THEN datediff(year, birth_date, getdate()) - 1
ELSE datediff(year, birth_date, getdate())
END as age
FROM Readers;

//5 – Wykaz wszystkich użytkowników bazy (czytelników oraz pracowników)
SELECT id_employee as ID, login, password FROM Employees
UNION
SELECT id_reader as ID, login, password FROM Readers;

-------------

// Widoki
// 1 - Widok wszystkich użytkowników
CREATE VIEW Users
AS

SELECT id_employee as ID, login, password FROM Employees
UNION
SELECT id_reader as ID, login, password FROM Readers;

GO
SELECT * FROM Users
GO

//2 - Licznik wypożyczeń
CREATE VIEW BorrowsCounter
AS

SELECT
K.title, COUNT(*) as [Borrows counter]
FROM
Borrows W
join Books K on W.id_book = K.id_book
GROUP BY
K.title, W.id_book

GO
SELECT * FROM BorrowsCounter
GO

----------------

// Triggery
// 1 - Event Czas wypożyczenia

CREATE TRIGGER BorrowTime_INSERT
ON Borrows
FOR INSERT
AS
PRINT GETDATE()

// 2 - Bezpiecznik

CREATE TRIGGER Safety
ON Role
FOR INSERT, UPDATE, DELETE
AS
PRINT 'You cannot modify this table'

-------------------

// Procedury
// 1 - Wyświetlanie pełnoletnich użytkowników

CREATE PROCEDURE overEighteen
AS
BEGIN
SELECT id_reader, login, phone_number, birth_date
FROM Readers
WHERE YEAR(GETDATE()) - YEAR(birth_date) > 18
END;


// 2 - Wyświetlanie wszystkich użytkowników

CREATE PROCEDURE overEighteen
AS
BEGIN
SELECT id_employee as ID, login, password FROM Employees
UNION
SELECT id_reader as ID, login, password FROM Readers;
END;