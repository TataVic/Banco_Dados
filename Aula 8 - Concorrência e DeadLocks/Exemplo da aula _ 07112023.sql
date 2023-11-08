create database TransacoesErros
use TransacoesErros

create table tbl(
id int identity(1,1) primary key,
val int not null
)

go 
insert into tbl(val) values(1)

-- leitura suja leu um dado que não foi confirmado ainda, ela acessa mesmo que aquela transação nao tenha sido finalida


--teste pra isso 

begin tran logupdate 
update tbl
set val = -1

waitfor delay '00:00:005' -- indica que vai ser um alonga atualização 

rollback tran longupdate

-- teste em seguida simuntaneamente 


set transaction isolation level read uncommitted 
begin tran
select val from tbl

commit tran