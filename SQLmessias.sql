--DROP DATABASE
DROP DATABASE bdi221;

-- Criação do Banco de Dados
CREATE DATABASE AULA_BDI_221;

-- Definir qual banco de dados vamos utilizar
USE AULA_BDI_221;
GO

-- TABELA PRODUTOS
DROP TABLE DBO.PRODUTO;
GO

CREATE TABLE PRODUTO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(50),
	DESCRICAO VARCHAR(255),
	TIPO CHAR(1),
	VALOR DECIMAL(5,2),
	CONSTRAINT PK_PRODUTO PRIMARY KEY(ID)
);
GO

-- TABELA FORMA DE PAGAMENTO
DROP TABLE FORMA_PAGAMENTO;
GO

CREATE TABLE FORMA_PAGAMENTO(
	ID INT IDENTITY(1,1) NOT NULL,
	DESCRICAO VARCHAR(50) NOT NULL,
	CONSTRAINT PK_FORMA_PAGAMENTO PRIMARY KEY(ID)
);
GO

-- TABELA FUNCIONARIO
DROP TABLE FUNCIONARIO;
GO

CREATE TABLE FUNCIONARIO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(255) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	SALARIO DECIMAL(6,2) NOT NULL,
	-- COD ENDERECO
	TIPO CHAR(1) NULL,
	N_CONSELHO INT NULL,
	ESPECIALIDADE VARCHAR(20) NULL,
	COMISSAO DECIMAL(4,2),
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(ID)
);
GO

-- TABELA CLIENTE
DROP TABLE CLIENTE;
GO

CREATE TABLE CLIENTE(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(255) NOT NULL,
	-- COD_ENDERECO
	-- TELEFONE
	EMAIL VARCHAR(50) NOT NULL,
	CONSTRAINT PK_CLIENTE PRIMARY KEY(ID)
);
GO

-- TABELA PRONTUARIO
DROP TABLE PRONTUARIO;
GO

CREATE TABLE PRONTUARIO (
	ID INT IDENTITY(1,1) NOT NULL,
	DESCRICAO VARCHAR(255),
	TEMPERATURA DECIMAL(3,1),
	PESO DECIMAL(3,1),
	CONSTRAINT PK_PRONTUARIO PRIMARY KEY(ID)
);
GO

-- TABELA PET
DROP TABLE PET;
GO

CREATE TABLE PET(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(50),
	ESPECIE VARCHAR(50),
	PORTE VARCHAR(50),
	DT_NASC DATE,
	ID_PRONTUARIO INT NULL,
	CONSTRAINT PK_PET PRIMARY KEY(ID),
	CONSTRAINT FK_PET_PRONTUARIO FOREIGN KEY(ID_PRONTUARIO)
	REFERENCES DBO.PRONTUARIO (ID)
);
GO

-- TABELA CLIENTE-PET
DROP TABLE CLIENTE_PET;
GO

CREATE TABLE CLIENTE_PET(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_PET INT NOT NULL,
	CONSTRAINT PK_CLIENTE_PET PRIMARY KEY(ID),
	CONSTRAINT FK_CLIENTE_PET_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE (ID),
	CONSTRAINT FK_CLIENTE_PET_PET FOREIGN KEY (ID_PET)
	REFERENCES DBO.PET (ID)
);
GO

-- TABELA VENDA
DROP TABLE VENDA;
GO

CREATE TABLE VENDA(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_FORMA_PAGAMENTO INT NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_FUNCIONARIO INT NOT NULL,
	CONSTRAINT PK_VENDA PRIMARY KEY(ID),
	CONSTRAINT FK_VENDA_FORMA_PAGAMENTO FOREIGN KEY(ID_FORMA_PAGAMENTO)
	REFERENCES DBO.FORMA_PAGAMENTO (ID),
	CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE (ID),
	CONSTRAINT FK_vENDA_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO (ID)
);
GO

-- TABELA PRODUTO_VENDA
DROP TABLE PRODUTO_VENDA;
GO

CREATE TABLE PRODUTO_VENDA(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_PRODUTO INT NOT NULL,
	ID_VENDA INT NOT NULL,
	CONSTRAINT PK_PRODUTO_VENDA PRIMARY KEY(ID, ID_PRODUTO, ID_VENDA),
	CONSTRAINT FK_PRODUTO_VENDA_PRODUTO FOREIGN KEY (ID_PRODUTO)
	REFERENCES DBO.PRODUTO (ID),
	CONSTRAINT FK_PRODUTO_VENDA_VENDA FOREIGN KEY (ID_VENDA)
	REFERENCES DBO.VENDA (ID)
);
GO

-- Vers�o dos Alunos

USE AULA_BDI_221;
GO

-- INSERT FORMAS DE PAGAMENTO

SELECT * FROM DBO.FORMA_PAGAMENTO;

INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Dinheiro');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartao de Debito');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartao de Credito (Vencimento)');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartao de Credito (Parcelado)');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Carne');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Pix');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('PicPay');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Google Pay');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES('Mercado Pago');

-- TABELA PRODUTO

SELECT * FROM DBO.PRODUTO

INSERT INTO DBO.PRODUTO
VALUES('Bola de brinquedo',
'Bola para morder e pegar para cachorros',
'P', 10.00);

INSERT INTO DBO.PRODUTO VALUES('Shampo Pet Love',
'Para um banho cheiroso', 'P', 13.00);

INSERT INTO DBO.PRODUTO
VALUES('Banho e Tosa', 'Servi�o de est�tica', 'S', 60.00);

INSERT INTO DBO.PRODUTO
VALUES('Coleira', 'Seguran�a para seu pet', 'P', 66.90);

INSERT INTO DBO.PRODUTO
VALUES('Consulta Veterin�ria', 'Consulta especializada', 'S', 299.90);


INSERT INTO DBO.PRODUTO VALUES
    ('Racao Atacama 16kg', 'Raçao boa pra cachorro', 'P', 230),
    ('Bola de brinquedo', 'Bola para morder e pegar para cachorros', 'P', 10),
    ('Catnip 10g', 'Erva de gato desidratada', 'P', 25),
    ('Pedras de fire', 'Raçao crocante e flamejante', 'P', 0.5),
    ('Remedio pulkill', 'Matar pulga ', 'p', 90),
    ('Raçao Wiskas', 'Raçao para gatos', 'P', 20),
    ('Correntes de Asgard ', 'Correntes que prederam o lobo Fenrir de Asgard', 'P', 98),
    ('Sampoo Premium', 'Shampoo da linha premium para pelos sedosos', 'P', 250),
    ('Raçoes Pilar', 'Comida de cachorro', 'P', 88),
    ('Mordedor', 'Mordedor para cachorro de grande porte', 'P', 58.90),
    ('Raçao mania', 'Comida de cachorro', 'P', 58.91),
    ('Osso Roedor', 'Ossinho de roer para cachorro inquieto', 'P', 58.92),
    ('Gaiola roedores', 'Gaiola para pequenos roedores - tamanho medio ', 'P', 58.93);

-- TABELA CLIENTES

SELECT * FROM DBO.CLIENTE;

INSERT INTO DBO.CLIENTE VALUES

    ('Marcia Nicole Vieira', 'marcianicolevieira@cdcd.com.br'),
    ('Maria Nunes', 'marianunes11@gmail.com'),
    ('Giro Comes', 'Giro_idoso+60@gmail.com'),
    ('Gabriel', 'FogoFest2022@gmail.com'),
    ('Joaovisck', 'joaovisk@gmail.com'),
    ('Pedro Silva', 'pedrinhoradical@gmail.com'),
    ('Mbappe', 'MatheuzinReiDelas2010@hotmail.com'),
    ('Ribamar', 'Ribagol@gmail.com'),
    ('Alphonse Areola', 'alphonseareola@gmail.com'),
    ('Brito', 'tuliocesarluna@gmail.com'),
    ('Bento Andre de Lima', 'bentoal@gmail.com'),
    ('Cleiton Rasta', 'cleitonreagge@gmail.com');


-- TABELA FUNCION�RIOS

INSERT INTO DBO.FUNCIONARIO VALUES

    ('Rosimere Theodoro Manhães', '38786704940', 2500.00, 'Veterinário', 696432, NULL, NULL),
    ('Osmar', '11122233304', 1500, 'Vendedor', NULL, NULL, 15.0),
    ('José Da Silva', '79878314665', 5000, 'Veterinário', '123456789', 'Dermatologia', NULL),
    ('Mestre dos Magos', '00000000000', 2500, 'vendedor', NULL, NULL, NULL),
    ('Biu Silva', '18968412399',870, 'Atendente ', '90228922', 'Vender', NULL),
    ('serafin da silva ', '40028922188',   1200, '', '17107788', 'Vender', NULL),
    ('Shayane Silva', '98456512300',  1795.00, 'Atendente ', '15565456', '', NULL),
    ('Hermenegildo', '55244364476', 3500.00, 'Veterinário', '6743856', 'Oncologista', NULL),
    ('Biu do Espetinho', '55026988075',  6980, 'Atendente', '33011418', 'atender', NULL),
    ('Joaquim Da Silva Santos', '12107745285', 9785.00, 'Vendedor', NULL, NULL, 0.15),
    ('Brito', '14236918708', 4000.96, 'Atendente', '786321', 'Atender', 0.15);

	Select * from DBO.FUNCIONARIO;