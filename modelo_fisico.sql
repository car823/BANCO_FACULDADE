CREATE DATABASE faculdade_db;
USE faculdade_db;

CREATE TABLE tbl_cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    duracao INT NOT NULL,
    nivel VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_alunos (
    aluno_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100),
    matricula VARCHAR(20) NOT NULL UNIQUE,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES tbl_cursos(curso_id)
);

CREATE TABLE tbl_professores (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    area_atuacao VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100),
    matricula VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE tbl_materias (
    materia_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    carga_horaria INT NOT NULL,
    semestre INT NOT NULL,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES tbl_cursos(curso_id)
);

CREATE TABLE tbl_turmas (
    turma_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_turma VARCHAR(20) NOT NULL,
    materia_id INT,
    professor_id INT,
    periodo VARCHAR(20),
    FOREIGN KEY (materia_id) REFERENCES tbl_materias(materia_id),
    FOREIGN KEY (professor_id) REFERENCES tbl_professores(professor_id)
);

CREATE TABLE tbl_matriculas (
    matricula_id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (aluno_id) REFERENCES tbl_alunos(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES tbl_turmas(turma_id)
);
