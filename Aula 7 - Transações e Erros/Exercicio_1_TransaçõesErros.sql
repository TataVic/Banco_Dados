-- Exercicio - Transação e Erros 
--1 – Faça duas transações não aninhadas para atualização de custo em 10%
--na tabela projeto e inserção de um registro na tabela de fornecedores.

BEGIN TRANSACTION -- Atualização do custo do projeto 10%
UPDATE Projeto
SET PCusto = PCusto * 1.1
--WHERE PNro = 1 --atualizar uma linha
COMMIT TRANSACTION

BEGIN TRANSACTION -- Inserção de um registro na tabela de fornecedores
INSERT INTO Fornecedor (FNro, FNome, FCidade, FCateg)
VALUES (100, 'Fornecedor Novo', 'Cidade Nova', 'A')
COMMIT TRANSACTION

--2 – Reescreva as operações do exercício anterior com duas transações aninhadas.


	BEGIN TRANSACTION T1-- Atualização do custo do projeto 10%
		UPDATE Projeto
		SET PCusto = PCusto * 1.1
		--WHERE PNro = 1

		BEGIN TRANSACTION T2 -- Inserção de um registro na tabela de fornecedores
			INSERT INTO Fornecedor (FNro, FNome, FCidade, FCateg)
			VALUES(100, 'Fornecedor Novo', 'Cidade Nova', 'A')
			COMMIT TRANSACTION T2
		COMMIT TRANSACTION T1
