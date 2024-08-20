SELECT
	Spalte,
	(Select ...from ..where ) --nur eine Zeile und eine Spalte
FROM
	 (select ... from where...) T --tabellenartig muss benannt sein
INNER JOIN TabelleX on X.sp = T.spx
WHERE 
	T.SPY = Wert AND
	T.SPC > (Select ...from tab where ..)--darf nur ein Wert enthalten
	OR
	T.SPC = (select ... from ..where ) 
	OR
	T.SPC IN (select sp from tab where ..) --nur eine Spalte



--wir wollen alle Bestellungen aus orderS haben,
--deren Frachtkosten über dem Schnitt der Frachtkosten liegen

select avg(freight) from orders

select * from orders 
where freight > (select avg(freight) from orders)
order by freight asc


--Vergleiche die akt Frachtkosten mit dem Schnitt der Frachtkosten
--Resultat.. alle Spalten der orders aber mit SchnittFrachtkosten
-- , Abw vom Schnitt und akt Frachtkosten

select 
		 freight as aktFrachtkosten
		, (select avg(freight) from orders) as SchnittFracht
		, (freight -(select avg(freight) from orders)) as AbwReal
		,* 
from orders
order by AbwReal asc

--Variablen

--WHILE

--IF

--CASE

--Prozeduren
--Funktionen

















