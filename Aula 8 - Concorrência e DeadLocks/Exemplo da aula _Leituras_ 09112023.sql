--Comando 1 -- Comando: Leitura Suja
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO 
BEGIN TRANSACTION
SELECT val FROM tbl
COMMIT TRANSACTION 

---------
--Comando 2 - Comando: Leitura n�o repet�vel
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
--Comando 4 - executar juntas
SET TRANSACTION ISOLATION LEVEL READ Repeatable
GO
BEGIN TRAN repeatRead

select * from tbl
waitfor delay '00:00:05'
select * from tbl
commit tran repeatRead
-------------------
Begin tran shortUpdate
update tbl
set val = 1
commit tran shortUpdate


-------------------
--repeatible read : leitura fantasma com insert e que faz um select ap�s
Begin tran shortInsert
insert into tbl value (2)
commit tran shortInsert
---
SET TRANSACTION ISOLATION LEVEL READ Repeatable
GO
BEGIN TRAN repeatRead

select * from tbl
waitfor delay '00:00:05'
select * from tbl
commit tran repeatRead


