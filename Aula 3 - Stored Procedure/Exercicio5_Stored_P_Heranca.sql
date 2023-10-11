----Exercicio IES SP 1B 31/08

--Crie uma StoredProcedure que receba o n� do projeto e liste os nomes dos mesmos e os nomes de pe�as, 
--bem como as quantidades fornecidas, renomeando as colunas. 
 Create Procedure sp_001 (@num_proj int) as begin
	select p.PNro Num_Projeto ,p.PNome Nome_Projeto,pe.PeNome Nome_Peca, fp.Quant Qtd 
	from Projeto p, Fornece_Para fp, Pecas pe
	where p.PNro = @num_proj 
		and fp.PeNro = pe.PeNro  
		and p.PNro = fp.PNro	
end
exec sp_001 3

--Enviar o c�digo do projeto para a stored procedure 
--e listar o nome do projeto e do fornecedor referente a este c�digo do projeto 
 Create Procedure sp_002 (@num_proj int) as begin
	select p.PNome Nome_Projeto, f.FNome
	from Projeto p, Fornece_Para fp, Fornecedores f
	where p.PNro = @num_proj 
		and fp.PeNro = f.FNro
		and p.PNro = fp.PNro	
end
exec sp_002 3

--Criar uma Stored Procedure que receba a quantidade de pe�as fornecidas 
--e verifique quais quantidades est�o abaixo desse valor, mostrando o nome do projeto, da pe�a e do fornecedor. 
 
 Create Procedure sp_003 (@qtd_pecas int) as begin
	select pe.PeNome Nome_Peca, fp.Quant Qtd 
	from Fornece_Para fp, Pecas pe
	where fp.Quant = @qtd_pecas 
		and fp.PeNro = pe.PeNro  	
end
exec sp_003 3

--Crie uma Stored Procedure que receba uma quantidade de pe�as
--e mostre os nomes de projetos, 
--pe�as e fornecedores que possuam quantidades iguais ou inferiores � quantidade passada. 
Create Procedure sp_004 (@num_proj int) as begin
	select p.PNro Num_Projeto ,p.PNome Nome_Projeto,pe.PeNome Nome_Peca, fp.Quant Qtd 
	from Projeto p, Fornece_Para fp, Pecas pe
	where p.PNro = @num_proj 
		and fp.PeNro = pe.PeNro  
		and p.PNro = fp.PNro	
end
exec sp_0041 3