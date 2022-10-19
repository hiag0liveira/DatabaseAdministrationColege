CREATE DATABASE imobiliaria;

USE imobiliaria;

CREATE TABLE CorretorResponsavel (
  id_corretor INT PRIMARY KEY NOT NULL auto_increment,
  nome VARCHAR(150) NOT NULL,
  cpf VARCHAR(13) NOT NULL
 );
 
 CREATE TABLE endereco (
 	id_endereco INT PRIMARY KEY NOT NULL auto_increment,
   	rua VARCHAR(150) NOT NULL,
   	estado VARCHAR(100) NOT NULL,
   	cidade VARCHAR(150) NOT NULL,
   	bairro VARCHAR(100),
   	complemento VARCHAR(100)
 );
 
 CREATE TABLE cliente (
 	id_cliente INT PRIMARY KEY NOT NULL auto_increment,
   	nome VARCHAR(150) NOT NULL,
   	telefone VARCHAR(20) NOT NULL
 );
 
 CREATE TABLE imovel (
 	id_movel INT PRIMARY KEY NOT NULL auto_increment,
   	descricao TEXT NOT NULL,
   	area INT NOT NULL,
   	preco FLOAT NOT NULL,
   	tipo enum('Casa', 'Apto', 'Terreno'),
   	dtCadastro DATE NOT NULL,
   	id_endereco INT NULL,
   	id_corretor INT NOT NULL,
   	FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco) ON DELETE SET NULL,
   	FOREIGN KEY (id_corretor) REFERENCES CorretorResponsavel(id_corretor) ON DELETE RESTRICT
 );
 
 CREATE TABLE Reserva (
 	id_reserva INT NOT NULL PRIMARY KEY auto_increment,
   	data DATE NOT NULL,
   	hora TIME NOT NULL,
   	id_imovel INT NOT NULL,
   	id_cliente INT NOT NULL,
   	FOREIGN KEY (id_imovel) REFERENCES imovel(id_movel) ON DELETE CASCADE,
   	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
 );
 
 INSERT INTO CorretorResponsavel
 VALUES
 (null, 'Raphael Collin', '17772492790');
 
 INSERT INTO endereco
 VALUES
 (null, 'Rua Jose Pedro', 'RJ', 'Campos dos Goytacazes', 'Goytacazes', null);
 
 INSERT INTO cliente
 VALUES
 (null, 'Layla', '2342342342');
 
 INSERT INTO imovel
 VALUES
 (null, 'Casa Farol', 500, 14.5, 'Terreno', '2022-01-01', 1, 1);
 
 INSERT INTO Reserva
 VALUES
 (null, '2022-08-02', '18:00:00', 1, 1);


DELETE FROM CorretorResponsavel WHERE id_corretor = 1;

DELETE FROM endereco WHERE id_endereco = 1;

DELETE FROM imovel WHERE id_movel = 1;

DELETE FROM cliente WHERE id_cliente = 1;






