CREATE DATABASE projetos;

CREATE TABLE AreaNegocio (
	id INT NOT NULL AUTO_INCREMENT,
	descricao varchar(50) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Desenvolvedor (
	id INT NOT NULL AUTO_INCREMENT,
	nome varchar(50) NOT NULL,
	telefone varchar(20) DEFAULT NULL,
	date_nascimento DATE DEFAULT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Gerente (
  	id INT NOT NULL AUTO_INCREMENT,
	cpf int(11) NOT NULL,
	nome varchar(50) NOT NULL,
	telefone varchar(20) NOT NULL,
	data_nascimento DATE NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Projeto (
	id INT NOT NULL AUTO_INCREMENT,
	id_gerente INT NOT NULL,
  	id_area INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim_estimada DATE DEFAULT NULL,
	custo_aproximado FLOAT DEFAULT NULL,
	status_desenvolvimento ENUM('inicial','em desenvolvimento','em implantação','concluído') NOT NULL,
	data_fim DATE DEFAULT NULL,
	linguagem_programacao enum('java','ruby','python','outra') NOT NULL,
	breve_descricao varchar(100) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (id_area) REFERENCES AreaNegocio (id),
	FOREIGN KEY (id_gerente) REFERENCES Gerente (id)
);

CREATE TABLE ProjetoDesenvolvedor (
	id INT AUTO_INCREMENT NOT NULL,
	data_inicio date NOT NULL,
  	funcao ENUM ('dev', 'test') NOT NULL,
	id_desenvolvedor INT NOT NULL,
	id_projeto int(11) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (id_projeto) REFERENCES Projeto (id),
	FOREIGN KEY (id_desenvolvedor) REFERENCES Desenvolvedor (id)
);

# Join Simples
SELECT g.nome Gerente, p.id FROM Projeto p
INNER JOIN Gerente g ON p.id_gerente = g.id;

# Join Complexo
SELECT p.id, p.breve_descricao, d.nome, pd.funcao FROM Projeto p
INNER JOIN ProjetoDesenvolvedor pd ON p.id = pd.id_projeto
INNER JOIN Desenvolvedor d ON pd.id_desenvolvedor = d.id;

CREATE DATABASE BD_oficina;

