DROP TABLE empleados;
DROP TABLE departamentos;



-- 1
CREATE TABLE departamentos (
    cod_departamento NUMBER(2) CONSTRAINT pk_dpto PRIMARY KEY,
    nombre VARCHAR2(30),
    presupuesto NUMBER(8,2)
);


CREATE TABLE empleados (
    clave_empleado VARCHAR2(8),
    nombre VARCHAR2(30),
    apellidos VARCHAR2(50),
    cod_departamento NUMBER(2),

    CONSTRAINT pk_emple PRIMARY KEY (clave_empleado),
    CONSTRAINT fk_emple_dpto FOREIGN KEY (cod_departamento) REFERENCES departamentos (cod_departamento)
);



-- 2



INSERT INTO departamentos VALUES (1, 'Personal',80000);
INSERT INTO departamentos VALUES (2, 'Almacén',70000);
INSERT INTO departamentos VALUES (3, 'Contabilidad',60000);
INSERT INTO departamentos VALUES (4, 'Manufactura',50000);
INSERT INTO departamentos VALUES (5, 'Empaque',30000);


INSERT INTO empleados VALUES ('emp01', 'Armando','López',2);
INSERT INTO empleados VALUES ('emp02', 'Tatiana','Vargas',1);
INSERT INTO empleados VALUES ('emp03', 'Laura','Iturria',3);
INSERT INTO empleados VALUES ('emp04', 'Pérez','Pérez',4);
INSERT INTO empleados VALUES ('emp05', 'Iván','López',4);
INSERT INTO empleados VALUES ('emp06', 'Margarita','Hernández',1);
INSERT INTO empleados VALUES ('emp07', 'Jesús','Pérez',3);
INSERT INTO empleados VALUES ('emp08', 'Tonatiuh','Flores',2);
INSERT INTO empleados VALUES ('emp09', 'Juan','López',4);
INSERT INTO empleados VALUES ('emp10', 'José','Hernández',5);