CREATE DATABASE empresa;

CREATE TABLE Cargo (
  cod_cargo INT NOT NULL PRIMARY KEY auto_increment,
  nome VARCHAR(20) NOT NULL,
  salario NUMERIC NOT NULL
 );

CREATE TABLE Funcionario (
	cod_func INT NOT NULL PRIMARY KEY auto_increment,
  	nome_func VARCHAR(150) NOT NULL,
  	email VARCHAR(255) NOT NULL,
  	salario NUMERIC NOT NULL,
  	cod_cargo INT NOT NULL,
);


CREATE TABLE Dependente (
	cod_dep INT NOT NULL PRIMARY KEY auto_increment,
  	nome VARCHAR(255) NOT NULL,
  	salario_base NUMERIC NOT NULL
);

CREATE TABLE Historico (
	cod_historico INT NOT NULL PRIMARY KEY auto_increment,
  	operacao CHAR(1) NOT NULL,
  	nome_func VARCHAR(255) NOT NULL,
  	data DATE NOT NULL,
  	cod_func INT NOT NULL,
  	FOREIGN KEY (cod_func) REFERENCES Funcionario(cod_func)
);

INSERT INTO Cargo VALUES(null, 'Programador', 100000);
INSERT INTO Funcionario (nome_func, email, salario, cod_cargo)
VALUES ('Raphael', 'raphael@test.com', 50000, 1);

# Exercicio 1
delimiter #
CREATE PROCEDURE atualizar_salarios(cargo INT, reajuste NUMERIC)
BEGIN
  UPDATE Funcionario SET salario = salario * reajuste WHERE cod_cargo = cargo;
END

delimiter ;

CALL atualizar_salarios(1, 1.5);

# Exercicio 2
delimiter #
CREATE FUNCTION funcionarios_por_cargo(cargo INT) RETURNS INT
BEGIN
	DECLARE contador INT;
    SELECT COUNT(*) FROM Funcionario where cod_cargo = cargo INTO contador;
    RETURN contador;
END
delimiter ;

SELECT funcionarios_por_cargo(1);

# Exercicio 3
delimiter #
CREATE FUNCTION maior_salario() RETURNS NUMERIC
BEGIN
	DECLARE salario NUMERIC;
    SELECT MAX(salario) FROM Cargo INTO salario;
    RETURN salario;
END
delimiter ;

SELECT maior_salario();

# Exercicio 4

delimiter //
CREATE TRIGGER registrar_delecao AFTER DELETE
ON Funcionario
FOR EACH ROW
BEGIN
INSERT INTO Historico(operacao, data, nome_func, cod_func)
VALUES('E', NOW(), OLD.nome_func, OLD.cod_func);
END;
//

DELETE FROM Funcionario;

# Exercicio 5
delimiter //
CREATE TRIGGER registrar_dependente AFTER INSERT
ON Dependente
FOR EACH ROW
BEGIN
UPDATE Funcionario SET salario = salario + 90 WHERE cod_func = NEW.cod_func;
END;
//

INSERT INTO Dependente VALUES (null, 'Test', 1000);

# Exercicio 6
delimiter #
CREATE FUNCTION obter_cargo(funcionario INT) RETURNS VARCHAR(255)
BEGIN
	DECLARE n VARCHAR(255);
    SELECT nome FROM Cargo 
    WHERE cod_cargo = 
    (SELECT cod_cargo FROM Funcionario WHERE cod_func = funcionario) INTO n;
    RETURN n;
END
delimiter ;


SELECT obter_cargo(1);

# Exercicio 7
delimiter #
CREATE PROCEDURE gerar_relatorio()
BEGIN
	SELECT f.nome_func "Funcionario", f.salario "Saĺario", c.nome "Cargo" FROM Funcionario f
    INNER JOIN Cargo c ON f.cod_cargo = c.cod_cargo;
END
delimiter ;


CALL gerar_relatorio();

