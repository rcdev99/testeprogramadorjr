DataBase utilizado: Postgresql



CREATE TABLE Pessoa (
pes_id SERIAL,
pes_cpf varchar(11) UNIQUE NOT NULL,
pes_email varchar(30)NOT NULL,
pes_nome varchar(30)NOT NULL,
pes_isAluno boolean,
pes_isProf boolean,
CONSTRAINT Pessoa_pkey PRIMARY KEY (pes_id)
)

CREATE TABLE Professor (
pro_id SERIAL,
pes_id int,
pro_status boolean,
pro_titulacao varchar(30) NOT NULL,
CONSTRAINT Professor_pkey PRIMARY KEY (pro_id),
FOREIGN KEY(pes_id) REFERENCES Pessoa (pes_id) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Telefone (
tel_id SERIAL,
pes_id int,
tel_tipo varchar(11),
tel_numero varchar(11) NOT NULL,
CONSTRAINT Telefone_pkey PRIMARY KEY (tel_id),
FOREIGN KEY(pes_id) REFERENCES Pessoa (pes_id) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Aluno (
aln_id SERIAL,
pes_id int,
aln_curso varchar(30) NOT NULL,
aln_status boolean,
CONSTRAINT Aluno_pkey PRIMARY KEY (aln_id),
FOREIGN KEY(pes_id) REFERENCES Pessoa (pes_id) ON UPDATE CASCADE ON DELETE CASCADE
)
