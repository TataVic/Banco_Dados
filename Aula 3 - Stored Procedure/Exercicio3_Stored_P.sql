-- listar projeto por peça
create procedure sp_ativ01_2408 (@num_proj int) as begin
	select pj.PNro Num_Projeto ,pj.PNome Nome_Projeto,p.PeNome Nome_Peca, fp.Quant Qtd 
	from Projeto pj, Fornece_Para fp, Pecas p
	where pj.PNro = @num_proj 
		and fp.PeNro = p.PeNro  
		and pj.PNro = fp.PNro	
end
exec sp_ativ01_2408 2

--listar projeto com fornecedor
create procedure sp_ativ02_2408 (@num_proj int) as begin
	select pj.PNome Nome_Projeto, f.FNome Nome_Fornecedor
	from Projeto pj, Fornecedores f, Fornece_Para fp
	where pj.PNro = @num_proj
		and fp.PNro = pj.PNro
		and fp.FNro = f.FNro	
end
exec sp_ativ02_2408 2

alter procedure sp_ativ03_2408 (@qtd_pj int) as begin
	select pj.PNome Nome_Projeto,p.PeNome Nome_Peca, f.FNome Nome_Fornecedor, fp.Quant Qtd 
	from Projeto pj, Fornece_Para fp, Pecas p, Fornecedores f
	where fp.Quant >= @qtd_pj 
		and fp.PNro = pj.PNro
		and fp.PeNro = p.PeNro
		and fp.FNro = f.FNro
end
sp_ativ03_2408  2

-- exc 4 - pecas e projetos 
create procedure sp_ativ04_2408 (@qtd_pj int) as begin
	select pj.PNome Nome_Projeto,p.PeNome Nome_Peca, f.FNome Nome_Fornecedor, fp.Quant Qtd 
	from Projeto pj, Fornece_Para fp, Pecas p, Fornecedores f
	where fp.Quant <= @qtd_pj 
		and fp.PNro = pj.PNro
		and fp.PeNro = p.PeNro
		and fp.FNro = f.FNro
		order by Qtd
end
sp_ativ04_2408 2
 --drop procedure sp_ativ04_2408