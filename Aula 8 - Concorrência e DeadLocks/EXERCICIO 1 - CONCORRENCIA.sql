-- EXERCICIO 1 - CONCORRENCIA 
--1 � Com base no �ltimo exemplo do n�vel de isolamento Repeatable Read, mantenha o Comando 1 id�ntico 
--e crie um exemplo para o Comando 2 para ilustrar a a��o desse n�vel de isolamento com um comando Delete. 
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

--2 � Fa�a duas transa��es separadas. A primeira com o n�vel de isolamento Serializable 
--e que fa�a uma leitura (SELECT) nos dados da tabela Fornecedores, d� uma parada de 5 segundos, 
--atualize o campo FNome para �Plact-Zum� dos Fornecedores de Categoria �A� ou �B� 
--e fa�a outra leitura nos dados da tabela Fornecedores.
--A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias s�o �A� e sejam da cidade de Catanduva. 
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

--3 � Fa�a duas transa��es separadas. 
--A primeira com o n�vel de isolamento Serializable e que fa�a uma leitura (SELECT) 
--nos dados da tabela Fornecedores, d� uma parada de 5 segundos, atualize o campo FNome para �BongoPac� 
--dos Fornecedores de Categoria �A� ou �B� e fa�a outra leitura nos dados da tabela Fornecedores. 
--A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias s�o �A� e sejam da cidade de Catanduva. 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE  BEGIN TRAN transacao3
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05' 
UPDATE Fornecedor
SET FNome = 'BongoPac'
WHERE FCateg IN ('A','B')
Select * From Fornecedor 
COMMIT TRAN transacao3

--4 - Fa�a duas transa��es separadas.
--A primeira com o n�vel de isolamento Snapshot que fa�a uma leitura (SELECT) nos dados da tabela Fornecedores,
--d� uma parada de 5 segundos, atualize o campo FNome para �BongoPac� dos Fornecedores de Categoria �A� ou �B� 
--e fa�a outra leitura nos dados da tabela Fornecedores.
--A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias s�o �A� e sejam da cidade de Catanduva. 
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

--3 - Fa�a uma transa��o com o n�vel de isolamento Snapshot, com 2 leituras e o Delay entre elas. 
--Crie uma outra transa��o, sem isolamento, para inserir um registro na tabela.
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
GO
BEGIN TRAN transaciones3
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05'
SELECT * FROM Fornecedor
COMMIT TRAN transaciones3

-- ALTER DATABASE Fabrica SET ALLOW_SNAPSHOT_ISOLATION ON 
SELECT * FROM Fornecedor

--4 - Fa�a uma transa��o com o n�vel de isolamento Repeateble Read, com 2 leituras e o Delay entre elas. 
--Crie uma outra transa��o, sem isolamento, para excluir um registro na tabela.
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
GO
BEGIN TRAN transaciones4
SELECT * FROM Fornecedor
WAITFOR DELAY '00:00:05'
SELECT * FROM Fornecedor
COMMIT TRAN transaciones4
 
 

 