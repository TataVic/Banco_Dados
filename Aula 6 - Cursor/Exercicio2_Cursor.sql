--Cursores Exercicio 2

--5 - Crie um cursor para a tabela �Fornecedor�. 
--Armazene nesse cursor o nome do fornecedor, bem como a categoria do mesmo.
--Para os fornecedores das Categorias �A� e �B�, 
--mostre os nomes do fornecedor juntamente com o texto �Excelentes Fornecedores�. 
--Caso contr�rio, imprima os nomes do fornecedor juntamente com o texto �Fornecedores Meia Boca�. 

DECLARE @FornecedorCursor CURSOR;
DECLARE @FornecedorNome VARCHAR(100);
DECLARE @FornecedorCategoria CHAR(1);
SET @FornecedorCursor = CURSOR FOR
	SELECT FNome, FCateg
	FROM Fornecedor;
OPEN @FornecedorCursor;
FETCH NEXT FROM @FornecedorCursor INTO @FornecedorNome, @FornecedorCategoria;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @FornecedorCategoria IN ('A', 'B')
    BEGIN
        PRINT @FornecedorNome + ' - Excelentes Fornecedores';
    END
    ELSE
    BEGIN
        PRINT @FornecedorNome + ' - Fornecedores Meia Boca';
    END;
    FETCH NEXT FROM @FornecedorCursor INTO @FornecedorNome, @FornecedorCategoria;
END;
CLOSE @FornecedorCursor;
DEALLOCATE @FornecedorCursor;

--6 - Utilizando cursores, realize uma consulta que retorne todos os nomes de  Projetos 
--e seus respectivos custos e dura��es e mostre somente esses dados. 
-- Crie um cursor para consultar os nomes, custos e dura��es de todos os projetos.

DECLARE @ProjetoCursor CURSOR;
DECLARE @ProjetoNome NVARCHAR(100);
DECLARE @ProjetoCusto DECIMAL(10, 2);
DECLARE @ProjetoDuracao INT;
SET @ProjetoCursor = CURSOR FOR
--select * from Projeto
	SELECT PNome Nome, PCusto, PDuracao
	FROM Projeto;
OPEN @ProjetoCursor;
FETCH NEXT FROM @ProjetoCursor INTO @ProjetoNome, @ProjetoCusto, @ProjetoDuracao;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Nome do Projeto: ' + @ProjetoNome;
    PRINT 'Custo do Projeto: ' + CAST(@ProjetoCusto AS NVARCHAR(100));
    PRINT 'Dura��o do Projeto: ' + CAST(@ProjetoDuracao AS NVARCHAR(100));
    PRINT ''; 
    FETCH NEXT FROM @ProjetoCursor INTO @ProjetoNome, @ProjetoCusto, @ProjetoDuracao;
END;
CLOSE @ProjetoCursor;
DEALLOCATE @ProjetoCursor;

--7 - Realize uma consulta que retorne em um cursor o n�mero de todas as pe�as
--que s�o fornecidas para um fornecedor, sendo que o fornecedor 
--� selecionado atrav�s da passagem de um par�metro, 
--juntamente com uma porcentagem para reajuste das pe�as selecionadas, 
--que ser�o reajustadas uma a uma com tal porcentagem. 
-- Crie uma Stored Procedure que retorna o n�mero de pe�as fornecidas por um fornecedor e as reajusta com uma porcentagem.
CREATE PROCEDURE ReajustarPrecosPecasPorFornecedor
    @FornecedorCodigo INT,
    @PorcentagemReajuste DECIMAL(10, 2)
AS
BEGIN
    DECLARE @PecaCursor CURSOR;
    DECLARE @PecaNumero INT;
    DECLARE @Preco DECIMAL(10, 2);
    SET @PecaCursor = CURSOR FOR
		SELECT pe.PeNro, pe.PePreco
		FROM Peca pe 
    OPEN @PecaCursor;
    FETCH NEXT FROM @PecaCursor INTO @PecaNumero, @Preco;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Preco = @Preco * (1 + @PorcentagemReajuste / 100);
        UPDATE Peca_Para
        SET Preco = @Preco
        WHERE NPro = @PecaNumero;
        FETCH NEXT FROM @PecaCursor INTO @PecaNumero, @Preco;
    END;
    CLOSE @PecaCursor;
    DEALLOCATE @PecaCursor;
END;
