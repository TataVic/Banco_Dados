--Exemplo de Store Procedure (Procedimento Armazenado)
CREATE PROCEDURE sp_ex_4
AS
BEGIN
	DECLARE @n AS INT
	DECLARE @soma AS INT
	SET @n = 50
	SET @soma = 0
	WHILE (@n <= 100)
	BEGIN
		IF (@n % 2 ) = 0
		BEGIN
			PRINT CAST(@n AS VARCHAR) + '+' +  CAST(@soma AS VARCHAR)
			SET @soma = @soma + @n
			PRINT '=' + CAST(@soma AS VARCHAR)
		END
		--PRINT @soma
		SET @n = @n + 1
	END
END
--chamada:
sp_ex_4

---EXEMPLOS:
--Exemplo 1 
Create Procedure Nome_Projetos as 
	Select PNome, PCusto from Projeto 

--Exemplo 2 
create procedure sp_fornecedores_busca1 as begin 
	select * from fornecedor 
end 
--chamada: sp_fornecedores_busca1 

--Exemplo 3 
create procedure sp_pecas_buscar as begin 
	select * from peca 
end 
--chamada: sp_pecas_buscar 

--Exemplo 4 
create procedure sp_fornecedores_busca2 (@NumForn int) as begin 
	select * from fornecedor where FNro = @NumForn 
end 
--chamada: sp_fornecedores_busca2 3 

--Exemplo 5 
create procedure sp_pecas_buscar2 (@p�_num int) as begin 
	select * from peca where PeNro = @p�_num 
end 

--chamada: sp_pecas_buscar2 3 

--Exemplo 6 
create procedure sp_fornecedores_like(@FornNome as varchar(20)) as begin 
	select * from fornecedor where Fnome like @FornNome + '%' 
end 

--chamada: sp_fornecedores_like s 

--Exemplo 7 
create procedure sp_pecas_like(@p�_nome as varchar(15)) as begin 
	select * from peca where PeNome like @p�_nome + '%' 
end 

--chamada: sp_pecas_like L 

--Exemplo 8 
create procedure sp_fornec_inserir( @forn_num as int, @forn_nome as varchar(20), @Forn_Cid as varchar(20),@forn_categ as varchar(1)) 
as begin 
	insert into fornecedor(FNro,Fnome,FCidade, FCateg)  
	values (@forn_num, @forn_nome, @Forn_Cid, @forn_categ) 
end --erro
--chamada: sp_fornec_inserir 11, 'Abracadabra','Barretos', 'C' 

 --Exemplo 9 
create procedure sp_fornecedor_alterar(@forn_num as int, @forn_nome as varchar(20)) 
as begin 
	update fornecedor set FNome = @forn_nome  
	where FNro = @forn_num 
end 

--chamada: sp_fornecedor_alterar 11, �PlactZum� 

--Exemplo 10 
create procedure sp_fornecedor_excluir( @forn_num as int) as begin 
	delete from fornecedor where FNro = @forn_num 
end 

--chamada:sp_fornecedor_excluir 11 
--select * from fornecedor 

--Exemplo 11 
create procedure sp_peca_inserir(@p�_num int, @p�_nome as varchar(15), @p�_pre�o as float, @p�_cor as varchar(15)) 
as begin 
	insert into peca values (@p�_num,@p�_nome,@p�_pre�o,@p�_cor) 
end 


--Exemplo 12 
create procedure sp_peca_alterar(@p�_num as int,  @p�_nome as varchar(20), @p�_preco float) 
as begin 
	update peca  
	set	PeNome = @p�_nome,  
	PePreco = @p�_preco
	where PeNro = @p�_num 
end 