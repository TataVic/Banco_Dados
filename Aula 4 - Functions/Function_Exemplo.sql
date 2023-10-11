--functions 31/08
Declare @minhatabela table(
		PeNro int primary key,
		PeNome varchar (30))
	Insert into @minhatabela
		Select distinct PeNro,PeNome
		from Pecas 
		where PeNome like 'L%'
	Select * from @minhatabela where PeNome = 'Lanterna'