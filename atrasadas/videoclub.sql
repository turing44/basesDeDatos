DROP TABLE prestamos;
DROP TABLE socios;
DROP TABLE peliculas;



/*
1
*/

-- a
CREATE TABLE socios(
  cod_socio NUMBER(5),
  nombre VARCHAR2(50),
  fecha_nac DATE,
  localidad VARCHAR2(30),


  CONSTRAINT pk_socios PRIMARY KEY (cod_socio)
);


-- b
CREATE TABLE peliculas (
  cod_pelicula NUMBER(6),
  titulo VARCHAR2(60),
  genero VARCHAR2(20),
  nacionalidad VARCHAR2(20),


  CONSTRAINT pk_peliculas PRIMARY KEY (cod_pelicula)
);


-- c
CREATE TABLE prestamos(
  cod_socio NUMBER(5),
  cod_pelicula NUMBER(6),
  fecha_alquiler DATE,
  fecha_devolucion DATE,


  CONSTRAINT pk_prestamos PRIMARY KEY (cod_socio, cod_pelicula, fecha_alquiler),
  CONSTRAINT fk_prestamo_socio FOREIGN KEY (cod_socio) REFERENCES socios (cod_socio),
  CONSTRAINT fk_prestamo_pelicula FOREIGN KEY (cod_pelicula) REFERENCES peliculas (cod_pelicula)
);



-- d
ALTER TABLE peliculas
ADD CONSTRAINT chk_nacionalidad CHECK (
nacionalidad IN ('Francesa','Española','Alemana'));

ALTER TABLE peliculas
ADD CONSTRAINT chk_genero CHECK (
genero IN ('drama','comedia','suspense'));


-- e
ALTER TABLE prestamos ADD CONSTRAINT chk_fechas
CHECK (fecha_devolucion > fecha_alquiler);


-- f
ALTER TABLE socios ADD CONSTRAINT uq_nombre UNIQUE
(nombre);

ALTER TABLE socios
ADD CONSTRAINT chk_localidad CHECK (
localidad NOT IN ('Jaén','Córdoba'));

ALTER TABLE socios
MODIFY localidad VARCHAR2(40);



/*
2
*/


-- a
INSERT INTO socios
VALUES (1, 'ROBE', '10-10-2021', 'Huelva');
INSERT INTO socios
VALUES (2, 'DON ROBERTO', '12-12-2012', 'Cádiz');

INSERT INTO peliculas
VALUES (1, 'el club de la lucha', 'comedia', 'Española');
INSERT INTO peliculas
VALUES (2, 'interstellar', 'suspense', 'Alemana');

INSERT INTO prestamos 
VALUES (1, 2,SYSDATE,SYSDATE + 5);
INSERT INTO prestamos
VALUES (1, 1,SYSDATE,SYSDATE + 5);


-- b
UPDATE socios
SET LOCALIDAD = 'Sevilla';


-- c
DELETE prestamos 
WHERE FECHA_ALQUILER >= '01-04-2016' AND FECHA_ALQUILER < '01-05-2016';