DROP TABLE empleados;
DROP TABLE departamento;

CREATE TABLE departamento (
    clave NUMBER,
    nombre VARCHAR2(30),
    presupuesto NUMBER,

    CONSTRAINT pk_departamento PRIMARY KEY (clave)
);


CREATE TABLE empleados (
    clave VARCHAR2(8),
    nombre VARCHAR2(30),
    apellidos VARCHAR2(30),
    clave_dpto NUMBER,

    CONSTRAINT pk_empleados PRIMARY KEY (clave),
    CONSTRAINT fk_dpto FOREIGN KEY (clave_dpto) REFERENCES departamento (clave)
);



INSERT INTO departamento VALUES (1, 'Personal', 80000);
INSERT INTO departamento VALUES (2, 'Almacen', 70000);
INSERT INTO departamento VALUES (3, 'Contabilidad', 60000);
INSERT INTO departamento VALUES (4, 'Manufactura', 50000);
INSERT INTO departamento VALUES (5, 'Empaque', 30000);


INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP01', 'Armando', 'López', 2);
INSERT INTO empleados (clave_empleado, nombre, apellidos, clave_depto) VALUES
('EMP02', 'Tatiana', 'Vargas', 1);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP03', 'Laura', 'Iturria', 3);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP04', 'Juan', 'Pérez', 4);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP05', 'Iván', 'López', 4);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP06', 'Margarita', 'Hernández', 1);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP07', 'Jesús', 'Pérez', 3);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP08', 'Tonatiuh', 'Flores', 2);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP09', 'Juan', 'López', 4);
INSERT INTO empleados (clave, nombre, apellidos, clave_depto) VALUES
('EMP10', 'José', 'Hernández', 5);