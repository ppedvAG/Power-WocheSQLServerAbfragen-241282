---Sicht temp Tabellen

/*
Sicht = Abfrage (mit nur einem Ergebnis)

create or alter view
as
select ...



temp = Kopie von Daten , wird nicht autom aktualisiert
Zwischenergebnis
vereinfacht den Code

# lokal nur für den Ersteller in seiner Session sichtbar
## global  für alle sichtbar


Select ... order by --manchmal verlangt die Sicht einen TOP
--top 100 percent


top 10 with ties  lt order by werden zusätzliche Zeilen angezeigt, die mit dem letzten Wert übereinstimmen


create table tblname
	(
	 Sp1 int identity(1,1) primary key
	,Sp2 char(5) not null
	,Sp3 varchar(5)
	)

alter table tblname
add Sp4 int

alter table tblname
drop column spx 


'otto'  '1234'

char(50)   'Otto                               '  50
varchar(50) 'Otto'   4
decimal(5,0)
nvarchar nchar UNICODE
nchar(50)   'Otto                               '  50*2
nvarchar(50) 'Otto'   4*2



insert

Daten in eine noch nicht exist. Tabellle schreiben
select spalten, ... into tabellename from tabelle

select 10, 200 into t10

select convert(datentyp, sp)

Daten in best Tabelle
..wenn Reihenfolge, Datentypo und Spaltenzahl ident ist ,dann geht das so..

insert into tabelle
select ...

..wenn doch nicht, dann
insert into (Sp2, Sp1, Sp4)
select Wert1, weert2 , wert3

insert into tabelle (sp2,	sp5,	sp4)
values				(wert1, Wert2, wert3)





update 


---Schritt 1
select ..... from tabelle ..join ..join.. where 

--Schritt 2
--select ..... 
from tabelle ..join ..join tabc c.. where 

--Schritt 3
update tabelle set Sp = c.wert  
--select ..... 
from tabelle ..join ..join Tabc.. where 


delete 

---Schritt 1
select ..... from tabelle ..join ..join.. where 

--Schritt 2
--select ..... 
from tabelle ..join ..join.. where 

--Schritt 3
delete 
--select ..... 
from tabelle ..join ..join.. where 
*/


Select Sp, (select ..) --darf nur ein Wert rauskommen
from (select ...) t --muss einen Namen haben
inner join tabc on t.sp = tabc.sp
where 
	sp in (selec ... ) --darf nur eine Spalte, aber mehrere Zeilen
	sp = < <  (selec ... )  --darf nur noch eine Zeile und ein Spalte haben



	AGG


	--wenn im Select neben dem AGG noch eine weitere oder mehr Spalten stehen
	--dann müssen diese Spalten auch im Group by vorkommen
	--having sollte nur das AG enthalten


	select SP1, Sp2 , sum(spx) as Summe from tabelle
	where sp10 = 100
	group by SP1, Sp2  having sum(spx) < 100 [with rollup|cube]
	order by spx


	/*

1. Erstelle eine Tabelle SalesEmp
	Spalten: 
	AngID int, FamName varchar(50), Stadt v(50) ,
	Land v(50), Umsatz (money)
*/
	create table SalesEmp
		(AngID int, FamName varchar(50), Stadt varchar(50),
		Land varchar(50), Umsatz money)

/*
2. Füge den besten und schlechtesten Verkäufer 
	mit dem jeweiligen Umsatz ein
*/

select e.employeeid,e.Lastname, e.country, e.City,
		sum(unitprice*quantity) as Umsatz
FROM 
	employees e 
		inner join orders o			  on e.employeeid = o.employeeid
		inner join [order details] od on od.orderid   = o.orderid
GROUP BY
	e.employeeid,e.Lastname, e.country, e.City


--tempTabelle
select e.employeeid,e.Lastname, e.country, e.City,
		sum(unitprice*quantity) as Umsatz,
		 row_number() over (order by sum(unitprice*quantity)) as Rang

into #t3
FROM 
	employees e 
		inner join orders o			  on e.employeeid = o.employeeid
		inner join [order details] od on od.orderid   = o.orderid
GROUP BY
	e.employeeid,e.Lastname, e.country, e.City

select * from #t3


insert into SalesEmp
select top 1  * from #t1 order by umsatz asc

insert into SalesEmp
select top 1  * from #t1 order by umsatz desc

select * from salesEmp


---oder so...




select rank() over (order by Umsatz) as Rang ,
* into #t2 from #t1

select row_number() over (order by Umsatz) , * 
from #t1


insert into 
select * from #t3
where 
	Rang = 1 
	or 
	Rang = (select max(rang) from #t2)







select top 1 e.employeeid,e.Lastname, e.country, e.City,
		sum(unitprice*quantity) as Umsatz
FROM 
	employees e 
		inner join orders o			  on e.employeeid = o.employeeid
		inner join [order details] od on od.orderid   = o.orderid
GROUP BY
	e.employeeid,e.Lastname, e.country, e.City
ORDER BY Umsatz asc

select top 1 e.employeeid,e.Lastname, e.country, e.City,
		sum(unitprice*quantity) as Umsatz
FROM 
	employees e 
		inner join orders o			  on e.employeeid = o.employeeid
		inner join [order details] od on od.orderid   = o.orderid
GROUP BY
	e.employeeid,e.Lastname, e.country, e.City
ORDER BY Umsatz asc



/*
3. Erstelle eine temporäre Tabelle
	, welche den Umsatz der Produkte pro Kategorie enthält
	, zudem sollte die Tabelle auch den Weltweiten Umsatz enthalten

CatName ProdName Umsatz 
Categories  Products  order details

select top 3 * from products
select top 3 * from categories */

select cat.CategoryName, p.ProductName, 
	   sum(od.unitprice*quantity) as Umsatz
into #CatProdUmsatz
from 
			   Categories cat 
	inner join Products p		  on p.CategoryID = cat.CategoryID
	inner join [Order Details] od on od.ProductID = p.ProductID
group by 
	cat.CategoryName, p.ProductName 
	
with rollup
order by Umsatz desc

select * from #CatProdUmsatz
/*

4. Senke den Wert des Umsatzes der Kategorie 5 um 10% 
    und lass dir die Differenz ausgeben in der Kat 5
*/
select sum(umsatz) as Umsatz into #Cat5Umsatz 
from #CatProdUmsatz
where CategoryName=(select CategoryName from Categories 
						where CategoryID=5)

update #CatProdUmsatz SET uMSATZ = Umsatz * 0.9
--select *
from #CatProdUmsatz
where CategoryName=(select CategoryName from Categories 
						where CategoryID=5)

select (select umsatz from  #cat5umsatz) - sum(umsatz)
from #CatProdUmsatz
where CategoryName=(select CategoryName from Categories 
						where CategoryID=5)




select UMSATZ from #CatProdUmsatz
where CategoryName=(select CategoryName from Categories 
						where CategoryID=5)
						and productname is null





/*


5. Lösche alle Datensätze aus der tempor Tabelle
	, welche von Kunden aus Deutschland gekauft wurden

*/
select * from #CatProdUmsatz

--Productnummer--> Order details --Orders--customers


select * from vKundeUmsatz
select count(*) from #CatProdUmsatz --86



delete #CatProdUmsatz
--select cat.*, v.country 
from  
	#catProdumsatz cat inner join vkundeumsatz v 
	on v.Productname=cat.ProductName
where 
	v.country = 'Germany' --328



select distinct cat.* from  
	#catProdumsatz cat inner join vkundeumsatz v 
	on v.Productname=cat.ProductName
where 
	v.country = 'Germany' --73