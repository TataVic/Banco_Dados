-- Seriazable 
--sem conflitos de atualizações 
--Exemplo:
	Set transaction isolation level serializable 
	go 
	begin tran pessimistictran
	select * from tbl
	waitfor delay '00:00:05'
	Update tblset val = 3
	where id = 1
	select * from tbl
	commit  tran pessimistictran