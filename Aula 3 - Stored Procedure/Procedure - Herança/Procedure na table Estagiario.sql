--Proccedure na tabela estagiário
-------------------------------------------------------------------
--Procedure de inserção
create procedure sp_estagiario_inserir(
	@pes_nome varchar(40),
	@ies_codigo int) 
as
begin
    declare @data datetime
    set @data = (select getDate())
	insert into pessoas values(@Pes_nome)
	insert into estagiarios values(@@identity, @data, @ies_codigo)
	if (Select count(*) from estagiarios where pes_codigo = @@identity) = 0
		delete pessoas where pes_codigo = @@identity
end

--sp_estagiario_inserir Sergio, 1
--select * from pessoas
--select * from estagiarios

--------------------------------------------------------------------------
--Procedure de exclusão
create procedure sp_estagiario_excluir(
	@pes_codigo int) 
as
begin
	delete from estagiarios where pes_codigo = @pes_codigo
	delete from pessoas 	where pes_codigo = @pes_codigo
end

--------------------------------------------------------------------------
--Procedure de busca
create procedure sp_estagiarios_buscar
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, e.Est_data Data_Cadastro, e.Ies_codigo, i.ies_nome Ies
	from pessoas p, estagiarios e, ies i
	where p.pes_codigo = e.pes_codigo and
          e.ies_codigo = i.ies_codigo
end
--sp_estagiarios_buscar
--select * from estagiarios

--------------------------------------------------------------------------
--Procedure de busca por código
create procedure sp_estagiario_buscar (
	@pes_codigo int )
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, e.Est_data Data_Cadastro, e.Ies_codigo, i.ies_nome Ies
	from pessoas p, estagiarios e, ies i
	where p.pes_codigo = @pes_codigo and
		  p.pes_codigo = e.pes_codigo and
          e.ies_codigo = i.ies_codigo          
end
--sp_estagiario_buscar 2

--------------------------------------------------------------------------
--Procedure de busca por like
create procedure sp_estagiarios_like (
    @pes_nome varchar(5))
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, e.Est_data Data_Cadastro, e.Ies_codigo, i.ies_nome Ies
	from pessoas p, estagiarios e, ies i
	where p.pes_codigo = e.pes_codigo and
          e.ies_codigo = i.ies_codigo and
		  p.pes_nome like @pes_nome + '%'
end
sp_estagiarios_like s

