# Questao 1
CREATE DATABASE imobiliaria;

USE imobiliaria;

# Questao 2
CREATE TABLE proprietario (
	idProprietario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  	nome VARCHAR(150) NOT NULL,
  	sexo ENUM('m', 'f'),
  	tel VARCHAR(15)
);

CREATE TABLE imovel (
	idMovel INT NOT NULL PRIMARY KEY auto_increment,
	descricao TEXT,
  	tipo ENUM('apto', 'terreno', 'casa'),
  	area NUMERIC NOT NULL,
  	proprietario INT NOT NULL,
  	preco NUMERIC NOT NULL,
  	dataCadastro DATE NOT NULL,
  	FOREIGN KEY (proprietario) REFERENCES proprietario(idProprietario)
);


# Questao 3
INSERT INTO proprietario (nome, sexo, tel) 
VALUES 
('Raphael', 'm', '242342'),
('Bruno', 'm', '342342'),
('Layla', 'f', '542342');

INSERT INTO imovel (descricao, tipo, area, proprietario, preco, dataCadastro)
VALUES
('Apartamento Pelinca', 'apto', 200, 1, 20000, '2022-01-01'),
('Terreno Farol', 'terreno', 1200, 2, 3000, '2021-01-01'),
('Casa Goytacazes', 'casa', 350, 3, 1500, '2022-04-01');

# Questao 4
ALTER TABLE proprietario
ADD COLUMN sexo2 VARCHAR(10);

UPDATE proprietario 
SET sexo2 = 'masculino' WHERE sexo = 'm';

UPDATE proprietario 
SET sexo2 = 'feminino' WHERE sexo = 'f';

ALTER TABLE proprietario
DROP COLUMN sexo;

ALTER TABLE proprietario
RENAME COLUMN sexo2 TO sexo;

# Questao 5
UPDATE imovel
SET preco = preco * 1.2;

# Questao 6
SELECT idMovel, descricao FROM imovel
WHERE tipo = 'apto' AND preco > 130000;

# Questao 7 
SELECT descricao, area, tipo FROM imovel
WHERE area BETWEEN 50 AND 200;

# Questao 8
SELECT * FROM proprietario
WHERE tel = '' OR tel IS NULL;

# Questao 9
SELECT nome, tel FROM proprietario WHERE sexo = 'feminino';

# Questao 10
ALTER TABLE proprietario
ADD COLUMN idade INT;

UPDATE proprietario
SET idade = 20;

# Questao 11
SELECT descricao, nome as 'Proprietario' FROM imovel
INNER JOIN proprietario ON imovel.proprietario = proprietario.idProprietario;

# Quetao 11
SELECT nome as 'Proprietario', descricao FROM proprietario
INNER JOIN imovel ON imovel.proprietario = proprietario.idProprietario;
