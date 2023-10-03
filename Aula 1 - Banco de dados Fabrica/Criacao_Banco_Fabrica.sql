--CREATE DATABASE Fabrica
USE[Fabrica]

CREATE TABLE Peca 
( 
PeNro int NOT NULL primary key , 
PeNome varchar(15) NOT NULL, 
PePreco float NOT NULL, 
PeCor	varchar(15) 
) 

USE[Fabrica]
CREATE TABLE Fornecedor 
( 
FNro int NOT NULL primary key ,
FNome varchar(30) not null, 
FCidade varchar(25) not null,
FCateg varchar(1) not null 
)

USE[Fabrica]
CREATE TABLE Projeto 
( 
PNro int NOT NULL primary key , 
PNome varchar(30) not null, 
PDuracao varchar(15) not null,
PCusto money not null 
)

USE[Fabrica]
CREATE TABLE Fornece_Para 
( 
PeNro int not null,
FNro int NOT NULL,
PNro int NOT NULL,
Quant int NOT NULL,
primary key(PeNro, FNro,PNro),
foreign key (PeNro) references Peca(PeNro),
foreign key (FNro) references Fornecedor(FNro),
foreign key (PNro) references Projeto(PNro)
)