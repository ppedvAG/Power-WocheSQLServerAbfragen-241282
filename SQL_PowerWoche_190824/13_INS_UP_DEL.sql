


select 100 as Zahl1 , convert(varchar(50),'TXT') as Textzeug
into #txyz
--Daten aus anderern Tabellen in die vorhanden reinschreiben
--wenn alle Spalten in der gleichen Reihenfolge angegeben werden
--kein Problem

insert into #KundenEu
select Customerid , companyname, Country, City, 'A' as Typ
from customers where country in ('Germany', 'Italy', 'France')

select * from #KundenEU

--nimm die Länder Spain, Austria dazu und vergib das B für den Typ

INSERT INTO #KundenEU
select Customerid , companyname, Country, City, 'B' as Typ
from customers where country in ('Spain', 'Austria')


--füge noch Denmark dazu, aber vergib keinen Wert für Typ
--Spalten ohne Wert = NULL 
--aber Reihenfolgen und Anzahl muss immer passen

INSERT INTO #KundenEU
select Customerid , companyname, Country, City, NULL
from customers where country in ('Denmark')

--Reihgenfolge stimmt nicht, nicht alle Spalten füllen

insert into #KundenEU (Land, KdId, Typ , Firma)
VALUES				  ('Belgien','ppedv', 'C', 'ppedv AG')

insert into #KundenEU (Land, KdID, Firma, typ)
Values ('Belgien','ppedv','ppedv AG', NULL),
	 ('Belgien','ppedv','ppedv AG', NULL),
	 ('Belgien','ppedv','ppedv AG', NULL)
	 ,
	 ('Belgien','ppedv','ppedv AG', NULL)


insert into tabelle
select 100
UNION ALL
Select 200
UNION ALL 
select 400


--UPDATE
UPDATE TABELLE SET SPA = WERT
		WHERE SPB = Wert 


select * from #kundenEu

update #KundenEu set Typ = 'B'
	where Kdid = 'ALFKI'

--alle Italiner bekommen das C Rating
update #KundenEu set Typ = 'C', spx = 3
	where Land = 'ITALY'

begin tran
update #KundenEu set Typ = 'C'
	where Land = 'ITALY'
select @@TRANCOUNT
rollback --wenn falsch
commit --wenn korrekt



---UPDATE über mehr Tabellen

--Kopie
select * into o1 from orders


--erhöhe die Frachtkosten um 10 , bei den Best der Kunden aus GER

update o1 set freight = freight *1.1
--select orderid, o1.customerid, freight, country 
from 
	o1 inner join customers c	on 
									c.CustomerID=o1.customerid
where 
	   c.country = 'Germany'

select * into c1 from customers

select * from c1

--Ergänze den Firmennamen um ein X am Ende, ---c1
--wenn die Frachtkosten über 100 lagen  ---orders

Alfreds Futterkiste
Alfreds FutterkisteX


update c1 set companyname = companyname+'X'
--Select *
from c1 
				inner join orders o	ON c1.CustomerID=o.CustomerID
where 
		freight > 100	--187


--delete 

delete tabelle where sp = Wert

delete from tabelle where sp = wert


select * from o1


delete from o1 where employeeid = 5

--Lösche alle aus o1 deren Frachtkosten unter 1 liegen

delete 
--select *
from o1 where freight < 1

--lösche alle DS aus o1 die das Product Chai enthalten
delete from  o1
--select distinct o1.orderid 
from 
o1 inner join  [Order Details] od on od.OrderID=o1.OrderID
   inner join Products p on p.ProductID=od.ProductID
 where 
	p.ProductName = 'Chai'


select * from o1

--lösche die Frachtkosten von der orderid 10249 aus o1

update o1 set freight = NULL  --where sp is null
where orderid = 10249






























 























