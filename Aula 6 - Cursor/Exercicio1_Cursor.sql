--Cursores

--1 – Faça uma Stored Procedure com um cursor que receba todos os projetos que têm custo superior a R$ 25.000,00 
--e selecione todos os nomes e categorias de fornecedores que fornecem para estes projetos.
Alter PROCEDURE exercicio1 AS BEGIN
 DECLARE @PNro INT, @FCateg VARCHAR(1), @FNome VARCHAR(30);
   DECLARE cursor1 CURSOR FOR
	SELECT P.PNro 
	FROM Projeto P
	WHERE P.PCusto > 25000;
   OPEN cursor1;
FETCH NEXT FROM cursor1 INTO @PNro;
WHILE @@FETCH_STATUS = 0 BEGIN
 DECLARE cursor1_2 CURSOR FOR
	SELECT F.FCateg, F.FNome
	FROM Fornecedor F
	INNER JOIN Fornece_Para FP ON F.FNro = FP.FNro
	WHERE FP.PNro = @PNro;
OPEN cursor1_2;
FETCH NEXT FROM cursor1_2 INTO @FCateg, @FNome;
WHILE @@FETCH_STATUS = 0 BEGIN
PRINT @FCateg;
Print @FNome;
FETCH NEXT FROM cursor1_2 INTO @FCateg, @FNome;
END
	 CLOSE cursor1_2;
	 DEALLOCATE cursor1_2;
FETCH NEXT FROM cursor1 INTO @PNro;
END
CLOSE cursor1;
DEALLOCATE cursor1;
END;

exercicio1

--2 – Crie um Trigger que é disparado quando se atualiza uma categoria qualquer de Fornecedor, 
--com um cursor que armazene os fornecedores que não são das categorias ‘A’, ‘B’ e ‘C’, 
--e atualize suas categorias para ‘C’.
ALTER TRIGGER EXEC_CURSOR_2 ON Fornecedor AFTER UPDATE AS BEGIN
	DECLARE @FNro INT;
    DECLARE cursor_trigger CURSOR FOR
        SELECT FNro
        FROM Fornecedor
        WHERE FCateg NOT IN ('A', 'B', 'C');
    OPEN cursor_trigger;
    FETCH NEXT FROM cursor_trigger INTO @FNro;
	WHILE @@FETCH_STATUS = 0
      BEGIN
            UPDATE Fornecedor
            SET FCateg = 'C'
            WHERE FNro = @FNro;
	FETCH NEXT FROM cursor_trigger INTO @FNro;
    END;
		CLOSE cursor_trigger;
        DEALLOCATE cursor_trigger;
		END;

SELECT * FROM Fornecedor
UPDATE Fornecedor SET FCateg = 'E' where FNro = 3
 
--3 – Faça uma Stored Procedure que armazene em um cursor todos os códigos de projetos que têm fornecedores 
--que são da categoria A ou B. Atualize todos os custos desses projetos de tais fornecedores em 10%.
-- Crie uma Stored Procedure que atualiza os custos de projetos com fornecedores das categorias A ou B em 10%.

CREATE PROCEDURE AtualizarCustosProjetos()
AS BEGIN
DECLARE @ProjetoCursor CURSOR;
DECLARE @ProjetoCodigo INT;
DECLARE @NovoCusto DECIMAL(10, 2);
    SET @ProjetoCursor = CURSOR FOR
		SELECT P.PNro, P.PCusto
		FROM Projeto P
			INNER JOIN Fornece_Para FP ON F.FNro = FP.FNro
			INNER JOIN Fornecedor F ON FP.FNro = F.FNro
		WHERE F.FCateg IN ('A', 'B');
    OPEN @ProjetoCursor;
    FETCH NEXT FROM @ProjetoCursor INTO @ProjetoCodigo, @NovoCusto;
WHILE @@FETCH_STATUS = 0
   BEGIN
      SET @NovoCusto = @NovoCusto * 1.1; -- Aumenta o custo em 10%.
      UPDATE Projeto
      SET PCusto = @NovoCusto
       WHERE PNro = @ProjetoCodigo;
	FETCH NEXT FROM @ProjetoCursor INTO @ProjetoCodigo, @NovoCusto;
    END;
		CLOSE @ProjetoCursor;
		DEALLOCATE @ProjetoCursor;
		END;

--4 – Faça uma Stored Procedure com um cursor que receba o código do fornecedor, 
--selecionando todos os projetos nos quais este fornecedor possui fornecimento 
--e aumente em 15% o custo de tais projetos.
-- Crie uma Stored Procedure que aumenta em 15% o custo de projetos de um fornecedor especificado.

CREATE PROCEDURE AumentarCustoProjetosPorFornecedor (@FornecedorCodigo INT)
AS BEGIN
    DECLARE @ProjetoCursor CURSOR;
	DECLARE @ProjetoCodigo INT;
    DECLARE @Custo DECIMAL(10, 2);

    SET @ProjetoCursor = CURSOR FOR
    SELECT P.ProjetoCodigo, P.Custo
    FROM Projeto P
    INNER JOIN Fornece_Para FP ON P.FNro = FP.FNro
    WHERE FP.FNro = @FornecedorCodigo;

    -- Abra o cursor.
    OPEN @ProjetoCursor;

    -- Inicie a leitura do cursor.
    FETCH NEXT FROM @ProjetoCursor INTO @ProjetoCodigo, @Custo;

    -- Atualize os custos dos projetos em 15%.
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Custo = @Custo * 1.15; -- Aumenta o custo em 15%.
        UPDATE Projeto
        SET Custo = @Custo
        WHERE ProjetoCodigo = @ProjetoCodigo;

        -- Continue lendo o cursor.
        FETCH NEXT FROM @ProjetoCursor INTO @ProjetoCodigo, @Custo;
    END;

    -- Feche e desaloque o cursor.
    CLOSE @ProjetoCursor;
    DEALLOCATE @ProjetoCursor;
END;
