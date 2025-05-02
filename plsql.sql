SELECT * FROM CLIENTES;
SELECT * FROM PEDIDOS;
SELECT * FROM PRODUCTOS;
SELECT * FROM TARTICULOS;
SELECT * FROM TVENTAS;

CREATE TABLE persona(
id_persona NUMBER PRIMARY KEY,
nombre_persona VARCHAR2(20),
estado_civil_persona VARCHAR2(1)
)
CREATE SEQUENCE seq_persona_idpersona --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo


INSERT INTO persona(id_persona, nombre_persona, estado_civil_persona)
VALUES(seq_persona_idpersona.nextval, 'Juan', 'S');
INSERT INTO persona(id_persona, nombre_persona, estado_civil_persona)
VALUES(seq_persona_idpersona.nextval, 'Maria', 'C');
INSERT INTO persona(id_persona, nombre_persona, estado_civil_persona)
VALUES(seq_persona_idpersona.nextval, 'Ana', 'D');
INSERT INTO persona(id_persona, nombre_persona, estado_civil_persona)
VALUES(seq_persona_idpersona.nextval, 'Luis', 'S');
INSERT INTO persona(id_persona, nombre_persona, estado_civil_persona)
VALUES(seq_persona_idpersona.nextval, 'Pepe', NULL);


SELECT * FROM PERSONA;

BEGIN
    SELECT nombre_persona,
    CASE estado_civil_persona
    WHEN 'C' THEN 'Casado/a'
    WHEN 'S' THEN 'Soltero/a'
    WHEN 'D' THEN 'Divorciado/a'
    ELSE 'Otros'
    END
    AS "Estado Civil"
    FROM persona;
END;






set SERVEROUTPUT on;

DECLARE
    v_num_empleados NUMBER(2);
BEGIN
    INSERT INTO depart VALUES (99,'PROVISIONAL',NULL);

    UPDATE emple SET dept_no = 99
    WHERE dept_no = 20;
    
    v_num_empleados := SQL % ROWCOUNT;
    
    DELETE FROM depart
    WHERE dept_no = 20;
    
    DBMS_OUTPUT.PUT_LINE (v_num_empleados || 'Empleados ubicados en PROVISIONAL') ;
    
    EXCEPTION
        WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR (-20000, 'Error en aplicación');
END;
