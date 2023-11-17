-- Snapshot (Níveis de isolamento) 
set transaction isolation level snapshot 
go
begin tran repeatread
select * from tbl
waitfor delay '00:00:10'
select * from tbl
commit tran snapshot


begin --shortupdate

--alter database TransacoesErros
--set ALLOW_SNAPSHOT_ISOLATION ON 