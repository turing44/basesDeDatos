CREATE TABLE ALUM0405 (
    dni VARCHAR2(10) NOT NULL,          -- DNI del alumno
    nombre VARCHAR2(15),                -- Nombre del alumno
    apellidos VARCHAR2(20),             -- Apellidos del alumno
    fecha_nac DATE,                     -- Fecha de nacimiento
    direccion VARCHAR2(20),             -- Dirección del alumno
    poblacion VARCHAR2(20),             -- Población del alumno
    provincia VARCHAR2(20),             -- Provincia del alumno
    curso NUMBER(1),                    -- Curso del alumno (1, 2, 3, 4)
    nivel VARCHAR2(4),                  -- Nivel (ESO, BAC, SMR, DAW, DAM, ASIR)
    clase CHAR(2),                      -- Aula en la que está el alumno
    faltas1 NUMBER(2),                  -- Faltas primer trimestre
    faltas2 NUMBER(2),                  -- Faltas segundo trimestre
    faltas3 NUMBER(2)                   -- Faltas tercer trimestre
);


-- 1
SELECT * FROM ALUM0405;

-- 2
SELECT dni, nombre, apellidos, curso, nivel, clase FROM ALUM0405;

-- 3
SELECT * FROM ALUM0405 WHERE poblacion = 'GUADALAJARA';

-- 4
SELECT nombre, apellidos FROM ALUM0405 WHERE poblacion = 'GUADALAJARA';

-- 5
SELECT dni, nombre, apellidos, curso, nivel, clase 
FROM ALUM0405 
ORDER BY apellidos ASC, nombre ASC;

-- 6
SELECT apellido, oficio, salario, fecha_alt
FROM EMPLE 
WHERE oficio = (SELECT oficio FROM EMPLE WHERE apellido = 'JIMENEZ') 
   OR salario >= (SELECT salario FROM EMPLE WHERE apellido = 'FERNANDEZ');

-- 7
SELECT apellido, oficio
FROM EMPLE
WHERE oficio = (SELECT oficio FROM EMPLE WHERE apellido = 'JIMENEZ');

-- 8
SELECT apellido, oficio, salario
FROM EMPLE
WHERE dept_no = (SELECT dept_no FROM EMPLE WHERE apellido = 'FERNANDEZ')
  AND salario = (SELECT salario FROM EMPLE WHERE apellido = 'FERNANDEZ');

-- 9
SELECT a.nombre
FROM ALUMNOS a
JOIN NOTAS n ON a.id_alumno = n.id_alumno
JOIN ASIGNATURAS s ON n.id_asignatura = s.id_asignatura
WHERE s.nombre = 'FOL' AND n.nota BETWEEN 7 AND 8;

-- 10
SELECT s.nombre
FROM ASIGNATURAS s
WHERE NOT EXISTS (
    SELECT 1 
    FROM NOTAS n 
    WHERE n.id_asignatura = s.id_asignatura AND n.nota < 5
);

-- 11
SELECT e.apellido, e.oficio, d.loc
FROM EMPLE e
JOIN DEPART d ON e.dept_no = d.dept_no
WHERE e.oficio = 'ANALISTA';

-- 12
SELECT e.*
FROM EMPLE e
WHERE e.dir = (SELECT emp_no FROM EMPLE WHERE apellido = 'CEREZO');

-- 13
SELECT e.*
FROM EMPLE e
JOIN DEPART d ON e.dept_no = d.dept_no
WHERE d.dnombre = 'VENTAS';

-- 14
SELECT d.*
FROM DEPART d
LEFT JOIN EMPLE e ON d.dept_no = e.dept_no
WHERE e.emp_no IS NULL;

-- 15
SELECT DISTINCT d.*
FROM DEPART d
JOIN EMPLE e ON d.dept_no = e.dept_no;

-- 16
SELECT apellido, salario
FROM EMPLE
WHERE salario > (SELECT MAX(salario) FROM EMPLE WHERE dept_no = 20);

-- 17
SELECT tema, estante, ejemplares
FROM LIBRERIA
WHERE ejemplares BETWEEN 8 AND 15;

-- 18
SELECT tema, estante, ejemplares
FROM LIBRERIA
WHERE estante NOT BETWEEN 'B' AND 'D';

-- 19
SELECT tema
FROM LIBRERIA
WHERE ejemplares < (SELECT ejemplares FROM LIBRERIA WHERE tema = 'MEDICINA');

-- 20
SELECT tema
FROM LIBRERIA
WHERE ejemplares NOT BETWEEN 15 AND 20;

-- 21
SELECT s.nombre
FROM ASIGNATURAS s
WHERE s.nombre LIKE '%o%o%o%'
AND EXISTS (
    SELECT 1 
    FROM NOTAS n
    JOIN ALUMNOS a ON n.id_alumno = a.id_alumno
    WHERE n.id_asignatura = s.id_asignatura AND a.poblacion = 'Madrid'
);

-- 22
SELECT DISTINCT a.nombre
FROM ALUMNOS a
JOIN NOTAS n ON a.id_alumno = n.id_alumno
WHERE a.poblacion = 'Madrid' AND n.nota < 5;

-- 23
SELECT a.nombre
FROM ALUMNOS a
JOIN NOTAS n ON a.id_alumno = n.id_alumno
WHERE n.nota = (
    SELECT n2.nota
    FROM NOTAS n2
    JOIN ALUMNOS a2 ON n2.id_alumno = a2.id_alumno
    JOIN ASIGNATURAS s2 ON n2.id_asignatura = s2.id_asignatura
    WHERE a2.nombre = 'Díaz Fernandez, Maria' AND s2.nombre = 'FOL'
);

-- 24
SELECT s.*
FROM ASIGNATURAS s
LEFT JOIN NOTAS n ON s.id_asignatura = n.id_asignatura
WHERE n.id_alumno IS NULL;

-- 25
SELECT a.nombre, a.apellidos
FROM ALUMNOS a
JOIN NOTAS n ON a.id_alumno = n.id_alumno
WHERE n.id_asignatura = 1;

-- 26
SELECT a.nombre, a.apellidos
FROM ALUMNOS a
WHERE NOT EXISTS (
    SELECT 1 
    FROM NOTAS n 
    WHERE n.id_alumno = a.id_alumno AND n.id_asignatura = 1
);