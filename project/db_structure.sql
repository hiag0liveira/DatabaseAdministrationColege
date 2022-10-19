create database sip;
use sip;

create table administrador(
    idAdm int not null auto_increment primary key,
	nome varchar(50) not null,
	telefone varchar(25) not null,
	endereco varchar(100) not null,
	dataNascimento date not null,
	cargo varchar(50) not null
);

create table curso(
    idCurso int not null auto_increment primary key,
    nome varchar(50) not null,
    idAdm int,
    foreign key(idAdm) references administrador(idAdm) on delete set null on update cascade
);

create table disciplina(
idDisciplina int not null auto_increment primary key,
nome varchar(50) not null,
idCurso int not null,
foreign key (idCurso) references curso(idCurso) on delete cascade on update cascade
);

create table professor(
    idProfessor int not null auto_increment primary key,
    nome varchar(50) not null,
    telefone varchar(25) not null,
    endereco varchar(100) not null,
    dataNascimento date not null,
    idDisciplina int,
    foreign key(idDisciplina) references disciplina(idDisciplina) on delete set null on update cascade
);

create table turma(
    idTurma int not null auto_increment primary key,
    numeroTurma varchar(5) not null,
    idCurso int,
    idAdm int,
    foreign key(idCurso) references curso(idCurso)on delete set null on update cascade,
    foreign key(idAdm) references administrador(idAdm) on delete set null on update cascade
);

create table quadro_horario(
idQuadro int not null auto_increment primary key,
diasSemana varchar(20) not null,
horario time not null,
idDisciplina int not null,
idturma int not null,
index idx_quadro(idQuadro),
foreign key (idDisciplina) references disciplina(idDisciplina) on delete cascade on update cascade,
foreign key (idturma) references turma(idturma) on delete cascade on update cascade
);

create table aula(
idAula int not null auto_increment primary key,
dataAula date not null,
idQuadro int,
index idx_aula(idAula),
foreign key (idQuadro) references quadro_horario(idQuadro) on delete set null on update cascade
);

create table aluno(
    idAluno int not null auto_increment primary key,
    nome varchar(50) not null,
    telefone varchar(25)not null,
    endereco varchar(100)not null,
    dataNascimento date not null,
    matricula int not null,
    idTurma int,
    INDEX idx_aluno(idAluno),
    foreign key(idTurma) references turma(idTurma) on delete set null on update cascade
);

create table presenca(
idPresenca int not null auto_increment primary key,
codigo varchar(15) not null,
situacao boolean not null,
idAula int not null, 
idAluno int not null,
index idx_presenca(idPresenca),
foreign key (idAula) references aula(idAula) on delete cascade,
foreign key (idAluno) references aluno(idAluno) on delete cascade
);