
-- 1
SELECT d.DNOMBRE as Departamento
FROM emple e
INNER JOIN depart d 
ON e.DEPT_NO = d.DEPT_NO
GROUP BY d.DNOMBRE
HAVING AVG(e.salario) >= (SELECT AVG(salario) FROM emple);

-- 2
SELECT dnombre
from DEPART
where DEPT_NO IN (
    SELECT dept_no
    from EMPLE
    GROUP by DEPT_NO
    HAVING COUNT(DEPT_NO) > 4
);


-- 3
SELECT d.dept_no, dnombre, count(*) -- al poner contar todo me cuenta tambien los null
FROM emple e, depart d
WHERE e.dept_no (+) = d.dept_no
GROUP BY d.dept_no, dnombre;

SELECT e.dept_no, d.dnombre, count(e.emp_no) -- da error, para que funcioone habria que hacerlo como en el ejemplo de abajo con join
FROM emple e, depart d
WHERE e.dept_no (+)= d.dept_no
GROUP BY d.dept_no, dnombre;



SELECT d.dept_no, dnombre, count(e.emp_no)
FROM emple e
right join DEPART d 
on e.DEPT_NO = d.DEPT_NO
GROUP BY d.dept_no, dnombre;



-- 4
SELECT nombre
from ALUM
where nombre IN (
    SELECT NOMBRE
    FROM ANTIGUOS
);


-- 5
SELECT nombre
from ALUM
where nombre IN (
    SELECT NOMBRE
    FROM ANTIGUOS
) or nombre IN (
    SELECT NOMBRE
    FROM NUEVOS
);


-- 6
SELECT OFICIO, sum(SALARIO) 
from emple
where DEPT_NO = (
    SELECT DEPT_NO 
    from DEPART
    where DNOMBRE LIKE 'VENTAS'
    )
GROUP by OFICIO;


-- 7
select e1.apellido
from EMPLE e1
where SALARIO IN (
    select avg(SALARIO)
    from emple e2
    where e1.DEPT_NO = e2.DEPT_NO
    GROUP BY e1.DEPT_NO
);

SELECT * FROM EMPLE;


-- 8
SELECT COUNT(*)
FROM EMPLE
WHERE OFICIO LIKE 'EMPLEADO'
GROUP BY DEPT_NO;


-- 9
select d.dnombre
from emple e
INNER JOIN depart d
on d.DEPT_NO = e.DEPT_NO
where e.OFICIO like 'EMPLEADO'
GROUP BY d.DNOMBRE
HAVING count(*) = (
    SELECT max(count(*))
    from emple 
    where oficio like 'EMPLEADO'
    GROUP BY DEPT_NO
);



-- 10
SELECT DEPT_NO, dnombre 
from DEPART
where DNOMBRE = (

    select d.dnombre
    from emple e
    INNER JOIN depart d
    on d.DEPT_NO = e.DEPT_NO
    where e.OFICIO like 'EMPLEADO'
    GROUP BY d.DNOMBRE
    HAVING count(*) = 
    (
        SELECT max(count(*))
        from emple 
        where oficio like 'EMPLEADO'
        GROUP BY DEPT_NO
    )
);

select to_char(avg(SALARIO) *999, '99G999G999D99') as salario
from EMPLE;

-- 11
SELECT DEPT_NO
from emple 
GROUP by DEPT_NO, oficio
HAVING count(*) > 2;


-- 12
SELECT a.NOMBRE
FROM ALUM a
JOIN ANTIGUOS ant ON a.NOMBRE = ant.NOMBRE
JOIN NUEVOS n ON n.NOMBRE = a.NOMBRE;

-- 13
SELECT NOMBRE
FROM ALUM 
WHERE NOMBRE IN (
    SELECT NOMBRE 
    FROM ANTIGUOS
) AND
NOMBRE IN (
    SELECT NOMBRE 
    FROM NUEVOS
);

-- 14
SELECT NOMBRE FROM ALUM
MINUS
(SELECT NOMBRE FROM NUEVOS
UNION
SELECT NOMBRE FROM ANTIGUOS);




-- 15

SELECT 
    c.NOMBRE AS NOMBRE_CENTRO,
    e.ESPECIALIDAD,
    COUNT(p.DNI) AS NUM_PROFESORES
FROM
    CENTROS c
CROSS JOIN
    (SELECT DISTINCT ESPECIALIDAD FROM PROFESORES) e
LEFT JOIN
    PROFESORES p ON p.COD_CENTRO = c.COD_CENTRO AND p.ESPECIALIDAD = e.ESPECIALIDAD
GROUP BY
    c.NOMBRE, e.ESPECIALIDAD
ORDER BY
    NUM_PROFESORES DESC;


-- 16
SELECT c.NOMBRE, count(p.DNI)
FROM CENTROS c
LEFT JOIN PERSONAL p ON c.COD_CENTRO = p.COD_CENTRO
GROUP BY c.NOMBRE
ORDER BY c.NOMBRE DESC;

-- 17
SELECT ESPECIALIDAD 
FROM PROFESORES
GROUP BY ESPECIALIDAD
HAVING COUNT(*) = (
    SELECT MIN(COUNT(*))
    FROM PROFESORES
    GROUP BY ESPECIALIDAD
);


SELECT ESPECIALIDAD
FROM (
    SELECT ESPECIALIDAD, COUNT(*)
    FROM PROFESORES
    GROUP BY ESPECIALIDAD
    ORDER BY COUNT(*)
)
WHERE ROWNUM = 1;


-- 18
SELECT b.NOMBRE_BANC, count(*) AS NUMERO_SUCURSALES
from SUCURSALES s
join bancos b
on b.COD_BANCO = s.COD_BANCO
GROUP by b.NOMBRE_BANC
ORDER BY COUNT(*) DESC;


-- 19
SELECT SUM(SALDO_DEBE), SUM(SALDO_HABER)
FROM CUENTAS
GROUP BY DIREC_CTA
HAVING DIREC_CTA LIKE 'GUADALAJARA';

-- 20
SELECT c.NOMBRE_CTA, COUNT(*)
FROM MOVIMIENTOS m
JOIN CUENTAS c ON c.NUM_CTA = m.NUM_CTA
GROUP BY c.NOMBRE_CTA
ORDER BY COUNT(*) DESC;


-- 21
SELECT s.NOMBRE_SUC, SUM(m.IMPORTE)
FROM MOVIMIENTOS m
JOIN SUCURSALES s ON m.COD_SUCUR = s.COD_SUCUR
WHERE m.TIPO_MOV LIKE 'R'
GROUP BY s.NOMBRE_SUC
ORDER BY SUM(m.IMPORTE) DESC;