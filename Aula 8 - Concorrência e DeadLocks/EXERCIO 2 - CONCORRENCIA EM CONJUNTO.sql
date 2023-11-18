-- exercico 1: Comando 2 para ilustrar a ação desse nível de isolamento com um comando Delete. 
BEGIN TRAN shortDelete
DELETE FROM profissoes  
where id_tab2 = 5;
COMMIT TRAN shortDelete;

--exercicio 2 --A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias são ‘A’ e sejam da cidade de Catanduva. 
BEGIN TRAN selectforn 
Select * From Fornecedor where FCateg = 'A' and
FCidade = 'Catanduva'
COMMIT TRAN selectforn

--exercico 3 --A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias são ‘A’ e sejam da cidade de Catanduva. 
BEGIN TRAN selectfornece
Select * From Fornecedor where FCateg = 'A' and
FCidade = 'Catanduva'
COMMIT TRAN selectforn

--exercicio 4 A segunda deve conter um SELECT lendo todos os dados da tabela Fornecedores, cujas categorias são ‘A’ e sejam da cidade de Catanduva. 
BEGIN TRAN selectfornecedor
Select * From Fornecedor where FCateg = 'A' and
FCidade = 'Catanduva'
COMMIT TRAN selectforn

--------------------
--exercicio 3 --Crie uma outra transação, sem isolamento, para inserir um registro na tabela.
BEGIN TRAN transacionessnapshot
INSERT INTO Fornecedor values (11, 'Titos e companhia', 'Tapinas', 'D')
COMMIT TRAN transacionessnapshot

Select * From Fornecedor
--exercicio 4 --Crie uma outra transação, sem isolamento, para deletar um registro na tabela.
BEGIN TRAN transacionesrepeate
DELETE FROM Fornecedor where FNro = 10
COMMIT TRAN transacionesrepeate