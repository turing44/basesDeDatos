
CREATE TABLE autor (
codigo INTEGER NOT NULL,
CONSTRAINT pk_autor PRIMARY KEY(codigo) ,
nombre VARCHAR2(50)
);

CREATE TABLE ejemplar  (
codigo INTEGER NOT NULL,
CONSTRAINT pk_ejemplar PRIMARY KEY(codigo),
localizacion VARCHAR2(50)
);

CREATE TABLE libro (
codigo INTEGER NOT NULL,
paginas NUMBER,
isbn VARCHAR2(50),
editorial VARCHAR2(50),
titulo  VARCHAR2(50),

CONSTRAINT pk_libro PRIMARY KEY(codigo)
);

CREATE TABLE autor_escribe_libro (
codigo_autor INTEGER NOT NULL,
codigo_libro INTEGER NOT NULL,
CONSTRAINT pk_autor_escribe_libro PRIMARY KEY(codigo_autor, codigo_libro),
CONSTRAINT fk_codigo_autor FOREIGN KEY (codigo_autor) REFERENCES autor (codigo),
CONSTRAINT fk_codigo_libro FOREIGN KEY (codigo_libro) REFERENCES libro (codigo)
);

CREATE TABLE usuario (
codigo INTEGER NOT NULL,
nombre VARCHAR2(50),
telefono VARCHAR2(50),
direccion VARCHAR2(50),

CONSTRAINT pk_usuario PRIMARY KEY(codigo)
);

CREATE TABLE libro_tiene_ejemplar (
codigo_libro INTEGER NOT NULL,
codigo_ejemplar INTEGER NOT NULL,

CONSTRAINT pk_libro_tiene_ejemplar PRIMARY KEY (codigo_libro, codigo_ejemplar),
CONSTRAINT fk_libro FOREIGN KEY (codigo_libro) REFERENCES libro (codigo),
CONSTRAINT fk_ejemplar FOREIGN KEY (codigo_ejemplar) REFERENCES ejemplar (codigo)

);


CREATE TABLE usuario_saca_ejemplar (
fecha_devolucion DATE,
fecha_prestamo DATE,
codigo_usuario INTEGER NOT NULL,
codigo_ejemplar INTEGER NOT NULL,

CONSTRAINT pk_usuario_saca_ejemplar PRIMARY KEY(fecha_prestamo, codigo_usuario, codigo_ejemplar),
CONSTRAINT fk_codigo_usuario FOREIGN KEY (codigo_usuario) REFERENCES usuario (codigo),
CONSTRAINT fk_codigo_ejemplar FOREIGN KEY (codigo_ejemplar) REFERENCES ejemplar (codigo)

);

