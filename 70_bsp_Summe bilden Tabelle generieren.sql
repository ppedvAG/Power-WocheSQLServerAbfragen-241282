
create table T1(
		id int identity not null primary key,
		x decimal(8,2) not null default 0,
		spalten char(100) not null default '#'
		)
go


--select * from t1
--select abs(checksum(NEWID()))*0.01%20000
insert T1(x)
select 	0.01 *ABS(checksum(newid()) %20000) from northwind..kux where id <= 20000



select * from t1

1  85.61
2  85.61+54.83
3  85.61+54.83+108.84

