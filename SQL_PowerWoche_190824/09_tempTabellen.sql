--temporäre vs temporale Tabellen (Versionierung)

/*
#tabelle
lokale temp Tabelle
--Zwischenergebnis
Gültigkeit: 
Lebensdauer ist beschränkt
--bis sie gelöscht wird drop table
--Sessiondauer.. wird das Fenster geschlossen oder die Verb beendet 
--ist auch die #tab weg
Erreichbarkeit
ist nur in der Ersteller Session gültig


##tabelle
globale temp Tabelle
Erreichbarkeit
---in allen Sessions

Lebensdauer
bis die Session beendet wird oder Tab gelöscht
allerdings werden laufende Abfrfage nicht unterbrochen


--temp Tabellen besitzten immer nur Kopien von Daten oder Ergebisse 
werden aber nicht autm aktualisert





Komplexex Dinge zu vereinfachen



*/
--alle Abfrageergebnisse iun eine neue Tabelle umgeleiten












--ABC Analayse

select * from orders

-- Freight > 500  C Kunde
--         < 100  A Kunde
--          Rest ist B Kunden

--Customerid, Freight, Typ
--ALFKI        32       A


select	  customerid 
		, freight 
		, 'C' as Typ
from	  orders 
where     
		freight > 500
UNION ALL
select	  customerid 
		, freight 
		, 'A' as Typ
from	  orders 
where     
		freight < 100
UNION ALL
select	  customerid 
		, freight 
		, 'B' as Typ
from	  orders 
where     
		freight between 100 and 500




select 100
union all --! auch  doppelte zeilen
select 200
union all
select 300
union all
select 100








--es bleiben Spaltennamen und Datentypen erhalten und identity Spalten
select * into tabelleA from tabelleB

select * into kunden from customers

select * from kunden

select * into #t from customers
select * into ##t from customers

select * from #t

select * into #KU from vKundeumsatz

select * from vKundeUmsatz

select * from #ku
--nun ABC mit temp Tabellen

select	  customerid 
		, freight 
		, 'C' as Typ
into #t1 
from	 orders 
where     
		freight > 500

select	  customerid 
		, freight 
		, 'A' as Typ
into #t2
from	 orders 
where     
		freight < 100

select	  customerid 
		, freight 
		, 'B' as Typ
into #t3 
from	 orders 
where     
		freight between 100 and 500

select * from #t1
UNION ALL
select * from #t2
UNION ALL
select * from #t3

drop table #t1
drop table #t2
drop table #t3

select	  customerid 
		, freight 
		, 'C' as Typ
into #t1 
from	 orders 
where     
		freight > 500

insert into #t1
select	  customerid 
		, freight 
		, 'B' as Typ
from	 orders 
where     
		freight between 201 and 500

insert into #t1
select	  customerid 
		, freight 
		, 'A' as Typ
from	 orders 
where     
		freight < 100

select * from #t1

update #t1 set freight = 100
where

update #t1 set freight = o.freight
--select * 
from #t1 inner join orders o on #t1.orderid = o.orderid
where o.orderid < 10000






