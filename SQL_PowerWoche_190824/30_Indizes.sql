--SCAN SEEK

--SCAN alles von A bis Z
--Table SCAN  NON CL IX SCAN  CL IX SCAN

--SEEK
--gezielte Suchen wie im Telefonbuch (Maier)

--INDIZES

/*
CL IX 
pro Tabelle nur einmal
Sehr gut bei Bereichsabfragen
auch sehr gut bei = Abfragen
PK soll Beziehungen eingehen muss die Spalte eindeutig haben
PK wird per default als CL IX eindeutig gesetzt

NON CL IX
wenn rel wenig rauskommt
Was ist rel wenig?
 < 1%  Tipping point  --> 23435

 auf jeden Fall Lookup 
man kann  ca 1000 pro Tabelle



--------------
eindeutiger IX

abdeckender IX = ideale IX kein SCAN kein LOOKUP

realer hypoth IX --kommen von einem Tool: DTA versteckt, deinen Abfragen nehmen den nicht her


zusammengesetzter IX  WHERE
alle Sp des zus IX sind überall in jeder Eben des Baums zu finden
Limit: max 16 bzw 32 Spalten möglich 
--mascht keinen Sinn alle Spalten reinzunehmen. Max 4 meist ausreichend


IX mit eingschl Spalten  WHERE SELECT 
IX Schlüsselspalten = Where
Spalten enthalten = SELECT Spalten

gefilterter IX
es müssen nicht alle DS im IX enthalten sein.. Filtere so, dass es weniger Ebenen werden
--ansonsten umsonst


partitionierter IX
----------------
COLUMNSTORE IX 





*/

select * from customers

insert into customers (customerid, CompanyName)
values					('ppedv', 'Fa ppedv AG')


select * into KUX from vKundeumsatz

insert into kux
select * from kux

alter table kux add id int identity ---forward record counts



set statistics io, time on
select * from kux where id = 10 --53148 300ms CPU  74ms Dauer


select id from kux where id = 17 --Table SCAN 

--zuerst GR IX festlegen: orderdate

--NON CL IX auf ID
select id from kux where id = 17
--Dauer : 0ms
--Seiten : 3
--Plan: IX SEEK

select id, companyname from kux where id < 17
--Dauer : 0ms ..
--Seiten : 3+1
--Plan: IX SEEK + Lookup (50%)

--nach NIX_ID_CN  ix seek auch bei 900000 Datensätze




select country, city , sum(unitprice*quantity)
from kux
where freight < 1 and Employeeid = 2
group by Country, city having sum(unitprice*quantity) > 100
--with rollup
order by country, city

--abdeckender IX

select customerid, country, companyname
from kux
where country = 'UK' and RngSumme < 500

--NIX_alle vs NIX_FIlter  : 2035
-->lohnt nur dann wenn weniger Ebene



select customerid, country, companyname
from kux
where country = 'UK' or RngSumme < 500

--deiale IX.. SQL schlägt nichts mehr vor
--in dem Fall 2 Indizes




select customerid, country, companyname
from kux
where  country = 'UK' or (RngSumme < 500 and employeeid = 2)



dbcc showcontig('KUX') --: 34449-- TAB SCAN: 53000

select * from sys.dm_db_index_physical_stats
	(db_id(), object_id('kux'), NULL,NULL, 'detailed')

	--forward_record_count = 18699

select 3 * 18699

select * from kux where customerid like '%ALFKI'

CL IX löschen und neu anlegen




























