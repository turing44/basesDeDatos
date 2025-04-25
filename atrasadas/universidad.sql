DROP TABLE preinscripcion;
DROP TABLE estudio;
DROP TABLE alumno;



CREATE TABLE alumno(
    dni VARCHAR2(9) CONSTRAINT pk_alumno PRIMARY KEY,
    nombre VARCHAR2(50),
    nota NUMBER (4,2),
    opcion VARCHAR2(1),

    CONSTRAINT ck_opcion CHECK (opcion IN ('A','B','C','D'))
);


CREATE TABLE estudio(
    codigo NUMBER (2) CONSTRAINT pk_estudio PRIMARY KEY,
    nombre VARCHAR2(50),
    nota_corte NUMBER (4,2),

    CONSTRAINT ck_nota_corte CHECK (nota_corte > 5)
);


CREATE TABLE preinscripcion(
    dni VARCHAR2(9),
    codigo NUMBER (2),
    orden NUMBER(1),
    admitido  VARCHAR2(1),

    CONSTRAINT pk_preinscripcion PRIMARY KEY (dni, codigo),
    CONSTRAINT fk_preinscripcion_alumno FOREIGN KEY (dni) REFERENCES alumno (dni),
    CONSTRAINT fk_preinscripcion_estudio FOREIGN KEY (codigo) REFERENCES estudio (codigo),
    CONSTRAINT chk_admitido CHECK (admitido IN ('S','N'))
);