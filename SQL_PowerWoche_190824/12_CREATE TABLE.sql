--TABELLEN ANLEGEN

CREATE --ALTER DROP

Create table tblname
	(
	TabId int identity primary key
	,Sp1 int
	,sp2 varchar(50) not null
	,sp3 date null
	)

Alter table tblname add spname int

alter table  tblname drop column spname


create table #KundenEU
	(
	    KdId char(5)
	   ,Firma nvarchar(50)
	   ,Land varchar(50)
	   ,Stadt varchar(50)
	)

ALTER TABLE #KundenEU
add Typ char(1)





--INS

--best Daten in eine neue Tabelle

select Spalten into neuetab from Tabelle


select 100 as Zahl1 , 'TXT' as Textzeug into #txy

select * from #txy

sp_help '#txyz'