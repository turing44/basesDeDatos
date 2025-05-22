
-- 1
DECLARE
    nombre_departamento CONSTANT dept.DNAME%TYPE := 'ACCOUNTING';

    numero_departamento dept.DEPTNO%TYPE;
    total_empleados NUMBER;
BEGIN 
    SELECT deptno INTO numero_departamento
    FROM dept 
    WHERE dname = nombre_departamento;

    SELECT COUNT(EMPNO) INTO total_empleados
    FROM EMP 
    WHERE deptno = numero_departamento; 

    DBMS_OUTPUT.PUT_LINE('En el departamento ' || nombre_departamento || ' hay ' || total_empleados || ' empleados.');
    
END;
/


-- 2

DECLARE
    nombre_depart_contabilidad  CONSTANT dept.DNAME%TYPE := 'ACCOUNTING';
    nombre_depart_ventas        CONSTANT dept.DNAME%TYPE := 'SALES';

    numero_depart_contabilidad  dept.DEPTNO%TYPE;
    numero_depart_ventas        dept.DEPTNO%TYPE;
    
    salario_medio_ventas         NUMBER;
    salario_medio_contabilidad   NUMBER;
    diferencia                   NUMBER;

BEGIN 
    SELECT deptno INTO numero_depart_contabilidad
    FROM dept 
    WHERE dname = nombre_depart_contabilidad;

    SELECT deptno INTO numero_depart_ventas
    FROM dept 
    WHERE dname = nombre_depart_ventas;



    SELECT AVG(SAL) INTO salario_medio_contabilidad
    FROM EMP 
    WHERE deptno = numero_depart_contabilidad; 
    
    SELECT AVG(SAL) INTO salario_medio_ventas
    FROM EMP 
    WHERE deptno = numero_depart_ventas; 


    diferencia := salario_medio_contabilidad - salario_medio_ventas;

    DBMS_OUTPUT.PUT_LINE('En el departamento ' || nombre_depart_contabilidad || ' el salario medio es:' || TO_CHAR (salario_medio_contabilidad, '9G999D99') );
    DBMS_OUTPUT.PUT_LINE('En el departamento ' || nombre_depart_ventas || ' el salario medio es:' || TO_CHAR (salario_medio_ventas, '9G999D99'));
    DBMS_OUTPUT.PUT_LINE('Y la diferencia entre los dos es de ' || diferencia || ' euros');

END;
/


-- 3
DECLARE 
    salario_mas_alto emp.SAL%TYPE;
    numero_empleado emp.EMPNO%TYPE;
BEGIN
    SELECT MAX(sal) INTO salario_mas_alto FROM EMP;
    SELECT empno into numero_empleado from emp where sal = salario_mas_alto; 

    DBMS_OUTPUT.PUT_LINE('El salario más alto lo tiene el empleado numero: ' || numero_empleado);
END;
/

-- 4
update emp set sal = 9500 where job = 'PRESIDENT';

CREATE OR REPLACE PROCEDURE
salario_emp(numero_emp IN NUMBER)
IS
    salario emp.SAL%TYPE;
BEGIN
    SELECT sal INTO salario
    FROM EMP
    WHERE empno = numero_emp;

    IF salario > 9000 THEN
        DBMS_OUTPUT.PUT_LINE('ITS OVER 9000!!!!');
    END IF;
END;
/
        
EXECUTE salario_emp(7839);


-- 5

CREATE OR REPLACE PROCEDURE
mismo_trabajo(emp1 IN NUMBER, emp2 IN NUMBER, emp3 IN NUMBER)
IS
    trabajo1 emp.JOB%TYPE;
    trabajo2 emp.JOB%TYPE;
    trabajo3 emp.JOB%TYPE;
BEGIN

    SELECT job INTO trabajo1
    FROM EMP
    WHERE empno = emp1;

    SELECT job INTO trabajo2
    FROM EMP
    WHERE empno = emp2;

    SELECT job INTO trabajo3
    FROM EMP
    WHERE empno = emp3;


    IF trabajo1 = trabajo2 AND trabajo2 = trabajo3 THEN
        DBMS_OUTPUT.PUT_LINE('Los 3 trabajos son iguales');
    ELSIF trabajo1 = trabajo2 THEN
        DBMS_OUTPUT.PUT_LINE(emp1 || ' y ' || emp2 || ' tienen el mismo trabajo.');
    ELSIF trabajo2 = trabajo3 THEN
        DBMS_OUTPUT.PUT_LINE(emp2 || ' y ' || emp3 || ' tienen el mismo trabajo.');
    ELSIF trabajo1 = trabajo3 THEN
        DBMS_OUTPUT.PUT_LINE(emp1 || ' y ' || emp3 || ' tienen el mismo trabajo.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Los 3 trabajos son diferentes');
    END IF;
    

END;
/
        
select empno, job from emp order by job;

EXECUTE mismo_trabajo(7839, 7698, 7900);



-- 6
DECLARE
    nombre CONSTANT emp.ENAME%TYPE := 'ALLEN';
    trabajo emp.JOB%TYPE;
    trabajo_en_espannol VARCHAR2(100);
BEGIN
    SELECT job INTO trabajo 
    FROM emp
    WHERE ename = nombre;

    CASE trabajo
      WHEN 'CLERK' THEN trabajo_en_espannol:='RECEPCIONISTA';
      WHEN 'SALESMAN' THEN trabajo_en_espannol:='VENDEDOR';
      WHEN 'MANAGER' THEN trabajo_en_espannol:='MANAGER';
      WHEN 'ANALYST' THEN trabajo_en_espannol:='ANALISTA';
      WHEN 'PRESIDENT' THEN trabajo_en_espannol:='PRESIDENTE';
      ELSE trabajo_en_espannol:='OTRO';
    END CASE;

    DBMS_OUTPUT.PUT_LINE(nombre || ' es ' || trabajo_en_espannol);
END;


-- 7

DECLARE
    CURSOR c_depart IS
        SELECT DEPTNO, COUNT(*) as empleados
        FROM EMP 
        group by deptno;
    fila c_depart%ROWTYPE;
BEGIN
    OPEN c_depart;
    LOOP
        FETCH c_depart INTO fila;
        EXIT WHEN c_depart%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('En el departamento numero ' || fila.deptno || ' hay ' || fila.empleados || ' empleados');
    END LOOP;

    CLOSE c_depart;

END;
/

-- 7 v2
BEGIN 
    FOR fila IN (
        SELECT DEPTNO, COUNT(*) as empleados
        FROM EMP 
        group by deptno
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('En el departamento numero ' || fila.deptno || ' hay ' || fila.empleados || ' empleados');
    END LOOP;
END;
/


SELECT DEPTNO, COUNT(*) FROM EMP 
group by deptno;