select nombre, FECHANAC,

TO_CHAR(FECHANAC, '"Nacido el "DD" de "fmMonth" del "YYYY')

as fechaFormateada
from NACIMIENTOS;

-- 13
-- rtrim quita espacios en blanco a la derecha
SELECT 
    TEMA, 
    SUBSTR(RTRIM(TEMA), -1, 1) AS ULTIMO_CARACTER, 
    LENGTH(RTRIM(TEMA)) AS NUM_CARACTERES
FROM LIBRERIA
ORDER BY TEMA;


-- 14
SELECT

rtrim(NOMBRE) || to_char(FECHANAC, '" nacido el "DD" de "fmMonth" del año "YYYY')
as Fechas

from NACIMIENTOS;

-- 15
select 

to_char(to_date('010712'), 'MONTH') as Ejercicio15


from DUAL;

-- 16
SELECT 
DECODE(EJEMPLARES, 7, 'SEVEN', TEMA) AS TEMA_MODIFICADO,
EJEMPLARES
FROM LIBRERIA;


-- 17
SELECT APELLIDO FROM EMPLE where Months_between(sysdate, FECHA_ALT) > 15 * 12;



-- 18
SELECT APELLIDO 
FROM EMPLE 
where Months_between(sysdate, FECHA_ALT) > 16 * 12
AND
DEPT_NO = (select DEPT_NO from depart where dnombre = 'VENTAS');

-- 19
select * from emple;

select APELLIDO, DEPT_NO, SALARIO
from emple e
where SALARIO = (select max(salario) from emple x where e.DEPT_NO=x.DEPT_NO);



-- 20 
-- igual que el 19 :(