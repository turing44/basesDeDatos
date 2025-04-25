DROP TABLE Prestamo;
DROP TABLE Socio;
DROP TABLE Libro;

CREATE TABLE Libro (
    isbn NUMBER(20),
    titulo VARCHAR2(50),
    editorial VARCHAR2(50),
    paginas NUMBER(5),
    
    CONSTRAINT pk_libro PRIMARY KEY (isbn)

);

CREATE TABLE Socio (
    dni VARCHAR2(10),
    nombre VARCHAR2(50),
    fecha_nacimiento DATE,
    provincia VARCHAR2(10) DEFAULT 'Almeria',
    
    CONSTRAINT pk_socio PRIMARY KEY (dni),
    CONSTRAINT chk_mayoria_edad CHECK (fecha_nacimiento <= SYSDATE - (18 * 365)), -- Lo he pensado yo, no chatgpt

    /*
    d. La provincia por defecto del socio será Almería, Córdoba, Málaga o Granada.
    
    de aqui entiendo que la provincia por defecto es almeria, y que las demas son las que estan permitidas
    (porque no se pueden tener varias provincias predeterminadas) :)
    */
    CONSTRAINT provincias_permitidas CHECK (provincia IN ('Almeria', 'Cordoba', 'Malaga', 'Granada'))

);

CREATE TABLE Prestamos (
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    devuelto VARCHAR2(1),
    isbn NUMBER(20),
    socio VARCHAR2(10),

    CONSTRAINT chk_coherencia_fecha CHECK (fecha_devolucion > fecha_prestamo),
    CONSTRAINT pk_prestamos PRIMARY KEY (isbn, socio),
    CONSTRAINT fk_libro FOREIGN KEY (isbn) REFERENCES Libro (isbn),
    CONSTRAINT fk_socio FOREIGN KEY (socio) REFERENCES Socio (dni),
    CONSTRAINT chk_devuelto CHECK (devuelto IN ('S', 'N'))

);



INSERT INTO Libro (isbn, titulo, editorial, paginas) 
VALUES 
(478123890, 'un mundo feliz', 'Editorial ABC', 200),
(9789865430, 'la caida', 'Editorial XYZ', 100);


INSERT INTO Socio (dni, nombre, fecha_nacimiento, provincia) VALUES ('12345678A', 'Turing', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Cordoba');

INSERT INTO Socio (dni, nombre, fecha_nacimiento) VALUES ('87654321B', 'Robe', TO_DATE('1934-03-10', 'YYYY-MM-DD')); 
