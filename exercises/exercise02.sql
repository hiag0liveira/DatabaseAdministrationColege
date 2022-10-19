
# Exercicio 1
SELECT * FROM cliente WHERE pontos_prog_fidelidade IS NOT NULL
ORDER BY pontos_prog_fidelidade DESC;

# Exercicio 2
SELECT genero, AVG(pontos_prog_fidelidade) FROM cliente
GROUP BY genero;

# Exercicio 3
SELECT ano_cadastro, COUNT(*) FROM cliente
GROUP BY ano_cadastro
ORDER BY ano_cadastro;

# Exercicio 4
SELECT ano_cadastro, COUNT(*) FROM cliente
WHERE ano_cadastro BETWEEN 2005 AND 2010
GROUP BY ano_cadastro
ORDER BY ano_cadastro;

# Exercicio 5
SELECT id_fabricante, COUNT(*) FROM produto
GROUP BY id_fabricante;

# Exercicio 6
SELECT venda.id_venda, SUM(qtde) FROM venda
JOIN item_venda ON venda.id_venda = item_venda.id_venda
GROUP BY venda.id_venda;

# Exercicio 7
SELECT DISTINCT vendedor.percentual_comissao FROM vendedor;

# Exercicio 8
SELECT DISTINCT produto.id_fabricante FROM produto;

# Exercicio 9
SELECT * FROM produto
ORDER BY qtde_estoque DESC; 

# Exercicio 10
SELECT * FROM vendedor
WHERE genero = 0 AND
nome LIKE '%Maria%';

# Exercicio 11
SELECT * FROM vendedor
WHERE genero = 0
AND salario >= 1500;

# Exercicio 12
SELECT descricao, valor FROM produto
WHERE produto.valor >= 100;


