SET SERVEROUTPUT ON;

DECLARE
    v_num_empleados NUMBER ( 2 ) ;
BEGIN
    INSERT INTO depart VALUES (99,'PROVISIONAL',NULL) ;
    UPDATE emple SET dept_no = 99
    WHERE dept_no = 20;
    v_num_empleados : = SQL%ROWCOUNT;
    DELETE FROM depart
    WHERE dept_no = 20;
    DBMS_OUTPUT.PUT_LINE (v_num_empleados ||
    'Empleados ubicados en PROVISIONAL' ) ;
EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR (-20000, 'Error en aplicación');
END;