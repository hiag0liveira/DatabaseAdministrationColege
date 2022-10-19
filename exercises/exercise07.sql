CREATE USER 'Maria da Silva' IDENTIFIED BY '123';

GRANT CREATE, INSERT, UPDATE ON *.* TO 'Maria da Silva' WITH GRANT OPTION;

CREATE USER 'Joao de Souza' IDENTIFIED BY '123';

GRANT ALL ON oficina.veiculo TO 'Joao de Souza';
GRANT INSERT(nome), UPDATE(nome) ON oficina.proprietario TO 'Joao de Souza';

GRANT ALL ON *.* TO 'Joao de Souza';
REVOKE DELETE, DROP ON *.* FROM 'Joao de Souza';

SHOW GRANTS FOR 'Joao de Souza';

ALTER USER 'Joao de Souza' IDENTIFIED BY '234';

