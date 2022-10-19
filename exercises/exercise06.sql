# Questão 1
CREATE TABLE Proprietario (
	idProprietario INT NOT NULL PRIMARY KEY auto_increment,
  	nome VARCHAR(50) NOT NULL,
  	dtNasc DATE NOT NULL,
  	telefone VARCHAR(15) NOT NULL
);

CREATE TABLE Veiculo (
	idVeiculo INT NOT NULL PRIMARY KEY auto_increment,
  	modelo VARCHAR(30) NOT NULL,
  	ano INT NOT NULL,
  	cor VARCHAR(30) NOT NULL,
  	idProprietario INT NOT NULL,
  	FOREIGN KEY (idProprietario) REFERENCES Proprietario (idProprietario)
  	ON DELETE RESTRICT ON UPDATE CASCADE
);

# Questão 2
CREATE INDEX veiculo_proprietario_idx ON Veiculo(idProprietario);

# Questão 3
# mysqldump -u root -p root --databases BD_oficina > backup.sql

# Questão 4
# mysqldump -u root -p root BD_oficina Veiculo > backup.sql

# Questão 5
# mysqldump -u root -p root --no-data BD_oficina > backup.sql 
# mysql -u root -p
# CREATE DATABASE BD_oficina2
# USE BD_oficina2.sql
# source backup.sql

# Questão 6
# mysql -u root -p < backup.sql




