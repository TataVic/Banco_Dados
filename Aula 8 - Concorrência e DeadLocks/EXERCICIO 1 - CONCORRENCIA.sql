-- EXERCICIO 1 - CONCORRENCIA 
--1 – Com base no último exemplo do nível de isolamento Repeatable Read, mantenha o Comando 1 idêntico 
--e crie um exemplo para o Comando 2 para ilustrar a ação desse nível de isolamento com um comando Delete. 
USE Banco_Dados;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ --leitura fantasma
GO 
BEGIN TRAN repeatRead 
	SELECT * FROM profissoes
		WAITFOR DELAY '00:00:15' 
	SELECT * FROM profissoes
COMMIT TRAN repeatRead

--rollback
select * from profissoes

--2 – Faça duas transações separadas. A primeira com o nível de isolamento Serializable 
--e que faça uma leitura (SELECT) nos dados da tabela Fornecedores, dê uma parada de 5 segundos, 
--atualize o campo FNome para ‘Plact-Zum’ dos Fornecedores de Categoria ‘A’ ou ‘B’ 
--e faça outra leitura nos dados da tabela Fornecedores.
--A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias são ‘A’ e sejam da cidade de Catanduva. 
USE Fabrica;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE  BEGIN TRAN transacao2
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05' 
UPDATE Fornecedor
SET FNome = 'Plact-zum'
WHERE FCateg IN ('A','B')
Select * From Fornecedor 
COMMIT TRAN transacao2

--insert into Fornecedor values (9, 'Tadeus e Cia', 'Catanduva', 'A')
--insert into Fornecedor values (10, 'Fernandes e Cia', 'Catanduva', 'B')
Select * From Fornecedor 

--3 – Faça duas transações separadas. 
--A primeira com o nível de isolamento Serializable e que faça uma leitura (SELECT) 
--nos dados da tabela Fornecedores, dê uma parada de 5 segundos, atualize o campo FNome para ‘BongoPac’ 
--dos Fornecedores de Categoria ‘A’ ou ‘B’ e faça outra leitura nos dados da tabela Fornecedores. 
--A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias são ‘A’ e sejam da cidade de Catanduva. 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE  BEGIN TRAN transacao3
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05' 
UPDATE Fornecedor
SET FNome = 'BongoPac'
WHERE FCateg IN ('A','B')
Select * From Fornecedor 
COMMIT TRAN transacao3

--4 - Faça duas transações separadas.
--A primeira com o nível de isolamento Snapshot que faça uma leitura (SELECT) nos dados da tabela Fornecedores,
--dê uma parada de 5 segundos, atualize o campo FNome para ‘BongoPac’ dos Fornecedores de Categoria ‘A’ ou ‘B’ 
--e faça outra leitura nos dados da tabela Fornecedores.
--A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias são ‘A’ e sejam da cidade de Catanduva. 
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
GO
BEGIN TRAN transacao4
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05' 
UPDATE Fornecedor
SET FNome = 'BongoPac'
WHERE FCateg IN ('A','B')
Select * From Fornecedor 
COMMIT TRAN transacao4

-----------------------------------------------------------------

--3 - Faça uma transação com o nível de isolamento Snapshot, com 2 leituras e o Delay entre elas. 
--Crie uma outra transação, sem isolamento, para inserir um registro na tabela.
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
GO
BEGIN TRAN transaciones3
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05'
SELECT * FROM Fornecedor
COMMIT TRAN transaciones3

-- ALTER DATABASE Fabrica SET ALLOW_SNAPSHOT_ISOLATION ON 
SELECT * FROM Fornecedor

--4 - Faça uma transação com o nível de isolamento Repeateble Read, com 2 leituras e o Delay entre elas. 
--Crie uma outra transação, sem isolamento, para excluir um registro na tabela.
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
GO
BEGIN TRAN transaciones4
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05'
SELECT * FROM Fornecedor
COMMIT TRAN transaciones4
 
 

 