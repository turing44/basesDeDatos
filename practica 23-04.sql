-- 1 
DROP TABLE CIENTES;

-- 2
CREATE TABLE CLIENTES (
    NOMBRE VARCHAR2(40),
    DOCUMENTO CHAR(8),
    DOMICILIO VARCHAR2(30),
    CIUDAD VARCHAR2(30)
);

-- 3
INSERT INTO CLIENTES VALUES 
('Juan Perez', '22222', 'Colon 1123', 'Cordoba');
INSERT INTO CLIENTES VALUES 
('Katrina Lopez', '23333', 'San Martin 254', 'Cordoba');
INSERT INTO CLIENTES VALUES 
('Luis Garcia', '244444', 'Caseros 345', 'Cordoba');
INSERT INTO CLIENTES VALUES 
('Marcos Gonzalez', '55555', 'Sucre 458', 'Santa Fe');
INSERT INTO CLIENTES VALUES 
('Nora Torres', '26666', 'Bulnes 567', 'Santa Fe');
INSERT INTO CLIENTES VALUES 
('Oscar Luque', '27777', 'San Martin 786', 'Santa Fe');
INSERT INTO CLIENTES VALUES 
('Pedro Perez', '28888', 'Colon 234', 'Buenos Aires');
INSERT INTO CLIENTES VALUES 
('Rosa Rodriguez', '299999', 'Avellaneda 23', 'Buenos Aires');



-- 4
CREATE OR REPLACE VIEW VISTA_CLIENTES AS
SELECT NOMBRE, CIUDAD
FROM CLIENTES 
WHERE CIUDAD NOT LIKE 'Cordoba';


-- 5
CREATE OR REPLACE VIEW VISTA_CLIENTES2 AS
SELECT NOMBRE, CIUDAD
FROM CLIENTES 
WHERE CIUDAD NOT LIKE 'Cordoba'
WITH CHECK OPTION;


-- 6
SELECT * from VISTA_CLIENTES;

SELECT * from VISTA_CLIENTES2;

-- 7
UPDATE VISTA_CLIENTES2 
SET CIUDAD = 'Cordoba'
WHERE NOMBRE LIKE 'Pedro Perez';

-- 8
UPDATE VISTA_CLIENTES
SET CIUDAD = 'Cordoba'
WHERE NOMBRE LIKE 'Pedro Perez';

-- 9
UPDATE VISTA_CLIENTES2 
SET CIUDAD = 'Buenos Aires'
WHERE NOMBRE LIKE 'Oscar Luque';


-- 10
SELECT * FROM CLIENTES
WHERE NOMBRE LIKE 'Oscar Luque';


-- 11
INSERT INTO VISTA_CLIENTES2
VALUES ('Robe', 'Cordoba');


-- 12
INSERT INTO VISTA_CLIENTES
VALUES ('Robe', 'Cordoba');


-- 13
INSERT INTO VISTA_CLIENTES2
VALUES ('Robe', 'Salta');


-- 14
SELECT * FROM VISTA_CLIENTES2 
WHERE 
NOMBRE LIKE 'Robe' AND CIUDAD LIKE 'Salta';


