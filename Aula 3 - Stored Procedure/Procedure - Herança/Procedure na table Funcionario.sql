--Procedure na table Funcionario
----------------------------------------------------------------------
--Procedure de inserção
create procedure sp_funcionario_inserir(
	@pes_nome varchar(40),
	@fun_ch int, 
	@fun_salario money) 
as
begin
	insert into pessoas values(@Pes_nome)
	insert into funcionarios values(@@identity, @fun_ch, @fun_salario)
	if (Select count(*) from funcionarios where Pes_Codigo = @@identity) = 0
		delete pessoas where pes_codigo = @@identity
end

--sp_funcionario_inserir 'Patricia', 40, 44000
--select * from pessoas
--select * from funcionarios

--------------------------------------------------------------------------
--Procedure de  exclusão
create procedure sp_funcionario_excluir(
	@pes_codigo int) 
as
begin
	delete from funcionarios where pes_codigo = @pes_codigo
	delete from pessoas		 where pes_codigo = @pes_codigo
end

--------------------------------------------------------------------------
--Procedure de busca
create procedure sp_funcionarios_buscar
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, f.Fun_ch CH, f.Fun_salario Salario
	from pessoas p, funcionarios f
	where p.pes_codigo = f.pes_codigo
end
--sp_funcionarios_buscar
--select * from funcionarios

--------------------------------------------------------------------------
--Procedure de busca por código
create procedure sp_funcionario_buscar (
	@pes_codigo int )
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, f.Fun_ch CH, f.Fun_salario Salario
	from pessoas p, funcionarios f
	where p.pes_codigo = @pes_codigo and 
		  p.pes_codigo = f.pes_codigo and
		  p.Pes_codigo = @Pes_codigo
end
--sp_funcionario_buscar 1

--------------------------------------------------------------------------
--Procedure de busca por like
create procedure sp_funcionarios_like (
	@pes_nome varchar(5))
as
begin
	select p.Pes_codigo Codigo, p.Pes_nome Nome, f.Fun_ch CH, f.Fun_salario Salario
	from pessoas p, funcionarios f
	where p.pes_codigo = f.pes_codigo and
		  p.pes_nome like @pes_nome + '%'
end
--sp_funcionarios_like p

--------------------------------------------------------------------------