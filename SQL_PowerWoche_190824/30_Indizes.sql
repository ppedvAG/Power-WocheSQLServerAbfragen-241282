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
abdeckender IX
realer hypoth IX --kommen von einem Tool: DTA versteckt, deinen Abfragen nehmen den nicht her
zusammengesetzter IX
IX mit einegschl Spalten
gefilterter IX
partitionierter IX
----------------
COLUMNSTORE IX 





*/

select * from customers

insert into customers (customerid, CompanyName)
values					('ppedv', 'Fa ppedv AG')