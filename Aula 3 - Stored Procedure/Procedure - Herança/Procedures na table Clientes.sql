--Procedure para a tabela Cliente 
-----------------------------------------------------------------
--Procedure de inserção de clientes
create procedure sp_cliente_inserir (
	@pes_nome	varchar(50)	,
	@cli_cpf	varchar(12)	,
	@cli_email	varchar(30))
as
begin
	insert into Pessoas values (@pes_nome)
	insert into Clientes values (@@identity, @cli_cpf, @cli_email)
	if (Select count(*) from clientes where Pes_Codigo = @@identity) = 0
		delete pessoas where pes_codigo = @@identity
end

--sp_cliente_inserir 'Ricardo', '101', 'drrsbbdl@yahoo.com.br'
--select * from pessoas
--select * from clientes

--------------------------------------------------------------------------
--Procedure de exclusão de clientes
create procedure sp_cliente_excluir(
	@pes_codigo int) 
as
begin
	delete from clientes where pes_codigo = @pes_codigo
	delete from pessoas	 where pes_codigo = @pes_codigo
end
--------------------------------------------------------------------------
-- Procedure de busca simples de clientes
create procedure sp_clientes_buscar
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, c.Cli_cpf CPF, c.Cli_email Email
	from pessoas p, clientes c
	where p.pes_codigo = c.pes_codigo
end
--sp_clientes_buscar

--------------------------------------------------------------------------
-- Procedure de busca por parâmetros de clientes
create procedure sp_cliente_buscar (
	@pes_codigo int )
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, c.Cli_cpf CPF, c.Cli_email Email
	from pessoas p, clientes c
	where p.pes_codigo = c.pes_codigo and
	p.Pes_codigo = @Pes_codigo
end
--sp_cliente_buscar 1

--------------------------------------------------------------------------
-- Procedure de busca por like de clientes
create procedure sp_clientes_like (
   @pes_nome varchar(5))
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, c.Cli_cpf CPF, c.Cli_email Email
	from pessoas p, clientes c
	where p.pes_codigo = c.pes_codigo and
          p.pes_nome like @pes_nome + '%'
end
--sp_clientes_like r

--------------------------------------------------------------------------