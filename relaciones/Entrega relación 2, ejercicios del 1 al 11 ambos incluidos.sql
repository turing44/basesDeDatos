/*
1.-¿Cuál sería la salida de ejecutar estas funciones?

ABS(146) = 146
ABS(-30) = 30
POWER(3,-1) = 0.3333
ROUND(33.67) = 34
CEIL(2) = 2
CEIL(1.3) = 2
ROUND(-33.67,2) = -33.67
ROUND(-33.67,-2) = 0
CEIL(-2.3) = -2
CEIL(-2) = -2
ROUND(-33.27,1) = -33.3
ROUND(-33.27,-1) = -30
FLOOR(-2) = -2
FLOOR(-2.3) = -3
TRUNC(67.232) = 67
TRUNC(67.232,-2) = 0
FLOOR(2) = 2
FLOOR(1.3) = 1
TRUNC(67.232,2) = 67.23
TRUNC(67.58,-1) = 60
MOD(22,23) = 22
MOD(10,3) = 1
TRUNC(67.58,1) = 67.5
POWER(10,0) = 1
POWER(3,2) = 9


*/


-- 2.1
SELECT COUNT(apellido) FROM EMPLE where apellido LIKE 'A%';

-- 2.2
SELECT APELLIDO, SALARIO
FROM EMPLE
WHERE APELLIDO LIKE 'A%' 
AND SALARIO = (SELECT MAX(SALARIO) FROM EMPLE WHERE APELLIDO LIKE 'A%');


-- 4
SELECT 
    TO_CHAR(AVG(salario), '999,999.99') AS sueldo_medio,
    COUNT(comision) AS comisiones_no_nulas,
    TO_CHAR(MAX(salario), '999,999.99') AS max_sueldo,
    TO_CHAR(MIN(salario), '999,999.99') AS min_sueldo
FROM EMPLE
WHERE dept_no = 30;


-- 5
SELECT tema
FROM libreria
WHERE ejemplares = (SELECT MAX(ejemplares) FROM libreria)
AND tema LIKE '%E%';


-- 6
SELECT RPAD(titulo, 40, '^-') as RESULTADO from MISTEXTOS;



-- 7

SELECT
LOWER(
    REPLACE(
        REPLACE(titulo, '.', ''), '"', ''
    )
) as Traduccion
FROM mistextos;


SELECT TRANSLATE(titulo, '."', ' ') as Traduccion
FROM MISTEXTOS;


-- 8
SELECT autor, 
substr(
    autor, 0, 
    ((instr(autor, ','))-1)
) as apellido 
from libros;


-- 9
SELECT autor, 
substr(
    autor, 1, (instr(autor, ' '))
) as apellido 
from libros;


-- 10
SELECT
(substr(autor, (instr(autor, ', ')) + 2))
as nombre,

(substr(autor, 0,(instr(autor, ', ')) - 1)) as apellido


FROM libros;


-- 11

SELECT titulo FROM libros order by length(titulo);