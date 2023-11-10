--Comando 1 -- Comando: Leitura Suja
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO 
BEGIN TRANSACTION
SELECT val FROM tbl
COMMIT TRANSACTION 

---------
--Comando 2 - Comando: Leitura não repetível
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO
BEGIN TRAN repeatRead

select * from tbl
waitfor delay '00:00:05'
select * from tbl
commit tran repeatRead

--------------------
--Comando 3 
Begin tran shortUpdate
update tbl
set val = -1
commit tran shortUpdate
------------
--Comando 4
--readetable (continuacao)