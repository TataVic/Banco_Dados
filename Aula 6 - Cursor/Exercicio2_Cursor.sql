--Cursores Exercicio 2

--5 - Crie um cursor para a tabela “Fornecedor”. 
--Armazene nesse cursor o nome do fornecedor, bem como a categoria do mesmo.
--Para os fornecedores das Categorias “A” e “B”, 
--mostre os nomes do fornecedor juntamente com o texto “Excelentes Fornecedores”. 
--Caso contrário, imprima os nomes do fornecedor juntamente com o texto “Fornecedores Meia Boca”. 
-- Crie um cursor para a tabela "Fornecedor".
DECLARE @FornecedorCursor CURSOR;

-- Declare variáveis para armazenar o nome e a categoria do fornecedor.
DECLARE @FornecedorNome NVARCHAR(100);
DECLARE @FornecedorCategoria CHAR(1);

-- Inicialize o cursor.
SET @FornecedorCursor = CURSOR FOR
SELECT FNome, FCateg
FROM Fornecedor;

-- Abra o cursor.
OPEN @FornecedorCursor;

-- Inicie a leitura do cursor.
FETCH NEXT FROM @FornecedorCursor INTO @FornecedorNome, @FornecedorCategoria;

-- Loop para processar os fornecedores.
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Verifique a categoria do fornecedor e exiba a mensagem apropriada.
    IF @FornecedorCategoria IN ('A', 'B')
    BEGIN
        PRINT @FornecedorNome + ' - Excelentes Fornecedores';
    END
    ELSE
    BEGIN
        PRINT @FornecedorNome + ' - Fornecedores Meia Boca';
    END;

    -- Continue lendo o cursor.
    FETCH NEXT FROM @FornecedorCursor INTO @FornecedorNome, @FornecedorCategoria;
END;

-- Feche e desaloque o cursor.
CLOSE @FornecedorCursor;
DEALLOCATE @FornecedorCursor;


--6 - Utilizando cursores, realize uma consulta que retorne todos os nomes de  Projetos 
--e seus respectivos custos e durações e mostre somente esses dados. 
-- Crie um cursor para consultar os nomes, custos e durações de todos os projetos.

-- Declare o cursor para armazenar os dados do projeto.
DECLARE @ProjetoCursor CURSOR;

-- Declare variáveis para armazenar os dados do projeto.
DECLARE @ProjetoNome NVARCHAR(100);
DECLARE @ProjetoCusto DECIMAL(10, 2);
DECLARE @ProjetoDuracao INT;

-- Inicialize o cursor.
SET @ProjetoCursor = CURSOR FOR
SELECT Nome, Custo, Duracao
FROM Projeto;

-- Abra o cursor.
OPEN @ProjetoCursor;

-- Inicie a leitura do cursor.
FETCH NEXT FROM @ProjetoCursor INTO @ProjetoNome, @ProjetoCusto, @ProjetoDuracao;

-- Loop para mostrar os dados do projeto.
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Mostrar os dados do projeto.
    PRINT 'Nome do Projeto: ' + @ProjetoNome;
    PRINT 'Custo do Projeto: ' + CAST(@ProjetoCusto AS NVARCHAR(100));
    PRINT 'Duração do Projeto: ' + CAST(@ProjetoDuracao AS NVARCHAR(100));
    PRINT ''; -- Uma linha em branco para separar os resultados.

    -- Continue lendo o cursor.
    FETCH NEXT FROM @ProjetoCursor INTO @ProjetoNome, @ProjetoCusto, @ProjetoDuracao;
END;

-- Feche e desaloque o cursor.
CLOSE @ProjetoCursor;
DEALLOCATE @ProjetoCursor;

--7 - Realize uma consulta que retorne em um cursor o número de todas as peças
--que são fornecidas para um fornecedor, sendo que o fornecedor 
--é selecionado através da passagem de um parâmetro, 
--juntamente com uma porcentagem para reajuste das peças selecionadas, 
--que serão reajustadas uma a uma com tal porcentagem. 
-- Crie uma Stored Procedure que retorna o número de peças fornecidas por um fornecedor e as reajusta com uma porcentagem.

CREATE PROCEDURE ReajustarPrecosPecasPorFornecedor
    @FornecedorCodigo INT,
    @PorcentagemReajuste DECIMAL(10, 2)
AS
BEGIN
    -- Declare um cursor para selecionar as peças fornecidas pelo fornecedor especificado.
    DECLARE @PecaCursor CURSOR;

    -- Declare variáveis para armazenar o número da peça e o preço.
    DECLARE @PecaNumero INT;
    DECLARE @Preco DECIMAL(10, 2);

    -- Inicialize o cursor.
    SET @PecaCursor = CURSOR FOR
    SELECT PP.PecaNumero, PP.Preco
    FROM Peca_Para PP
    WHERE PP.FNro = @FornecedorCodigo;

    -- Abra o cursor.
    OPEN @PecaCursor;

    -- Inicie a leitura do cursor.
    FETCH NEXT FROM @PecaCursor INTO @PecaNumero, @Preco;

    -- Loop para reajustar os preços das peças.
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Reajuste o preço da peça com a porcentagem fornecida.
        SET @Preco = @Preco * (1 + @PorcentagemReajuste / 100);

        -- Atualize o preço da peça na tabela.
        UPDATE Peca_Para
        SET Preco = @Preco
        WHERE PecaNumero = @PecaNumero;

        -- Continue lendo o cursor.
        FETCH NEXT FROM @PecaCursor INTO @PecaNumero, @Preco;
    END;

    -- Feche e desaloque o cursor.
    CLOSE @PecaCursor;
    DEALLOCATE @PecaCursor;
END;
