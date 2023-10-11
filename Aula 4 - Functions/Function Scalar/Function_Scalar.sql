--Exercicios de fun��o 05/09

--1 - Crie uma vari�vel do tipo Table com os campos n�mero, nome e dura��o dos projetos. 
--Armazene na vari�vel Table todos os projetos com custo superior a R$ 20 000,00. 
--Em seguida mostre aqueles com dura��o maior ou igual a 2 meses. 
declare @table table (numero int primary key, nome varchar(30), duracao int)
insert into @table 
	select p.PNro numero, p.PNome nome, p.PDuracao
	from Projeto p 
	where PCusto > 20000
	select * from @table where duracao >= 2 
	

--2 - Crie uma fun��o para calcular o "delta" de uma equa��o do 2� grau (as entradas s�o A, B e C). delta = b� - 4 ac 
CREATE FUNCTION CalcularDelta(@A FLOAT, @B FLOAT, @C FLOAT) --banco master
RETURNS FLOAT
AS
BEGIN
    DECLARE @Delta FLOAT
    SET @Delta = POWER(@B, 2) - (4 * @A * @C)
    RETURN @Delta
END;
SELECT dbo.CalcularDelta(2, 2,2) AS Delta


--3 - Crie uma stored procedure para calcular a(s) ra�z(es), se houver(em). 
--delta < 0 (A = 5, B = 1, C = 5) -> n�o existem ra�zes reais. 
-- delta = 0 (A = 2, B = 4, C = 2) -> x = -b / (2 * a) = -1 
-- delta > 0 (A = 2, B = 5, C = 2) -> x1 = -0,5 e x2 = -2 
--Use a fun��o criada no exerc�cio 2 nesse procedimento. Um exemplo de chamada: 
--declare @retorno decimal 
--set @retorno = dbo.Delta (@A, @B, @C) 
--Exemplo de execu��o do procedimento: 
--CalcDelta 5, 1, 5 
--CalcDelta 2, 4, 2 
--CalcDelta 2, 5, 2 
ALTER PROCEDURE Delta --banco master
    @A FLOAT,
    @B FLOAT,
    @C FLOAT
AS
BEGIN
    DECLARE @Delta FLOAT
    DECLARE @alg1 FLOAT
    DECLARE @alg2 FLOAT

    -- Calcular o delta usando a fun��o previamente criada
    SET @Delta = dbo.CalcularDelta(@A, @B, @C)

    -- Verificar o valor do delta
    IF @Delta < 0
    BEGIN
        PRINT 'N�o existem ra�zes reais para a equa��o.'
    END
    ELSE IF @Delta = 0
    BEGIN
        SET @alg1 = -@B / (2 * @A)
        PRINT 'A �nica raiz real �: ' + CAST(@alg1 AS VARCHAR(50))
    END
    ELSE
    BEGIN
        SET @alg1 = (-@B + SQRT(@Delta)) / (2 * @A)
        SET @alg2 = (-@B - SQRT(@Delta)) / (2 * @A)
        PRINT 'As ra�zes reais s�o: ' + CAST(@alg1 AS VARCHAR(50)) + ' e ' + CAST(@alg2 AS VARCHAR(50))
    END
END;

EXEC Delta 2,5,2


--4 - Crie uma fun��o scalar que retorne o pre�o de uma pe�a reajustado de acordo com uma porcentagem e um pre�o passados para a fun��o. 
--Na chamada � fun��o voc� deve usar o Select/From/Where para buscar o pre�o de uma pe�a qualquer na tabela Pe�a. 
Alter function dbo.precopeca (@preco INT, @porcentagem FLOAT)
RETURNS FLOAT
AS BEGIN
		DECLARE @NovoPreco FLOAT
		SET @NovoPreco = @preco * (1 + @Porcentagem / 100)
		RETURN @NovoPreco
END;
SELECT *, dbo.precopeca(PePreco, 50) from  Pecas where PeNro = 1
select * from Pecas
		