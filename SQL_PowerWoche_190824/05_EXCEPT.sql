USE Northwind

-- INTERSECT & EXCEPT -- Vergleicht Abfrageergebnise 

-- Intersect = Schnittmenge aus der zweier Abfragen haben
SELECT * FROM Customers -- 94 Rows
INTERSECT
SELECT * FROM Customers -- 13 Rows
WHERE Country = 'Germany'

-- EXCEPT = "Zeige mir alle Datensätze aus Abfrage 1, die NICHT 
--			ebenfalls in Abfrage 2 auftauchen"
SELECT * FROM Customers -- 94 Rows
EXCEPT
SELECT * FROM Customers -- 13 Rows
WHERE Country = 'Germany'