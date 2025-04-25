CREATE TABLE aula (
idAula INTEGER NOT NULL,
nomAula VARCHAR2(50),
ubicacion VARCHAR2(50),
capacidad NUMBER,

CONSTRAINT pk_aula PRIMARY KEY (idAula)

);

CREATE TABLE estudiante (
idEstudiante INTEGER NOT NULL,
nomEstudiante VARCHAR2(50),
apeEstudiante VARCHAR2(50),
estrato VARCHAR2(50),

CONSTRAINT pk_estudiante PRIMARY KEY (idEstudiante)
);


CREATE TABLE docente (
idDocente INTEGER NOT NULL,
nomDocente VARCHAR2(50),
apeDocente VARCHAR2(50),
titulo VARCHAR2(50),

CONSTRAINT pk_docente PRIMARY KEY (idDocente)
);



CREATE TABLE asignatura (
idAsignatura INTEGER NOT NULL,
nomAsignatura VARCHAR2(50),
IH VARCHAR2(50),

CONSTRAINT pk_asignatura PRIMARY KEY (idAsignatura)
);


CREATE TABLE grupo (
idGrupo INTEGER NOT NULL,
nomGrupo VARCHAR2(50),
apeGrupo VARCHAR2(50),
numEstudiantes NUMBER,

docente_titular INTEGER NOT NULL,


CONSTRAINT pk_grupo PRIMARY KEY (idGrupo),
CONSTRAINT fk_docente_titular FOREIGN KEY (docente_titular) REFERENCES docente (idDocente)

);

CREATE TABLE grupo_tiene_asignaturas (
grupo INTEGER NOT NULL,
asignatura INTEGER NOT NULL,

CONSTRAINT pk_grupo_tiene_asignaturas PRIMARY KEY (grupo, asignatura),
CONSTRAINT fk_grupo FOREIGN KEY (grupo) REFERENCES grupo (idGrupo),
CONSTRAINT fk_asignatura FOREIGN KEY (asignatura) REFERENCES asignatura (idAsignatura)

);

CREATE TABLE horario (
aula INTEGER NOT NULL,
asignatura INTEGER NOT NULL,

horaInicio DATE,
horaFin DATE,
dia DATE,

CONSTRAINT pk_horario PRIMARY KEY (aula, asignatura, dia, horaInicio, horaFin),
CONSTRAINT fk_aula FOREIGN KEY (aula) REFERENCES aula (idAula),
CONSTRAINT fk_asignatura FOREIGN KEY (asignatura) REFERENCES asignatura (idAsignatura)

);


CREATE TABLE matricula (
estudiante INTEGER NOT NULL,
asignatura INTEGER NOT NULL,
notaDef NUMBER,

CONSTRAINT pk_matricula PRIMARY KEY (estudiante, asignatura),
CONSTRAINT fk_estudiante FOREIGN KEY (estudiante) REFERENCES estudiante (idEstudiante),
CONSTRAINT fk_asignatura FOREIGN KEY (asignatura) REFERENCES asignatura (idAsignatura)

);


CREATE TABLE imparte (
docente INTEGER NOT NULL,
asignatura INTEGER NOT NULL,
fechaAsignacion DATE,

CONSTRAINT pk_imparte PRIMARY KEY (docente, asignatura),
CONSTRAINT fk_docente FOREIGN KEY (docente) REFERENCES docente (idDocente),
CONSTRAINT fk_asignatura FOREIGN KEY (asignatura) REFERENCES asignatura (idAsignatura)

);

