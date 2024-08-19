-- USE Datenbankname wechselt angesprochene Datenbank
-- Alternativ "oben links" im Drop Down Men� richtige DB ausw�hlen
USE Northwind


/*
	SELECT: w�hlt Spalten aus,
	die im Ergebnisfenster angezeigt werden sollen
*/

SELECT * FROM Customers -- * = alle Spalten aus der Tabelle haben

-- "Custom"-Werte 
SELECT 100

SELECT 'Hallo'

SELECT 'Hallo', 100

SELECT CompanyName, Country FROM Customers

-- Orders & Customers Tabelle
-- Customers Tabelle nur die Spalte CompanyName haben
-- Und von der Orders m�chte ich alle Spalten haben 

--SELECT CompanyName, Orders.* FROM Customers -- JOIN .... 

-- Ist SQL Case Sensitive? => Nein
sElEcT		CoUnTry,

		CoMpAnYNaMe
FrOm		Customers


-- ORDER BY
-- Sortieren mit ORDER BY
SELECT * FROM Customers
ORDER BY City

-- Absteigend Sortieren mit
SELECT * FROM Customers
ORDER BY City DESC
-- DESC = Descending = absteigend
-- ASC = Ascending = aufsteigend (default)
-- ORDER BY syntaktisch immer am Ende steht

-- Mehrere Spalten sortieren
SELECT City, CompanyName FROM Customers
ORDER BY 2 ASC, 1 DESC

-- TOP X gibt nur die die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers

-- Die 20 gr��ten Frachtkosten von der Tabelle Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- Die 20 kleinsten Frachtkosten von der Tabelle Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

/*
	WICHTIG!: "BOTTOM" X existert nicht, Ergebnisse einfach "umdrehen" mit dem DESC
	im Order BY
*/

-- Duplikate "filtern" mit DISTINCT
-- Filtert alle Ergebnisse/Datens�tze deren Werte exakt gleich sind

SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

SELECT DISTINCT * FROM Customers

-- UNION f�hrt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT
-- Spaltenanzahl muss gleich sein, Datentypen m�ssen kompatibel sein

SELECT * FROM Customers
UNION
SELECT * FROM Customers

-- mit UNION ALL wird kein DISTINCT ausgef�hrt

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

SELECT 100, 'Hallo'
UNION
SELECT 'Tsch�ss', 5

-- Geht wiederrum schon
SELECT 100, 'Hallo'
UNION
SELECT 5, 'Tsch�ss'

SELECT 100, 'Hallo', 100
UNION
SELECT 5, 'Tsch�ss'

-- Aliase
SELECT 100 as Hundert, 'Hallo' as HalloTest
UNION
SELECT 5, 'Tsch�ss'

-- Geht wiederrum nicht
SELECT 100, 'Hallo' 
UNION
SELECT 5 as Hundert, 'Tsch�ss' as HalloTest

-- Spalten "umbennen" �ber Aliase bzw "as"
SELECT 100 as Zahl, 'Hallo' as Begr��ung

SELECT City AS Stadt FROM Customers

-- Aliase f�r Tabellennamen
SELECT  * FROM Customers as cus