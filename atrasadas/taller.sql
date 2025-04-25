DROP TABLE trabajos;
DROP TABLE mecanicos;
DROP TABLE coches;




-- a

CREATE TABLE coches(
  mat VARCHAR2(8),
  marca VARCHAR2(15),
  an_fab NUMBER(2),

  CONSTRAINT pk_coches PRIMARY KEY (mat)
);


CREATE TABLE mecanicos(
  dni VARCHAR2(9),
  nombre VARCHAR2(15),
  puesto VARCHAR2(15),
  parcial CHAR(1),


  CONSTRAINT pk_mecanicos PRIMARY KEY (dni)
);

CREATE TABLE trabajos(
  mat VARCHAR2(8),
  dni VARCHAR2(9),
  horas NUMBER(3,1),
  fecha_rep DATE,

  CONSTRAINT fk_trabajos_coche FOREIGN KEY (mat) REFERENCES coches (mat),
  CONSTRAINT chk_horas CHECK (horas > 0.5)
);



-- b

ALTER TABLE coches ADD modelo VARCHAR2(15);

ALTER TABLE trabajos ADD CONSTRAINT pk_trabajos PRIMARY KEY (mat, dni);

ALTER TABLE trabajos ADD CONSTRAINT fk_trabajos_mecanicos FOREIGN KEY (dni) REFERENCES mecanicos (dni);

ALTER TABLE coches MODIFY an_fab NUMBER(4);