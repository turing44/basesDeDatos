CREATE TABLE Ventas (
    TransactionID VARCHAR2(8) PRIMARY KEY,
    fecha DATE,
    CustomerID VARCHAR2(8),
    ProductID VARCHAR2(9),
    Category VARCHAR2(12),
    Quantity NUMBER(3, 0),
    Price NUMBER(5, 2),
    Total NUMBER(6, 2),
    PaymentMethod VARCHAR(15),
    StoreLocation VARCHAR2(20)
);
