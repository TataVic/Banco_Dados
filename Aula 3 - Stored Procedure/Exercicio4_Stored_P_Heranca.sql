use heranca
go
----Exercicio IES SP3 31/08
select * from Clientes
select * from Estagiarios
select * from Funcionarios
select * from IES
select * from Pessoas

--Faça uma SP para inserir valores na tabela IES 
--(não esqueça que a chave primária é autoincremental). 
Create Procedure sp3_001 (@ies varchar(40))
as begin
Insert into IES(IES_nome) values (@ies)
end
exec sp3_001 Unirp;

--Faça uma SP para excluir valores da tabela IES. 
Create Procedure sp3_002 (@cod int)
as begin
Delete From IES where IES_codigo = @cod
end
exec sp3_002 15;

--Crie uma SP para atualizar o nome (enviado) de uma IES com base no código passado. 
Create Procedure sp3_003 (@cod int, @nome varchar(40))
as begin
Update IES set IES_nome =@nome where IES_codigo = @cod
end
exec sp3_003 14, UNIRP_RP100;

--Desenvolva uma SP que receba o código de uma pessoa e mostre todas as informações de cliente.
Alter Procedure sp3_004 (@cod int)
as begin
Select C.*, p.Pes_nome  from Clientes C, Pessoas p  
Where p.Pes_codigo = @cod 
	and p.Pes_codigo = C.Pes_codigo
end
alter Procedure sp3_004_1 (@cod int)
as begin
Select C.*, p.Pes_nome  
from Clientes C
 join Pessoas p on p.Pes_codigo = c.Pes_codigo
Where p.Pes_codigo = @cod 
end
exec sp3_004_1 1;
select * from Clientes
select * from Pessoas
exec sp3_004 5;

--Faça uma SP que retorne informações de todos os estagiários: código e nome da pessoa, a data de entrada do estagiário, o código e o nome da IES. 
Alter Procedure sp3_005
as begin
Select p.Pes_codigo Código, p.Pes_nome Nome,  e.Est_data, i.IES_codigo Código_IES, i.IES_nome Nome_IES 
From Estagiarios e, Pessoas p, IES i   
Where p.Pes_codigo = e.Pes_codigo
and i.IES_codigo = e.IES_codigo
end
exec sp3_005;

--Faça uma SP que retorne informações (código e nome da pessoa, a data de entrada do estagiário, o código e o nome da IES) 
--de uma pessoa/estagiário cujo código foi passado para a SP. 
Create Procedure sp3_006 (@cod int)
as begin
Select p.Pes_codigo Código, p.Pes_nome Nome,  e.Est_data, i.IES_codigo Código_IES, i.IES_nome Nome_IES 
From Estagiarios e, Pessoas p, IES i   
Where p.Pes_codigo = e.Pes_codigo
and i.IES_codigo = e.IES_codigo
and e.Pes_codigo = @cod
end
exec sp3_006 1;