---IO reduzieren

--je weniger IO desto weniger RAM Verbrauch
--dann auich weniger CPU Last


/*

CL NON CL IX  statt 53000 nur noch 3

Partitionierung

Kompression

Columnstore

------------------
DB Design : statt char(1000) ein varchar(1000)
datetime --> date

Designregeln

Normalisierung NF 1 NF2 NF 3 BC NF4 NF5
Redundanz
Generalisierung



Suppen
Getränke
Fleisch
Fisch

TABELLE


REZ SZ PF MA CO SAR
WS         x  x  x
FZ            x
AI            x





*/



create table test
	(id int identity,
	 salz int null sparse,--braucht keinen Platz 


Ist aber nicht NULL drin kostet es mehr


varchar, char... 60% NULLs oder mehr 
decimal 42%
bit 98%


email      emaildom

andreasr | ppedv.de



select * from kunden where email '%ppedv.de'--SCAN

select * from kunden where emaildom 'ppedv.de'--SEEK

Redundanz-- Trigger


insert into testx 
select 200,300

delete from testx where id = 2

update testx set spx = 400




BestDatum	Jahr	Monat   Quartal
2.4.2024	 2024      4      2

1.7.  1






select * from orders



