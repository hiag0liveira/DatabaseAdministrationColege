
-- Caso for preciso definir o nome do cargo de acordo com a sua função na CLT

UPDATE administrador SET nome='Administrador' WHERE nome= 'Assistente Administrativo';

-- Caso precise fazer uma separação dentro das matriculas dos alunos

UPDATE aluno SET matricula=
CASE 
    WHEN idAluno = % 0 THEN matricula+10000
end;
