-- Views 
-- duas formas: 
create view VisaoFornecedoresPe�as3 as  
	select p.penro, p.PeNome NomePe�a 
	from Peca p 
	where p.PeNro IN ( 
		select 	distinct fp.PeNro 
		from Fornece_para fp 
		where fp.FNro not in ( select f.FNro 
								from Fornecedor f 
								where	f.FCateg = 'A' ) ) 

 -- Ou dessa forma:
create view VisaoFornecedoresPe�as4 as  
	select distinct p.penro, p.PeNome 
	from Peca p 
		inner join Fornece_Para fp on fp.PeNro = p.PeNro  
		inner join Fornecedor f on  f.FNro = fp.FNro 
	where f.FCateg not in ('A') 