SELECT * FROM Fornecedor
SELECT * FROM Peca
SELECT * FROM Fornece_Para
SELECT * FROM Projeto
-- Exercicios - Aula 03/08
--exercicio 1 
/*Com os projetos de dura��o entre 3 e 5 meses inclusive, 
e que possuem um pre�o menor que $ 30.000. 
Mostre os nomes, a dura��o e o custo, todos com apelidos*/
CREATE VIEW Projeto_Preco_Ex1 AS
SELECT p.PNome Nome_Projeto ,p.PDuracao Dura��o_Projeto ,p.PCusto Custo_Projeto
FROM Projeto p
WHERE p.PDuracao BETWEEN '3' AND '5' 
		 and p.PCusto < 30000
 
 
--exercicio2
/*Com os projetos que tenham custo inferior a R$ 30.000,00 
e apenas 1 pe�a fornecida. Mostrar nome e custo do projeto. */
CREATE VIEW Projeto_Peca_Ex2 AS 
SELECT p.PNome Nome_Projeto,p.PCusto Custo_Projeto
FROM Projeto p 
	INNER JOIN Fornece_Para fp ON fp.PNro = p.PNro
WHERE p.PCusto < 30000  
		AND fp.Quant = 1

--exercicio3
/*Criar uma vis�o com os nomes e os c�digos das pe�as que s�o fornecidas. */
CREATE VIEW Pecas_Fornecidas_Ex3 AS 
SELECT DISTINCT pe.PeNome Nome_Pe�a, pe.PeNro Codigo_Pe�a
FROM Fornece_Para fp
	INNER JOIN Pecas pe ON pe.PeNro = fp.PeNro

--exercicio4
/*Criar uma vis�o com o nome de fornecedor relacionado com as pe�as fornecidas*/
CREATE VIEW Fornecedores_Pecas_Ex4 AS
SELECT f.FNome Nome_Fornecedor, p.PeNome Nome_Pecas  
FROM Fornece_Para fp
	INNER JOIN Fornecedores f ON fp.FNro = f.FNro
	INNER JOIN Pecas p ON fp.PeNro = p.PeNro

--exercicio5
/*criar uma vis�o nome de projetos e as pe�as + filtrar pela cor vermelha*/
CREATE VIEW Projeto_Pecas_Ex5 AS 
SELECT p.PNome Nome_Projeto, pe.PeNome Nome_Pecas
FROM Fornece_Para fp
	INNER JOIN Projeto p ON p.PNro = fp.PNro
	INNER JOIN Peca pe ON pe.PeNro = fp.PeNro
WHERE pe.PeCor = 'Vermelho'

SELECT * FROM Projeto_Preco_Ex1
SELECT * FROM Projeto_Peca_Ex2
SELECT * FROM Pecas_Fornecidas_Ex3
SELECT * FROM Fornecedores_Pecas_Ex4
SELECT * FROM Projeto_Pecas_Ex5