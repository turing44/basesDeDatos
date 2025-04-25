DROP TABLE Cantidad_Articulo_Pedido;
DROP TABLE Pedido;
DROP TABLE Stock;
DROP TABLE Fabrica;
DROP TABLE Articulo;
DROP TABLE Cliente;


CREATE TABLE Cliente (
    num NUMBER(10),
    direcciones VARCHAR2(200),
    saldo NUMBER(20,2),
    limite_credito NUMBER(8),
    descuento NUMBER(3,2),

    CONSTRAINT pk_cliente PRIMARY KEY (num),
    CONSTRAINT chk_limite CHECK (limite_credito <= 3000000)

);

CREATE TABLE Articulo (
    id NUMBER(10),
    descripcion VARCHAR2(200),

    CONSTRAINT pk_articulo PRIMARY KEY (id)

);

CREATE TABLE Fabrica (
    id NUMBER(10),
    telf VARCHAR2(15),
    total_articulos_provistos NUMBER(5),

    CONSTRAINT pk_fabrica PRIMARY KEY (id)

);

CREATE TABLE Stock (
    articulo NUMBER(10),
    fabrica NUMBER(10),
    existencias NUMBER(10),

    CONSTRAINT fk_articulo FOREIGN KEY (articulo) REFERENCES Articulo (id),
    CONSTRAINT fk_fabrica FOREIGN KEY (fabrica) REFERENCES Fabrica (id),
    CONSTRAINT pk_stock PRIMARY KEY (articulo, fabrica)

);

CREATE TABLE Pedido (
    id NUMBER(10),
    fecha DATE,
    cliente NUMBER(10),

    CONSTRAINT pk_pedido PRIMARY KEY (id),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES Cliente (num)

);


CREATE TABLE Cantidad_Articulo_Pedido (
    articulo NUMBER(10),
    pedido NUMBER(10),
    cantidad NUMBER(10),

    CONSTRAINT fk_articulo FOREIGN KEY (articulo) REFERENCES Articulo (id),
    CONSTRAINT fk_pedido FOREIGN KEY (pedido) REFERENCES Pedido (id),
    CONSTRAINT pk_cantidad_articulo_pedido PRIMARY KEY (articulo, pedido)


);
