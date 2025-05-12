SET SERVEROUTPUT ON;

--1 
DECLARE
    v_num NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_num from emple;
    DBMS_OUTPUT.PUT_LINE(v_num);
END;


-- 2
CREATE OR REPLACE
FUNCTION suma(n1 NUMBER, n2 NUMBER)
RETURN NUMBER
IS
total NUMBER;
BEGIN
    total := n1 + n2;
    DBMS_OUTPUT.PUT_LINE(total);
    RETURN total;
END;

BEGIN
    EXECUTE(suma(3,5));
END;

-- 3
CREATE OR REPLACE
PROCEDURE INFO_EMP(emp_no in NUMBER)
IS 
    ape VARCHAR2;
    SAL NUMBER;
BEGIN
    SELECT APELLIDO INTO APE, SALARIO INTO SAL
    FROM EMPLE 
    WHERE emp_no = numero_empleado;

    DBMS_OUTPUT.PUT_LINE(APE);
    DBMS_OUTPUT.PUT_LINE(SAL);
END;

-- 4
CREATE OR REPLACE
PROCEDURE DATOS_EMPLE(numero_empleado NUMBER)
IS
    ape VARCHAR2;
    SAL NUMBER;
BEGIN
    SELECT APELLIDO INTO APE, SALARIO INTO SAL
    FROM EMPLE 
    WHERE emp_no = numero_empleado;

    DBMS_OUTPUT.PUT_LINE(APE);
    DBMS_OUTPUT.PUT_LINE(SAL);
END;




-- 5
CREATE OR REPLACE
FUNCTION salario_medio(numero_departamento NUMBER)
RETURN NUMBER
IS
media NUMBER;
BEGIN
    SELECT avg(salario) INTO media from emple
    group by dept_no
    having dept_no = numero_departamento;
    
    RETURN media;
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE(salario_medio(30));
END;


