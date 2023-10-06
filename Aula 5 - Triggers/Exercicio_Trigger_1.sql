-- aula 03/10/2023 --Triggers Exercicio 1
--1 - Após incluir uma peça com atributo cor 'Amarelo', modifique tal cor para 'Azul'.  
Create Trigger Ex1 on Peca after insert as
	Update Peca set PeCor = 'Azul' where PeNro in (select PeNro from inserted)  and (select PeCor from inserted) = 'Amarelo'
	
	insert into Peca values (8, 'Yuri',100, 'Amarelo')
	
	select * from Peca


--2 - Ao invés de deletar uma peça, crie um trigger para modificar o atributo PePreco dela para 50.  
Create trigger Ex2 on Peca INSTEAD OF delete as 
	Update Peca set PePreco = 50 where PeNro in (select PeNro from deleted)
	delete from Peca where PeNro = 6

--3 - Crie um trigger para, ao invés de atualizar o nome de uma peça com um valor qualquer, atualize o campo Pecor dela para 'Amarelo'.  
Alter trigger Ex3 on Peca INSTEAD OF update as
   Update Peca set PeCor = 'Amarelo'
   Where PeNro in (select PeNro from inserted)

	update Peca set PeNome = 'teste' where PeNro = 3
		
	select * from Peca

--4 - Faça um trigger para uma inserção na tabela peça que ao invés de inserir um valor para Pecor, troque-o para 'Roxo' 
Alter Trigger Ex4 on Peca insert as
	Update Peca Set PeCor = 'Roxo'
	Where PeNro in (select PeNro from inserted)

	insert into Peca values (8, 'tauani',560, 'Lilas')
	select * from Peca

