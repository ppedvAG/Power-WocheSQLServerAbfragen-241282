USE Northwind

-- Die Customers & Orders Tabelle in ein Ergebnisfenster bringen
SELECT * FROM Customers
SELECT * FROM Orders

/*
	JOIN Syntax:
	SELECT * FROM TabelleA
	JOIN TabelleB ON A.Key = B.Key
*/

SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID

-- Reihenfolge der Joins
SELECT * FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Mehrdeutiger Spaltenname
SELECT Orders.CustomerID, Customers.* FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Aliase bei Joins
SELECT * FROM Customers as cus
INNER JOIN Orders as ord ON cus.CustomerID = ord.CustomerID

-- JOIN: Customers - Orders - Order Details - Products
SELECT * FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID

-- Fehler
select * from Customers
join Orders ON Customers.CustomerID = Orders.CustomerID
Join [Order Details] On [Order Details].OrderID = Orders.OrderID
Join Products On Products.ProductID = [Order Details].ProductID

-- Übung
-- 1. Bestellungen die Herr King bearbeitet hat
SELECT * FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'King'

-- 2. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
Select * from [Order Details]
Join Orders ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
Join Employees On Orders.EmployeeID = Employees.EmployeeID
Where Employees.LastName = 'Leverling'

-- 3. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? 
SELECT OrderID FROM
Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 4. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
SELECT ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC


-- 5. Alle Bestellungen (Orders) aus den USA (Customers Country) 
-- die im Jahr 1997 aufgegeben wurden
select * from Orders as o 
join Customers as c on o.CustomerID = c.CustomerID
where c.Country = 'USA' and o.OrderDate BETWEEN '19970101' AND '19971231';

-- 6. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- OUTER JOINS

-- Left
SELECT * FROM Orders as o
LEFT JOIN Customers as c ON o.CustomerID = c.CustomerID

SELECT * FROM Orders as o
Right JOIN Customers as c ON o.CustomerID = c.CustomerID

-- Full OUTER:
SELECT * FROM Orders as o
FULL OUTER JOIN Customers as c ON o.CustomerID = c.CustomerID

-- JOIN "invertieren", d.h keine Schnittmenge anzeigen, durch filtern nach NULL
SELECT * FROM Orders as O
RIGHT JOIN Customers as c ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL

-- CROSS JOIN: Erstellt ein karthesisches Produkt zweier Tabellen (A x B)
SELECT * FROM Orders CROSS JOIN Customers -- (830 x 94)

-- SELF JOIN:
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter
FROM Employees as E1
RIGHT JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo