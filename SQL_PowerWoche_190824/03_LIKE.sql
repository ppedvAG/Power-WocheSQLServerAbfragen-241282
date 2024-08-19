USE Northwind

-- LIKE: Für ungenaue Filterung zuständig
-- LIKE statt Vergleichsoperator

SELECT ContactName FROM Customers
WHERE ContactTitle LIKE 'Manager'

-- Wildcards
-- %-Zeichen: Beliebige Symbol, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- _-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- []-Zeichen: Alles was in den Klammern ist, ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[3456]%'

-- a-z oder gegenteil ^ [^a-z]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[3-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^3-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-5 a-g]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 6-8]%'

-- Sonderfälle: % '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- 1. Alle ShipPostalCode's anzeigen lassen, die mit 0,2,4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'