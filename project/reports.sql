--Relatório para imprimir a todas as disciplinas de um curso lecionadas por professores com mais de 30 anos.
SELECT curso.nome as " Nome do Curso", disciplina.nome as " Disciplinas", professor.nome "Professor"
FROM curso
Join disciplina
on curso.idCurso = disciplina.idCurso
join professor
on professor.idDisciplina = disciplina.idDisciplina
WHERE professor.dataNascimento > "1992-01-01";
 
--Relatórios dos alunos de uma devida aula.
SELECT aula.dataAula as "Data da Aula", aluno.nome as "Nome do Aluno", presenca.situacao as "Presente"
from presenca
join aula
on presenca.idAula = aula.idAula
Join aluno
on presenca.idAluno = aluno.idAluno
where aula.dataAula = "2022-06-11";
 
-- Relatório para mostrar os professores com suas devidas disciplina que são responsáveis e dias das semana que leciona. 
SELECT professor.nome as "Professor",disciplina.nome as "Disciplina",quadro_horario.diasSemana as "Dia da Semana"
FROM professor
JOIN disciplina
ON professor.idDisciplina = disciplina.idDisciplina
JOIN quadro_horario
ON quadro_horario.idDisciplina = disciplina.idDisciplina;
 
-- Relatório para mostrar a quantidade de aluno em cada curso.
SELECT curso.nome as "Nome do Curso", COUNT(*) as "Quantidade de Aluno"
FROM curso
JOIN turma
ON curso.idCurso = turma.idCurso
JOIN aluno
ON turma.idTurma = aluno.idTurma
GROUP BY curso.nome;
 
-- Relatório para mostrar a o Quadro de horário de uma devida turma com suas disciplinas.
select quadro_horario.diasSemana as "Dias da Semana ", quadro_horario.horario as "Horário ", turma.numeroTurma as "Numero da Turma ", disciplina.nome as "Nome da disciplina"
from quadro_horario
join turma
on quadro_horario.idTurma = turma.idTurma
join disciplina
on quadro_horario.idDisciplina = disciplina.idDisciplina
where turma.numeroTurma = 6003;
 
