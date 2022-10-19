
-- Permite que o admin acesse o MySQL Server a partir de qualquer IP com todas as permissões

    create user admin IDENTIFIED BY'123';
    GRANT ALL PRIVILEGES ON * . * TO admin;

-- Permite que Hiago acesse o MySQL Server para apenas visualizar somente três tabelas.
CREATE VIEW Hiago AS
SELECT *
FROM aluno,professor,administrador;

create user usuario1 IDENTIFIED BY'123';
GRANT ALL ON sip.Hiago to usuario1;

-- Permite que João acesse o MySQL Server para visualizar somente o nome do curso e o numero da turma.
CREATE VIEW visualizarTurmas AS
SELECT turma.numeroTurma, curso.nome;
FROM turma
JOIN curso
ON turma.idCurso = curso.idCurso;

create user usuario2 IDENTIFIED BY'123';
GRANT ALL ON sip.visualizarTurmas to usuario2;