# Número 1
CREATE VIEW v_cliente_fidelidade AS SELECT 
	id_cliente, nome, pontos_prog_fidelidade 
FROM cliente WHERE pontos_prog_fidelidade IS NOT NULL
ORDER BY pontos_prog_fidelidade DESC;

SELECT * FROM v_cliente_fidelidade;

# Número 2
CREATE VIEW v_cliente_media_genero AS SELECT 
	CASE WHEN genero = 0 THEN "Feminino" ELSE "Masculino" END Genero, 
    AVG(pontos_prog_fidelidade) Media 
FROM cliente
GROUP BY genero;

SELECT * FROM v_cliente_media_genero;

# Número 3
CREATE VIEW v_vendedoras AS SELECT COUNT(*) Vendedoras FROM vendedor WHERE genero = 0;
SELECT * FROM v_vendedoras;

# Número 4
CREATE VIEW v_compradores AS SELECT c.nome FROM cliente c
WHERE (SELECT COUNT(*) FROM venda WHERE id_cliente = c.id_cliente) >= 1;

SELECT * FROM v_compradores;

# Número 5
CREATE VIEW v_produto_fabricante AS SELECT 
	p.descricao Produto, f.descricao Fabricante 
FROM produto p INNER JOIN fabricante f ON f.id_fabricante = p.id_fabricante;

SELECT * FROM v_produto_fabricante;

# Número 6
CREATE VIEW v_compradores_2011 AS SELECT c.nome FROM cliente c
WHERE (SELECT COUNT(*) FROM venda WHERE id_cliente = c.id_cliente AND venda.ano = 2011) >= 1;

SELECT * FROM v_compradores_2011;

# Número 7
CREATE VIEW v_clientes_para_vendedores AS 
SELECT c.id_cliente, c.nome, c.ano_cadastro, ci.descricao Cidade FROM cliente c
INNER JOIN cidade ci ON c.id_cliente = ci.id_cidade;

SELECT * FROM v_clientes_para_vendedores;

CREATE USER 'vendedor' IDENTIFIED BY '123';

GRANT ALL ON papelaria.v_clientes_para_vendedores TO 'vendedor';

