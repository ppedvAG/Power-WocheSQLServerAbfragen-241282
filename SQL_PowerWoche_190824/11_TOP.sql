/* 



select top (ANZAHL) Spalten from ..

select top ZAHL (PERCENT) Spalten from ..

sortiert nach order by 
Ohne ANgabe von Order by: sortiert , so wie sie auf der HDD rumliegen
--< CL IX

select top ANZAHL with TIES..
nimmt auch Datensätze nach ANzahl in der Resultat mit rein, wenn der letzte Wert und die nachfolgenden Identisch sind
--> order by spalte



*/

select top 3 * from orders

select top 3 * from orders order by freight

select top 13 * from orders order by freight --13


select top 13 with ties * from orders order by freight --14

select top 13 Percent * from orders oorder by freight

