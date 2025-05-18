
-- 1
DECLARE
CURSOR cursor_emple(departamento NUMBER) IS
    SELECT apellido FROM emple WHERE dept_no = departamento ORDER BY apellido;
BEGIN
    FOR registro IN cursor_emple(20) LOOP
        DBMS_OUTPUT.PUT_LINE(registro.apellido);
    END LOOP;
END;
/


-- 3
DECLARE
CURSOR cursor_emple IS
    SELECT apellido, fecha_alt FROM emple ORDER BY fecha_alt;
BEGIN
    FOR registro IN cursor_emple LOOP
        DBMS_OUTPUT.PUT_LINE(registro.apellido || ' ' || registro.fecha_alt);
    END LOOP;
END;
/

DECLARE 
CURSOR cursor_emple IS
    SELECT apellido, fecha_alt FROM emple ORDER BY fecha_alt;
v_apellido emple.apellido%TYPE;
v_fecha emple.FECHA_ALT%TYPE;
BEGIN
    OPEN cursor_emple;

    FETCH cursor_emple INTO v_apellido, v_fecha;
    WHILE cursor_emple%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_apellido || ' ' || v_fecha);
        FETCH cursor_emple INTO v_apellido, v_fecha;
        
    END LOOP;

    CLOSE cursor_emple;

END;
/


SELECT * FROM emple WHERE dept_no = &numero_depto;




select APELLIDO, FECHA_ALT from emple order by FECHA_ALT;

