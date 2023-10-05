--exercicio trigger 2 - 03/10
--1 - Fa�a um trigger com vari�veis para, ao inv�s de inserir uma pe�a com os valores que o usu�rio informou,
--n�o deixe o pre�o da pe�a ser inferior a 5. 
Create Trigger Exercicio1 on Peca for insert as 
	DECLARE @preco_minimo float;
    SET @preco_minimo = 5.00;
		INSERT INTO Peca(id, nome, preco)
			SELECT id, nome, preco
			FROM inserted
			WHERE preco >= @preco_minimo;

--2 � Crie um Trigger que ao inv�s de excluir os fornecedores que n�o 
--s�o das categorias �A�, �B� e �C�, atualize suas categorias para �C�. 

--3 - Ao se inserir um projeto, verificar se o custo est� acima do permitido (50000). 
--Se for, incluir com o limite de 50.000. Se n�o, incluir com o valor passado. 

--4 - Criar uma tabela de Historico de Projetos. 

--5 - Criar um trigger para atualizar a tabela Hist�rico de Projetos
--que � disparado quando houver a modifica��o SOMENTE no atributo PDura��o no Projeto. 

--6 - Criar 2 tabelas: Projeto_atualizado e Projeto_antigo 

--7 - Criar um trigger que armazena em uma tabela os dados atualizados do Projeto(Projeto_atualizado)
--e em outra tabela os dados do Projeto antes de atualizar (Projeto_antigo) 