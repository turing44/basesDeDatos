DROP TABLE vuelo;
DROP TABLE avion;
DROP TABLE ruta;

CREATE TABLE ruta (
    cod NUMBER(3,0),
    compan VARCHAR2(3) NOT NULL,
    origen VARCHAR2(10) NOT NULL,
    destino VARCHAR2(10) NOT NULL,
    num_horas NUMBER(2,0) NOT NULL,

    CONSTRAINT pk_ruta PRIMARY KEY (cod),
    CONSTRAINT chk_compannia CHECK (compan IN ('IBE','SPA','AIR'))

);

CREATE TABLE avion (
    mat VARCHAR2(3),
    modelo VARCHAR2(3) NOT NULL,
    plazas NUMBER(3,0),
    fecha_rev DATE,

    CONSTRAINT pk_avion PRIMARY KEY (mat),
    CONSTRAINT chk_plazas CHECK (plazas BETWEEN 5 AND 300)

);

CREATE TABLE vuelo (
    cod NUMBER(3,0),
    mat VARCHAR2(3),
    ocupacion NUMBER(3,0),

    CONSTRAINT pk_ruta PRIMARY KEY (cod),
    CONSTRAINT chk_ocupacion CHECK (ocupacion <= 300)

);



ALTER TABLE vuelo ADD fecha_vuelo DATE;

ALTER TABLE vuelo MODIFY fecha_vuelo NOT NULL;

ALTER TABLE vuelo ADD CONSTRAINT fk_ruta FOREIGN KEY (cod) REFERENCES ruta (cod);

ALTER TABLE vuelo DROP PRIMARY KEY;
ALTER TABLE vuelo ADD CONSTRAINT pk_ruta PRIMARY KEY (cod, mat, fecha_vuelo);



INSERT INTO ruta 
(cod, compan, origen, destino, num_horas)
VALUES 
(111, 'IBE', 'MADRID', 'LONDRES', 3),
(222, 'IBE', 'MADRID', 'PARIS', 1),
(333, 'SPA', 'MADRID', 'BARCELONA', 1),
(444, 'AIR', 'MADRID', 'BARCELONA', 1);

INSERT INTO AVION 
(mat, modelo, plazas, fecha_rev) 
VALUES
('AAA', 'ABUS-200', 200, '2018-06-10'),
('BBB', 'ABUS-280', 280, NULL),
('CCC', 'B-747', 300, NULL),
('DDD', 'B-777', 250, '2019-10-10');

INSERT INTO VUELO 
(cod, mat, ocupacion, fecha_vuelo) 
VALUES
(111, 'BBB', 250, '2018-02-10'),
(222, 'CCC', 200, '2018-02-10'),
(333, 'AAA', 200, '2018-02-10'),
(444, 'DDD', 250, '2018-02-10'),
(333, 'AAA', 100, '2018-05-10'),
(444, 'DDD', 150, '2018-05-10'),
(333, 'AAA', 50, '2018-06-10'),
(444, 'DDD', 75, '2018-06-10');


-- 4.1
UPDATE VUELO
SET FECHA = FECHA + INTERVAL 1 DAY
WHERE FECHA = '2018-05-10';

-- 4.2 
UPDATE RUTA
SET NUM_HORAS = NUM_HORAS + 1
WHERE DESTINO = 'PARIS';

-- 4.3 No deja porque es clave primaria
INSERT INTO VUELO (COD, MAT, OCUPACIÓN, FECHA) VALUES
(111, 'EEE', 220, '2019-05-10');

INSERT INTO VUELO (COD, MAT, OCUPACIÓN, FECHA) VALUES
(111, 'BBB', 220, '2019-05-10');
