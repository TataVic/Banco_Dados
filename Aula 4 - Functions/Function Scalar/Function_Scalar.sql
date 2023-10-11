--Exercicios de função 05/09

--1 - Crie uma variável do tipo Table com os campos número, nome e duração dos projetos. 
--Armazene na variável Table todos os projetos com custo superior a R$ 20 000,00. 
--Em seguida mostre aqueles com duração maior ou igual a 2 meses. 
declare @table table (numero int primary key, nome varchar(30), duracao int)
insert into @table 
	select p.PNro numero, p.PNome nome, p.PDuracao
	from Projeto p 
	where PCusto > 20000
	select * from @table where duracao >= 2 
	

--2 - Crie uma função para calcular o "delta" de uma equação do 2º grau (as entradas são A, B e C). delta = b² - 4 ac 
CREATE FUNCTION CalcularDelta(@A FLOAT, @B FLOAT, @C FLOAT) --banco master
RETURNS FLOAT
AS
BEGIN
    DECLARE @Delta FLOAT
    SET @Delta = POWER(@B, 2) - (4 * @A * @C)
    RETURN @Delta
END;
SELECT dbo.CalcularDelta(2, 2,2) AS Delta


--3 - Crie uma stored procedure para calcular a(s) raíz(es), se houver(em). 
--delta < 0 (A = 5, B = 1, C = 5) -> não existem raízes reais. 
-- delta = 0 (A = 2, B = 4, C = 2) -> x = -b / (2 * a) = -1 
-- delta > 0 (A = 2, B = 5, C = 2) -> x1 = -0,5 e x2 = -2 
--Use a função criada no exercício 2 nesse procedimento. Um exemplo de chamada: 
--declare @retorno decimal 
--set @retorno = dbo.Delta (@A, @B, @C) 
--Exemplo de execução do procedimento: 
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

    -- Calcular o delta usando a função previamente criada
    SET @Delta = dbo.CalcularDelta(@A, @B, @C)

    -- Verificar o valor do delta
    IF @Delta < 0
    BEGIN
        PRINT 'Não existem raízes reais para a equação.'
    END
    ELSE IF @Delta = 0
    BEGIN
        SET @alg1 = -@B / (2 * @A)
        PRINT 'A única raiz real é: ' + CAST(@alg1 AS VARCHAR(50))
    END
    ELSE
    BEGIN
        SET @alg1 = (-@B + SQRT(@Delta)) / (2 * @A)
        SET @alg2 = (-@B - SQRT(@Delta)) / (2 * @A)
        PRINT 'As raízes reais são: ' + CAST(@alg1 AS VARCHAR(50)) + ' e ' + CAST(@alg2 AS VARCHAR(50))
    END
END;

EXEC Delta 2,5,2


--4 - Crie uma função scalar que retorne o preço de uma peça reajustado de acordo com uma porcentagem e um preço passados para a função. 
--Na chamada à função você deve usar o Select/From/Where para buscar o preço de uma peça qualquer na tabela Peça. 
Alter function dbo.precopeca (@preco INT, @porcentagem FLOAT)
RETURNS FLOAT
AS BEGIN
		DECLARE @NovoPreco FLOAT
		SET @NovoPreco = @preco * (1 + @Porcentagem / 100)
		RETURN @NovoPreco
END;
SELECT *, dbo.precopeca(PePreco, 50) from  Pecas where PeNro = 1
select * from Pecas
		