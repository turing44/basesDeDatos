
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

-- 2
DECLARE
    CURSOR cursor_emple (numero NUMBER) IS
        SELECT APELLIDO FROM EMPLE WHERE DEPT_NO = numero;
    registro_empleado cursor_emple%ROWTYPE;
BEGIN 
    OPEN cursor_emple(&num);
    LOOP
        FETCH cursor_emple INTO registro_empleado;
        EXIT WHEN cursor_emple%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(registro_empleado.apellido);
    END LOOP;

    CLOSE cursor_emple;
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


-- 4

CREATE OR REPLACE PROCEDURE incrementarSalario(empleado IN NUMBER, incremento IN NUMBER)
IS
    SALARIO_NULO EXCEPTION;
    salario EMPLE.SALARIO%TYPE;
BEGIN
    SELECT SALARIO INTO salario FROM EMPLE WHERE EMP_NO = empleado;
    IF salario IS NULL THEN 
        RAISE SALARIO_NULO;
    END IF;

    UPDATE EMPLE SET SALARIO = SALARIO + incremento WHERE EMP_NO = empleado;

    DBMS_OUTPUT.PUT_LINE('Salario incrementado');
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No exise el usuario');
    WHEN SALARIO_NULO THEN
        DBMS_OUTPUT.PUT_LINE('Salario nulo');
END;
/ 



EXECUTE INCREMENTARSALARIO(7369, 300);


-- 5
DECLARE
    palabra VARCHAR2(10) := ' ';

    err_blancos EXCEPTION;
    no_hay_espacio EXCEPTION;
    PRAGMA EXCEPTION_INIT(no_hay_espacio, -1547);
    
BEGIN
    IF NOT palabra LIKE '% %' THEN
        RAISE no_hay_espacio;
    END IF;

    IF TRIM(palabra) = '' THEN
        RAISE err_blancos;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Palabra correcta.');
EXCEPTION
    WHEN no_hay_espacio THEN
    DBMS_OUTPUT.PUT_LINE('no hay espacio en la palabra');
    WHEN err_blancos THEN
    DBMS_OUTPUT.PUT_LINE('palabra en blanco');


END;
/


CREATE OR REPLACE PROCEDURE lanza_error(empleado IN NUMBER)
IS
    SALARIO_NULO EXCEPTION;
    salario EMPLE.SALARIO%TYPE;
BEGIN
    SELECT SALARIO INTO salario FROM EMPLE WHERE EMP_NO = empleado;

    IF salario IS NULL THEN 
        RAISE SALARIO_NULO;
    END IF;

    UPDATE EMPLE 
    SET SALARIO = SALARIO + 30 
    WHERE EMP_NO = empleado;

    DBMS_OUTPUT.PUT_LINE('Salario incrementado');

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-202020, 'No existe el usuario');

    WHEN SALARIO_NULO THEN
        RAISE_APPLICATION_ERROR(-20222, 'Error: el salario es NULL');
END;

BEGIN
    lanza_error(7369); -- Ajusta el ID según tu tabla EMPLE
END;



ROLLBACK;