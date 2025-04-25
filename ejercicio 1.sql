 CREATE TABLE coche (
    mat VARCHAR2(8) UNIQUE NOT NULL,
    marca VARCHAR2(15),
    an_fab NUMBER(2,0),

    CONSTRAINT pk_coche PRIMARY KEY (mat)
);

CREATE TABLE mecanico (
    dni VARCHAR2(9) UNIQUE NOT NULL,
    nombre VARCHAR2(15),
    puesto VARCHAR2(15),
    parcial CHAR,

    CONSTRAINT pk_mecanico PRIMARY KEY (dni)
);

CREATE TABLE trabajo (
    mat VARCHAR2(8),
    dni VARCHAR2(9),
    horas NUMBER(3, 1),
    fecha_rep DATE,

    CONSTRAINT fk_mat FOREIGN KEY (mat) REFERENCES coche (mat), 
    CONSTRAINT chk_horas CHECK (horas > 0.5)
);

ALTER TABLE coche ADD modelo VARCHAR2(15);
ALTER TABLE trabajo ADD CONSTRAINT pk_trabajo PRIMARY KEY (mat, dni);
ALTER TABLE trabajo ADD CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES mecanico (dni);
ALTER TABLE coche MODIFY COLUMN an_fab NUMBER(4, 0);

