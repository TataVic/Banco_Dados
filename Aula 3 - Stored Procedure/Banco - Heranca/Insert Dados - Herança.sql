use heranca 
select * from IES
select * from Pessoas
select * from Clientes
select * from Funcionarios 
select * from Estagiarios
INSERT INTO IES (IES_nome) VALUES
    ('Universidade A'),
    ('Instituto B'),
    ('Faculdade C'),
    ('Escola D'),
    ('Centro Educacional E'),
    ('Universidade F'),
    ('Instituto G'),
    ('Faculdade H'),
    ('Escola I'),
    ('Centro Educacional J');

	----------------
INSERT INTO Pessoas (Pes_nome) VALUES
    ('Fernanda Lima'),
    ('Ricardo Costa'),
    ('Juliana Pereira'),
    ('Márcio Santos'),
    ('Luíza Souza'),
	('João Silva'),
    ('Maria Santos'),
    ('Pedro Almeida'),
    ('Ana Oliveira'),
    ('Carlos Pereira');

INSERT INTO Clientes (Pes_codigo, Cli_cpf, Cli_email) VALUES
    (1, '12345678901', 'joao@example.com'),
    (2, '23456789012', 'maria@example.com'),
    (3, '34567890123', NULL),
    (4, '45678901234', 'ana@example.com'),
    (5, '56789012345', 'carlos@example.com'),
	 (6, '67890123456', 'fernanda@example.com'),
    (7, '78901234567', NULL),
    (8, '89012345678', 'juliana@example.com'),
    (9, '90123456789', 'marcio@example.com'),
    (10, '01234567890', 'luiza@example.com');

INSERT INTO Funcionarios (Pes_codigo, Fun_ch, Fun_salario) VALUES
    (1, 40, 5000.00),
    (2, 35, 4500.00),
    (3, 30, 4000.00),
    (4, 28, 3800.00),
    (5, 40, 5500.00),
	(6, 30, 4200.00),
    (7, 40, 5500.00),
    (8, 35, 4800.00),
    (9, 28, 4000.00),
    (10, 25, 3500.00);

--INSERT INTO Estagiarios (Est_data, IES_codigo)
--VALUES
--    ( '2023-08-29', 1001)
--    ('2023-08-30 10:30:00', 1002),
--    (3, '2023-08-30 14:15:00', 1003),
--    (4, '2023-08-31 11:45:00', 1001),
--    (5, '2023-08-31 13:30:00', 1004),
--    (6, '2023-09-01 08:00:00', 1002),
--    (7, '2023-09-01 15:45:00', 1005),
--    (8, '2023-09-02 10:00:00', 1003),
--    (9, '2023-09-02 12:30:00', 1004),
--    (10, '2023-09-03 09:15:00', 1005);
	SELECT * FROM Estagiarios

insert into Estagiarios (Pes_codigo,Est_data, IES_codigo)
VALUES (1,'20230829',1)
INSERT INTO Estagiarios (Pes_codigo, Est_data, IES_codigo) VALUES
(2, '20230220', 2),
(3, '20230325', 3),
(4, '20230410', 1),
(5, '20230505', 2),
(6, '20230615', 3),
(7, '20230720', 1),
(8, '20230825', 2),
(9, '20230910', 3),
(10, '20231005', 1);

UPDATE Estagiarios
SET Est_data = DATEADD(hour, ABS(CHECKSUM(NEWID()) % 24), Est_data);

select * from Estagiarios
select * from Pessoas
select * from Clientes
select * from Funcionarios