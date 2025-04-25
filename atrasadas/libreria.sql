DROP TABLE prestamo;
DROP TABLE usuario;
DROP TABLE  libro;
DROP TABLE clase;



CREATE TABLE clase(
  clave NUMBER(9),
  tiempo_de_prestamo NUMBER(5),

  CONSTRAINT pk_clase PRIMARY KEY (clave)
);



CREATE TABLE libro(
  codigo NUMBER(3),
  autor VARCHAR2(30),
  titulo VARCHAR2(30),
  editor VARCHAR2(30),
  clase NUMBER(9),
  prestado NUMBER(1) DEFAULT(1),


  CONSTRAINT pk_libro PRIMARY KEY (codigo),
  CONSTRAINT fk_libro_clase FOREIGN KEY (clase) REFERENCES clase (clave)
);



CREATE TABLE usuario(
  secuencia NUMBER(3),
  nombre VARCHAR2(50),
  direccion VARCHAR2(50),
  fecha_ingreso DATE NOT NULL,

  CONSTRAINT pk_usuario PRIMARY KEY (secuencia)
);



CREATE TABLE prestamo(
  codigo NUMBER(3),
  secuencia NUMBER(3),
  fecha_inicio DATE,


  CONSTRAINT pk_prestamo PRIMARY KEY (codigo, secuencia, fecha_inicio),
  CONSTRAINT fk_prestamo_libro FOREIGN KEY (codigo) REFERENCES libro (codigo),
  CONSTRAINT fk_prestamo_usuario FOREIGN KEY (secuencia) REFERENCES usuario (secuencia)
);




-- a
ALTER TABLE usuario ADD sexo CHAR(1);

-- b
ALTER TABLE libro ADD indice NUMBER(2);