CREATE database heranca
use heranca
CREATE TABLE IES(
	IES_codigo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	IES_nome varchar(40) NOT NULL
)

CREATE TABLE Pessoas(
	Pes_codigo int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Pes_nome varchar(40) NOT NULL
)	

CREATE TABLE Clientes (
	Pes_codigo int NOT NULL PRIMARY KEY,
	Cli_cpf varchar(12) NOT NULL UNIQUE,
	Cli_email varchar(30) NULL,
	foreign key (Pes_codigo) references Pessoas(Pes_codigo)
)

CREATE TABLE Funcionarios(
	Pes_codigo int NOT NULL PRIMARY KEY,
	Fun_ch int NOT NULL,
	Fun_salario money NOT NULL,
	foreign key (Pes_codigo) references Pessoas(Pes_codigo)
)

CREATE TABLE Estagiarios(
	Pes_codigo int NOT NULL PRIMARY KEY,
	Est_data datetime NOT NULL,
	IES_codigo int NOT NULL,
	foreign key (IES_codigo) references IES(IES_codigo),
	foreign key (Pes_codigo) references Pessoas(Pes_codigo)
)
