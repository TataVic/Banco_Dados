-- ATIVIDADE 12/09

--ATIV 01
ALTER FUNCTION dbo.numprojeto01 (@proj int)
returns table
AS
RETURN (
    SELECT pe.PeNome, pe.PePreco 
    FROM Pecas pe, Fornece_Para fp
	where fp.PNro  = @proj
	and pe.PeNro = fp.PeNro
	--and pj.PNro = fp.PNro
	and pe.PePreco < 20 )

		select * from dbo.numprojeto01(2)
		select * from Projeto

-- ATIV 02 
--dROP FUNCTION dbo.projetopeca
ALTER FUNCTION dbo.projetopeca (@cod_peca int, @cod_projet int)
returns table
AS
RETURN (
    SELECT pj.PNome nome_projeto, pe.PeNome as nome_peca, FP.Quant qtd_fornecida
    FROM Pecas pe, Projeto pj, Fornece_Para fp
	where pj.PNro  = @cod_projet
	and pe.PeNro = @cod_peca
	and pe.PeNro = fp.PeNro
	and pj.PNro = fp.PNro )
	select * from Fornece_Para
	select * from dbo.projetopeca(2,2)

--Ativ 03
--drop function dbo.fornecedorpecasprojeto
ALTER FUNCTION dbo.fornecedorpecasprojeto (@cod_forn int)
returns table
AS
RETURN (
    SELECT pe.PeNome as nome_peca
    FROM  Pecas pe, Projeto pj, Fornece_Para fp
	where fp.FNro  = @cod_forn
	and pe.PePreco > 20 
	and pj.PDuracao <=4
	and fp.PeNro = pe.PeNro
	and fp.PNro = pj.PNro
	-- fp.FNro = f.FNro --
	)
	--select * from Projeto
	select * from dbo.fornecedorpecasprojeto(5)
