


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













 























