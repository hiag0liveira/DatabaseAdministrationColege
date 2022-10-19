# Atividade não avaliativa em aula
SELECT c.descricao "Descrição", COUNT(cl.id_cidade) "Número de Habitantes" FROM cidade c
INNER JOIN cliente cl ON cl.id_cidade = c.id_cidade
GROUP BY c.descricao;

# Exercicio 1
SELECT DISTINCT c.nome FROM cliente c
INNER JOIN venda v ON v.id_cliente = c.id_cliente;

# Exercicio 2
SELECT v.nome, COUNT(ve.id_venda) vendas from vendedor v
INNER JOIN venda ve ON ve.id_vendedor = v.id_vendedor
GROUP BY v.nome
ORDER BY vendas DESC;

# Exercicio 3
SELECT p.descricao produto, f.descricao fabricante from produto p
INNER JOIN fabricante f ON p.id_fabricante = f.id_fabricante;

# Exercicio 4
SELECT DISTINCT c.nome FROM cliente c 
INNER JOIN venda v ON c.id_cliente = v.id_cliente
WHERE v.ano = '2011';

# Exercicio 5
SELECT v.nome vendedor, vnd.ano, vnd.mes, vnd.id_venda from vendedor v
INNER JOIN venda vnd ON v.id_vendedor = vnd.id_vendedor
WHERE vnd.ano >= '2011';

# Exercicio 6
SELECT v.nome vendedor, c.descricao cidade FROM vendedor v
INNER JOIN cidade c ON v.id_cidade = c.id_cidade;

# Exercicio 7
SELECT p.id_produto, p.descricao, p.valor FROM produto p
WHERE p.valor = (SELECT MIN(valor) FROM produto);

# Exercicio 8
SELECT p.id_produto, p.descricao, p.valor FROM produto p
WHERE p.valor >= (SELECT AVG(valor) FROM produto)
ORDER BY p.valor DESC;


