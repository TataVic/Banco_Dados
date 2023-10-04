--Ativ 1 - receba o parâmetro o cód do projeto e mostre o numero e duração do mesmo
select * from Projeto
Create Procedure sp_ex1_proj(@cod_proj as int)
	as begin 
	Select PNome Nome, PDuracao Duracao from Projeto
	Where PNro = @cod_proj
	end 
	sp_ex1_proj 4

--Ativ 2 -- receba um texto como parêmetro  - nome do fornecedor e sua categoria
select * from fornecedores
Create Procedure sp_ex2_forn (@texto_nom as varchar(20))
as begin 
	Select *
	from Fornecedores 
	Where FNome Like '%'+@texto_nom+'%' 
	end 
	sp_ex2_forn c


-- Ativ 3 - 
select * from Pecas
Create Procedure sp_ex3_pecas (@num as int, @nome as varchar(20), @preco as float)
as begin 
	Insert Into Pecas (PeNro, PeNome, PePreco) Values (@num, @nome, @preco)
	end

	sp_ex3_pecas 17, 'hhhhhhhhhh', 22.5
	sp_ex3_pecas 16, 'aaaaaaaaaaa', 22.5

--  ativ 4
select * from Pecas
Alter Procedure sp_ex4_peca (@numero as int, @nome as varchar(20), @preco as float) 
as begin
	Update Pecas
	Set PeNome = @nome, PePreco = @preco
	where PeNro = @numero
end
sp_ex4_peca 17, 'bbbbbbbbb', 29.36
sp_ex4_peca 1, 'jjjjjjjjjj', 100
sp_ex4_peca 2, 'pppppppppp', 47;
sp_ex4_peca 3, 'kkkkkkkkkkk', 123;
sp_ex4_peca 4, 'cccccccccc', 76.7;
sp_ex4_peca 5, 'çççççççççç', 475;
sp_ex4_peca 6, 'qqqqqqqqqqq', 100;
--dropar pecas e inserir novamente


--ativ 5 
select * from Pecas
Create Procedure sp_ex5_peca (@numero as int) 
as begin
	Delete Pecas Where PeNro = @numero
	End
	sp_ex5_peca 17