--Konstruktionen

--IF

IF Bedingung Anweisung

IF 1=1 select 'A'

IF 1=0 select 'B'

if (select count(*) from customers) > 50 select 'mehr als Hundert'

IF 1=0
	select 'A'
ELSE 
	select 'B'


--wenn der Schnitt der Frachtkosten über 60 liegt , dann Ausgabe des Schnitts
--sollte er darunter sein: dann Frachtkosten um 10 erhöhen

--Tabelle o


select avg(freight) from o

IF (select avg(freight) from o) > 60
	select avg(freight) from o
ELSE
	update o set freight = freight * 1.1


IF 1=1
	select 'A'
	
ELSE 
	select 'B'

select 'C'

--BLOCK = BEGIN END

IF 1=0
	BEGIN 
			select 'A'
			select 'B'
	END
ELSE
	BEGIN
			Select 'C'
			select 'D'
	END
select 'X'



WHILE BEDINGUNG	
	BEGIN

	END



declare @i as int =1
select @i

while @i < 10 --select avg(freight...)
	begin
		select getdate()
		set @i+=1 --set @i = @i+1--aber nie: set @i =+1
		select @i
	end


while (select avg(freight) from o1) < 80
	begin 

	end


declare @i as int =1


while @i < 10 --select avg(freight...)
	begin
		select getdate()
		set @i+=1 --set @i = @i+1--aber nie: set @i =+1
		select @i
		IF @i = 5 BREAK --Schleifentod
		--CONTINUE
	end

	declare @i as int =1


while @i < 10 --select avg(freight...)
	begin
	--	select getdate()
		set @i+=1 --set @i = @i+1--aber nie: set @i =+1
		select @i
		--IF @i = 5 BREAK --Schleifentod
		IF @i = 5 CONTINUE --springt gleich zum Schleifeneinstieg zurück
		select 'A'
	end


--Wir wollen die Freight solange um 10% Erhöhen bis die max(freight) 1500 erreichte
--aber nicht übersteigt 
--oder die Summe der frachtkosten max 100000 erreicht abernicht übersteigt

select max(freight), sum(freight) from o



begin tran
schleife 
Kontrolle
rollback

while Bedingung or | and Bedingung
	begin

	end




-------------------------------

begin tran

select max(freight) from o 
select sum(freight) from o


while (select max(freight) from o ) <= 1500 /1.1
		AND
	 (select sum(freight) from o)  <= 120000 /1.1
BEGIN
	--	select 'A'	
		update o set freight = freight*1.1

END


WHILE( Bedingung )
BEGIN


IF( Bedingung )
BEGIN

select max(freight) from o 
select sum(freight) from o  

END


END


rollback




CAse 
	when
	when
	else




select country, city,	
		Case 
			when country in ('Germany', 'Italy', 'Austria') then 'EU'
			when country = 'UK' then 'die waren mal drin'
			else 'Was anderes'
		end EUorNOTEU
from customers



	--Freight < 100 dann A
	-- > 500 dann  C
	-- sonst B

select orderid, freight,
	case 
		when freight < 100 then 'A'
		when freight > 500 then 'C'
		else 'B'
	end as Typ
from orders



update o set freight =	case 
							when employeeid = 1 then freight *1.1
							when employeeid = 2 then freight *1.05
							else 100
						end

						select * from o


delete from o
	where freight < 1 or employeeid = 5

