-- A escola precisa verificar se a turma estar no limite de alunos, para ver a possibilidade de inclusão de um novo;
DELIMITER //
CREATE PROCEDURE checkTurma(n INT)
BEGIN
	DECLARE qtd INT;
    SET qtd = qtdAlunos(n);
    if qtd > 20 then 
		select 'Turma cheia! Não é possível incluir.';
	end if;
END
 //

call  checkTurma (1);


-- O sistema precisa Saber a quantidade de alunos de uma devida turma
drop function if exists qtdAlunos; 
DELIMITER //
create function qtdAlunos(xidTurma integer) returns int 
begin
declare n integer;
select count(a.idAluno) INTO n from aluno a join turma t on a.idTurma = t.idTurma where t.idTurma = xidTurma;
return (n);
END
//

-- Quando for excluir uma disciplina é preciso excluir o professor responsavel por ela 
DELIMITER //
DROP trigger IF EXISTS delDisciplina //
create trigger delDisciplina before DELETE
ON disciplina
FOR EACH ROW
BEGIN
delete from professor
where idDisciplina = old.idDisciplina;
END
//
