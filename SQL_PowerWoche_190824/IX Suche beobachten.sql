SELECT index_id, index_depth AS 'Depth'
    , index_level AS 'Index Level'
    , record_count AS 'Record Count'
    , page_count AS 'Page Count'
    , avg_page_space_used_in_percent AS 'Page Space Used'
    , min_record_size_in_bytes AS 'Min Record Size'
    , max_record_size_in_bytes AS 'Max Record Size'
    , avg_record_size_in_bytes AS 'Avg Record Size'
FROM sys.dm_db_index_physical_stats --dbcc showcontig
    (DB_ID ('nwind')
    , OBJECT_ID ('nwind.dbo.Customers')
    , NULL
    , NULL 
    , 'DETAILED');
go


drop table sp_DBCCINDIZES;
GO


CREATE TABLE sp_DBCCINDIZES
(
    PageFID         tinyint,
    PagePID         int,
    IAMFID          tinyint,
    IAMPID          int,
    ObjectID        int,
    IndexID         tinyint,
    PartitionNumber tinyint,
    PartitionID     bigint,
    iam_chain_type  varchar(30),
    PageType        tinyint,
    IndexLevel      tinyint,
    NextPageFID     tinyint,
    NextPagePID     int,
    PrevPageFID     tinyint,
    PrevPagePID     int
);
go

insert into sp_DBCCINDIZES
exec ('DBCC IND (Nwind, customers, 1)') --1 = IndexID
go

select * from sp_dbccindizes
where indexlevel=0
order by IndexLevel desc, PrevPagePID

select * from sp_dbccindizes
where indexlevel=1
order by IndexLevel desc, PrevPagePID

select * from sp_dbccindizes
where indexlevel=2
order by IndexLevel desc, PrevPagePID  --40259

SET STATISTICS IO on
--ottaf
select  * from customers where customerid like '%otaaf'
select  * from customers where customerid like 'otaaf'


DBCC PAGE (Nwind, 1, 40259, 3)

DBCC PAGE (NwindBig, 1, 40058, 3)

DBCC PAGE (Nwind, 1, 77238, 3)


DBCC TRACEON (3604)


DBCC PAGE (NwindBig, 1, 548432, 3)


