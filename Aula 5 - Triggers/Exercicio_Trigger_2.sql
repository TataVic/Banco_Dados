--exercicio trigger 2 - 03/10
--1 - Fa�a um trigger com vari�veis para, ao inv�s de inserir uma pe�a com os valores que o usu�rio informou,
--n�o deixe o pre�o da pe�a ser inferior a 5. 
create trigger insercao on peca for insert 
	as begin
	declare @PeNro int
	declare @PeNome varchar
	declare @PePreco decimal
	declare @Pecor varchar
	set @PeNro = (select PeNro from inserted)
	set @PeNome = (select PeNome from inserted)
	set @PePreco = (select PePreco from inserted)
	set @Pecor = (select PeCor from inserted)
		if(@PePreco < 5)
		begin 
		insert into peca values (@PeNro, @PeNome,5,@PeCor)
		print 'pe�a inferior ao valor 5'
		end
		else
		insert into peca values (@PeNro, @PeNome,@PePreco,@PeCor)
		print 'pe�a inserida com os par�metros passados'
end

insert into Peca values (9, 'teste', 4, 'vermelho')
select * from peca


--2 � Crie um Trigger que ao inv�s de excluir os fornecedores que n�o 
--s�o das categorias �A�, �B� e �C�, atualize suas categorias para �C�. 
create trigger atualizacao on fornecedor instead of delete
as begin
	Update Fornecedor set FCateg = 'C' 
	Where Fornecedor.FNro in (select FNro from deleted)
		and FCateg in ('A', 'B', 'C')
 end
 delete Fornecedor where FNro = 4
select * from fornecedor


--3 - Ao se inserir um projeto, verificar se o custo est� acima do permitido (50000). 
--Se for, incluir com o limite de 50.000. Se n�o, incluir com o valor passado. 
create trigger insercao_projeto on projeto for insert as
	Update Projeto set PCusto = 'C' 
	Where Fornecedor.FNro in (select FNro from deleted)
		and FCateg in ('A', 'B', 'C')
 end
 delete Fornecedor where FNro = 4
select * from fornecedor

--4 - Criar uma tabela de Historico de Projetos. 
create Table Historico_Projetos(
	PjNro int primary key not null, 
	PjNome varchar(255) not null, 
	PjDuracaoNova int not null, 
	PjDuracaoAntiga int not null, 
	PjCusto float not null
)
select * from Historico_Projetos
select * from Projeto

--5 - Criar um trigger para atualizar a tabela Hist�rico de Projetos
--que � disparado quando houver a modifica��o SOMENTE no atributo PDura��o no Projeto. 
Create Trigger atual_Hist_Projeto on Historico_Projetos after update as
	 IF UPDATE(PjDuracao)
    BEGIN
        INSERT INTO Historico_Projetos (PjNro, PjNome, PjDuracaoNova, PjDuracaoAntiga, PjCusto)
		values(
        SELECT 
            inserted.PjNro,
            inserted.PjNome,
            inserted.PjDuracao,
            deleted.PjDuracao,
            inserted.PjCusto
        FROM inserted
		)
	end


--6 - Criar 2 tabelas: Projeto_atualizado e Projeto_antigo 

--7 - Criar um trigger que armazena em uma tabela os dados atualizados do Projeto(Projeto_atualizado)
--e em outra tabela os dados do Projeto antes de atualizar (Projeto_antigo) 