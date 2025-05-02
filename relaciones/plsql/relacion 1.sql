BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola');
END;
/


DECLARE
v_num NUMBER;
BEGIN
SELECT count(*) INTO v_num
FROM emple;
DBMS_OUTPUT.PUT_LINE(v_num);
END;
/

-- Cuenta los empleados