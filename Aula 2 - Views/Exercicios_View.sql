SELECT * FROM Fornecedor
SELECT * FROM Peca
SELECT * FROM Fornece_Para
SELECT * FROM Projeto
-- Exercicios - Aula 03/08
--exercicio 1 
/*Com os projetos de duração entre 3 e 5 meses inclusive, 
e que possuem um preço menor que $ 30.000. 
Mostre os nomes, a duração e o custo, todos com apelidos*/
CREATE VIEW Projeto_Preco_Ex1 AS
SELECT p.PNome Nome_Projeto ,p.PDuracao Duração_Projeto ,p.PCusto Custo_Projeto
FROM Projeto p
WHERE p.PDuracao BETWEEN '3' AND '5' 
		 and p.PCusto < 30000
 
 
--exercicio2
/*Com os projetos que tenham custo inferior a R$ 30.000,00 
e apenas 1 peça fornecida. Mostrar nome e custo do projeto. */
CREATE VIEW Projeto_Peca_Ex2 AS 
SELECT p.PNome Nome_Projeto,p.PCusto Custo_Projeto
FROM Projeto p 
	INNER JOIN Fornece_Para fp ON fp.PNro = p.PNro
WHERE p.PCusto < 30000  
		AND fp.Quant = 1

--exercicio3
/*Criar uma visão com os nomes e os códigos das peças que são fornecidas. */
CREATE VIEW Pecas_Fornecidas_Ex3 AS 
SELECT DISTINCT pe.PeNome Nome_Peça, pe.PeNro Codigo_Peça
FROM Fornece_Para fp
	INNER JOIN Pecas pe ON pe.PeNro = fp.PeNro

--exercicio4
/*Criar uma visão com o nome de fornecedor relacionado com as peças fornecidas*/
CREATE VIEW Fornecedores_Pecas_Ex4 AS
SELECT f.FNome Nome_Fornecedor, p.PeNome Nome_Pecas  
FROM Fornece_Para fp
	INNER JOIN Fornecedores f ON fp.FNro = f.FNro
	INNER JOIN Pecas p ON fp.PeNro = p.PeNro

--exercicio5
/*criar uma visão nome de projetos e as peças + filtrar pela cor vermelha*/
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