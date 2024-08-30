--MAXDOP


/*ab einem best KOstenschwellenwert (Servereinstellungen)
werden soviele Kerne verwendet, wie im Maxdop angegeben.

--MAXDOP läßt sich angeben
-- in der Abfrage
-- auf der DB
--auf dem Server

--bei konkurrierenden Einstellungen gilt :
Je näher die Einstelleung an Daten gemacht wurde, desto eher gilt diese

--also DB vor Server
--Abfrage vor DB

--Wartezustände: CX....

--Kerne müssen warten bis der letzte Kern sein Arbeit erledigt hat



--MAXDOP 8
--8 oder 1

--ab 2022-8---6---1--2


set 


--SUPENDED
--RUNNABLE
--RUNNING
set statistics time on
select sum(freight) , country from kux
group by country
option (maxdop 6)
--Gatherstream Repartition Stream tauchen beide auf, dan nMAXDOP regulieren