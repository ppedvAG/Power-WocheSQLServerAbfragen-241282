USE Northwind

-- String Funktionen  bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge des Strings zur�ck (Anzahl der Characters) als int
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" oder "rechten" x Zeichen eines Strings zur�ckgeben
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zur Position x in einem String und geben y Zeichen zur�ck
SELECT SUBSTRING(CompanyName, 5, 10), CompanyName FROM Customers

-- CONCAT f�gt mehrere Strings in die selbe Spalte zusammenf�gen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees

-- Datumsfunktionen
SELECT GETDATE() -- aktuelle Systemzeit

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag,
OrderDate FROM Orders

-- "Zieht" ein gew�nschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) AS Stunde
FROM Orders

-- Zieht den IntervallNamen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY,OrderDate),
DATEPART(WEEKDAY, OrderDate), OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())


-- Differenz in Intervall xy zwischen 2 Datums
SELECT DATEDIFF(YEAR, '20050213', GETDATE())

-- �bungen:
-- 1. Alle Bestellungen (Orders) aus Q2 in 1997
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate)	= 2

-- 2. Alle Produkte (ProductName) die um Weihnachten herum (+-10 Tage) in
-- 1996 verkauft wurden
SELECT ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN '19961214' AND '19970103'