--Cursores

--1 � Fa�a uma Stored Procedure com um cursor que receba todos os projetos que t�m custo superior a R$ 25.000,00 
--e selecione todos os nomes e categorias de fornecedores que fornecem para estes projetos.
CREATE PROCEDURE EXEC_CURSOR_1 (@var as float) as begin 
	declare cursor_procedure cursor for
		select distinct --primary key
		PCusto from Projeto where  PCusto > 25000
	open cursor_procedure
	fetch next from cursor_procedure 
	while @@FETCH_STATUS = 0 
		begin	
			Select f.FNome, f.FCateg from Fornecedor f 
			Inner Join Fornece_Para fp on fp.FNro = f.FNro

--2 � Crie um Trigger que � disparado quando se atualiza uma categoria qualquer de Fornecedor, 
--com um cursor que armazene os fornecedores que n�o s�o das categorias �A�, �B� e �C�, 
--e atualize suas categorias para �C�.

--3 � Fa�a uma Stored Procedure que armazene em um cursor todos os c�digos de projetos que t�m fornecedores 
--que s�o da categoria A ou B. Atualize todos os custos desses projetos de tais fornecedores em 10%.

--4 � Fa�a uma Stored Procedure com um cursor que receba o c�digo do fornecedor, 
--selecionando todos os projetos nos quais este fornecedor possui fornecimento 
--e aumente em 15% o custo de tais projetos.