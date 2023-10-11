USE heranca

-- Procedure de inserir nome de uma Instituição de Ensino Superior
create procedure sp_ies_inserir(
   @ies_nome as varchar(40))
as
begin
	insert into ies values (@ies_nome)
end
select * from IES
sp_ies_inserir UFSCar
-----------------------------------------------------------------
-- Procedure de exclusão de Instituição de Ensino Superior
create procedure sp_ies_excluir(
   @ies_codigo as int)
as
begin
	delete from ies where ies_codigo = @ies_codigo
end
--sp_ies_excluir 3
--select * from ies

----------------------------------------------------------------- 
-- Procedure de alteração de Instituição de Ensino Superior
create procedure sp_ies_alterar(
   @ies_codigo as int, @ies_nome as varchar(40))
as
begin
	update ies set ies_nome = @ies_nome where ies_codigo = @ies_codigo
end
sp_ies_alterar 11, USP
select * from ies

-----------------------------------------------------------------
-- Procedure de Seleção de Instituição de Ensino Superior
create procedure sp_ies_mostrar
as
begin
	select * from ies
end
--sp_ies_mostrar

-----------------------------------------------------------------
-- Procedure de busca/pesquisa de Instituição de Ensino Superior
create procedure sp_ies_buscar (
    @ies_codigo int)
as
begin
	select * from ies where ies_codigo = @ies_codigo
end
--sp_ies_buscar 2
-----------------------------------------------------------------
-- Procedure de busca/pesquisa por like de Instituição de Ensino Superior
create procedure sp_ies_like(
	@ies_nome as varchar(5))
as
begin
	select * from ies where ies_nome like @ies_nome + '%'
end
--sp_ies_like u
