--create database Banco_Dados 
-- use Banco_Dados

--Create table pessoas(
--	id_tab1 int primary key identity(1,1) not null,
--	nome1 varchar(30),
--	valores1 float 
--	)
--Create table profissoes(
--	id_tab2 int primary key identity(1,1) not null, 
--	nome2 varchar(30),
--	valores2 float,
--	foreign key(id_tab2) references pessoas(id_tab1)
--	)

--	Insert into pessoas(nome1, valores1) values
--		('Vanessa Quiro', 13.75),
--		('Vitória Fernandes', 100.2),
--		('Fernando Prestes', 50.3698),
--		('Sonia Aparecida', 789.2365),
--		('Caio Susazo', 1.2),
--		('Amanda Souza', 5036.0),
--		('Beres Candido', 123654.5),
--		('Duda Borges', 89.2356),
--		('Tata Vitoria', 456.2)

--	Insert into profissoes(nome2, valores2) values
--		('médica', 13.75),
--		('engenheiro', 100.2),
--		('cozinheiro', 50.3698),
--		('funcionário escolar', 789.2365),
--		('motorista', 1.2),
--		('caminhoneiro', 5036.0),
--		('tecnico de enfermagem', 123654.5),
--		('tecnico eletrico', 89.2356),
--		('programador', 456.2)

-- REALIZAR DOIS EXEMPLOS DE CONTROLE DE CONCORRÊNCIA - COM DUAS CONSULTAS CADA E PELO MENOS UM EXEMPLO COM JOIN 

--EXEMPLO 1 REPEATETABLE READ 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO 
BEGIN TRAN EXERC1
	SELECT pe.nome1, pf.nome2 FROM pessoas pe
	Inner join profissoes pf on pe.id_tab1 = pf.id_tab2
WAITFOR DELAY '00:00:05' 
	SELECT pe.nome1, pf.nome2 FROM pessoas pe
	Inner join profissoes pf on pe.id_tab1 = pf.id_tab2
COMMIT TRAN EXERC1 
	
	select * from pessoas
	--COMANDO 2:
BEGIN TRAN EXEC1 ---- transação, sem isolamento, para inserir um registro na tabela.
INSERT INTO pessoas values ('Roberta Fernam', 10000.0)
COMMIT TRAN EXEC1

BEGIN TRAN EXEC1 ---- transação, sem isolamento, para deletar um registro na tabela.
DELETE FROM pessoas where id_tab1 = 1
COMMIT TRAN EXEC1

--EXEMPLO 2 SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
GO 
BEGIN TRAN EXERC2
	SELECT pe.nome1, pf.nome2 FROM profissoes pf 
	Inner join pessoas pe on pe.id_tab1 = pf.id_tab2
WAITFOR DELAY '00:00:05' 
	SELECT pe.nome1, pf.nome2 FROM profissoes pf 
	Inner join pessoas pe on pe.id_tab1 = pf.id_tab2
COMMIT TRAN EXERC2 

	select * from profissoes

--COMANDO 2:
BEGIN TRAN EXEC2 ---- transação, sem isolamento, para inserir um registro na tabela.
	INSERT INTO profissoes values ('social media', 900.0)
COMMIT TRAN EXEC1

BEGIN TRAN EXEC2 ---- transação, sem isolamento, para deletar um registro na tabela.
	DELETE FROM profissoes where id_tab2 = 6
COMMIT TRAN EXEC12