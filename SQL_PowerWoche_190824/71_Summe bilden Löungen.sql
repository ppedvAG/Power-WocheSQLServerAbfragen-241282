--Lösung 1 


select t1.id, sum(t2.x) as rt from t1 inner join t1 as t2 on t2.id <= t1.id
group by t1.id


--Lösung 2


--Temp Tabelle #t
create table #t(id int not null primary key, s decimal (16,2) not null)

--Variablen mit Spalten der T1 und Spalte @s für Summen
declare @id int, @x decimal(8,2), @s decimal (16,2)
set @s= 0

--Cursor deklarieren
declare #c cursor fast_forward for
	select id, x from t1 order by id
	
--Cursor öffnen
open #c
	-- solange durchlaufen und füllen  bis Ende
	while (1=1)
		begin
		fetch next from #c into @id, @x
		if (@@FETCH_STATUS != 0) break 
		set @s=@s+@x
		
		if @@TRANCOUNT = 0		
			begin tran
			insert #t values (@id,@s)
		
		if (@id %1000) = 0
			commit
	end	
if @@trancount >0
	commit
	close #c
	deallocate #c
	
select * from #t order by id

drop table #t


A 100
A 100
A 200

--Lösung 3


select id, x, sum(x) over (order by id) from t1
--Row_number(), dense_rank rank ntile

--Window Functions



select shipcountry, freight, rank() over (partition by shipcountry order by freight) from Orders




