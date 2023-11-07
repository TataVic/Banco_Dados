-- Exercicio - Transa��o e Erros 
--1 � Fa�a duas transa��es n�o aninhadas para atualiza��o de custo em 10%
--na tabela projeto e inser��o de um registro na tabela de fornecedores.

BEGIN TRANSACTION -- Atualiza��o do custo do projeto 10%
UPDATE Projeto
SET PCusto = PCusto * 1.1
WHERE PNro = 1
COMMIT TRANSACTION

BEGIN TRANSACTION -- Inser��o de um registro na tabela de fornecedores
INSERT INTO Fornecedor (FNro, FNome, FCidade, FCateg)
VALUES (100, 'Fornecedor Novo', 'Cidade Nova', 'A')
COMMIT TRANSACTION

--2 � Reescreva as opera��es do exerc�cio anterior com duas transa��es aninhadas.

BEGIN TRANSACTION
	BEGIN TRANSACTION -- Atualiza��o do custo do projeto 10%
	UPDATE Projeto
	SET PCusto = PCusto * 1.1
	WHERE PNro = 1
	COMMIT TRANSACTION

	BEGIN TRANSACTION -- Inser��o de um registro na tabela de fornecedores
	INSERT INTO Fornecedor (FNro, FNome, FCidade, FCateg)
	VALUES (100, 'Fornecedor Novo', 'Cidade Nova', 'A')
	COMMIT TRANSACTION
COMMIT TRANSACTION
