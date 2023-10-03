-- Comando insert (DML): inclui dados nas tabelas

Select * from peca
Use Fabrica
insert into Projeto (Pnro, PNome, PDuracao,PCusto) 
	values (1, 'Detroit', '5', 43000)
insert into Projeto values (2, 'Pegasus', '3', 37000)
insert into Projeto values (3, 'Alfa', '2', 26700)
insert into Projeto values (4, 'Sea', '3', 21200)
insert into Projeto values (5, 'Paraíso', '1', 17000)

Use Fabrica
insert into Fornecedor values(1, 'Plastec', 'Campinas', 'B')
insert into Fornecedor values(2, 'C&M', 'São Paulo', 'D')
insert into Fornecedor values(3, 'Kirurgic', 'Campinas','A')
insert into Fornecedor values(4, 'Pilotos', 'Piracicaba', 'A')
insert into Fornecedor values(5, 'Equipament', 'São Carlos', 'C')

Use Fabrica
insert into Peca values(1, 'Cinto', 22, 'Azul')
insert into Peca values(2, 'Volante', 18, 'Vermelho')
insert into Peca values(3, 'Lanterna', 14, 'Preto')
insert into Peca values(4, 'Limpador', 09, 'Amarelo')
insert into Peca values(5, 'Painel', 43, 'Vermelho')
insert into Peca values(6, 'Parabrisa', 56,null)

Use Fabrica
insert into Fornece_Para values(1,5,4,5)
insert into Fornece_Para values(2,2,2,1)
insert into Fornece_Para values(3,3,4,2)
insert into Fornece_Para values(4,4,5,3)
insert into Fornece_Para values(5,1,1,1)
insert into Fornece_Para values(2,2,3,1)
insert into Fornece_Para values(4,3,5,2)

--UPDATE	Peca2
--SET	PePreco = 55, PeCor = 'Roxo'
--WHERE	PeNro > 3

---- Atualiza todos os preços da tabela Peça2 em 10%
--UPDATE	Peca2
--SET	PePreco = PePreco + PePreco * 0.1

---- Remove a peça PE6
--DELETE FROM Peca2
----Complete você

--Select * from peca2

----Exclua da tabela Fornecedores2 o fornecedor de número 4
