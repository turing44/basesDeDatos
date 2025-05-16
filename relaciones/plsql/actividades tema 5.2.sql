SET SERVEROUTPUT ON;


-- 1

DECLARE 
  Num1 NUMBER(8,2) := 0; -- faltaba ;
  Num2 NUMBER(8,2) NOT NULL :=0 ; -- faltaba ; y lo not null debe inicializarse a algun valor
  Num3 NUMBER(8,2) NOT NULL :=0; -- lo not null debe inicializarse
  Cantidad INTEGER(3); 
  Precio NUMBER(6); -- deben declararse en distintas lineas 
  Descuento NUMBER(6); -- deben declararse en distintas lineas 
  --Num4 Num1%ROWTYPE; -- esto no se puede hacer porque num1 es una variable, no una 
  Dto CONSTANT INTEGER := 0; -- debe inicializarse
BEGIN 
  DBMS_OUTPUT.PUT_LINE('There are  items in stock.');
END; 


-- 2

DECLARE
	palabra VARCHAR2(20) := 'LANA';
	palabra_inversa VARCHAR2(20);
	contador NUMBER(3);
BEGIN
	contador := LENGTH(palabra);
	LOOP
		palabra_inversa := palabra_inversa || SUBSTR(palabra, contador, 1);
		contador := contador - 1; 
		EXIT WHEN contador <= 0;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE(palabra || ' inversa es: ' || palabra_inversa);
END;
/


-- 3
CREATE OR REPLACE PROCEDURE
cambiar_de_departamento (
	empleado IN NUMBER,
	nuevo_depart IN NUMBER 
)
IS
BEGIN
	UPDATE EMPLE 
	SET DEPT_NO = nuevo_depart 
	WHERE emp_no = empleado;
END;
/


BEGIN
	cambiar_de_departamento(7369, 30);
END;


select * from emple where emple.EMP_NO = 7369;


rollback;
-- 4 
-- el procedimiento local debe ser creado dentro de un bloque 

DECLARE
	PROCEDURE crear_depart (
		v_num_dept depart.dept_no%TYPE,
		v_dnombre depart.dnombre%TYPE DEFAULT 'PROVISIONAL',
		v_loc depart.loc%TYPE DEFAULT 'PROVISIONAL')
	IS
	BEGIN
	INSERT INTO depart
	VALUES (v_num_dept, v_dnombre, v_loc);
	END crear_depart;
BEGIN
	---crear_depart ('VALENCIA', 'COMPRAS');  
	crear_depart ('VALENCIA', 50);
END;
/

select * from depart;
rollback;


----
crear_depart; -- no funciona
crear_depart (50); -- funciona
crear_depart ('COMPRAS'); -- no
crear_depart (50,'COMPRAS'); --no
crear_depart ('COMPRAS', 50); --no
crear_depart ('COMPRAS', 'VALENCIA'); --no
crear_depart (50,'COMPRAS', 'VALENCIA'); -- sii
crear_depart ('COMPRAS', 50, 'VALENCIA');  --no
crear_depart ('VALENCIA', 'COMPRAS');  --noo  
crear_depart ('VALENCIA', 50); --no
----



-- 5
CREATE OR REPLACE 
PROCEDURE sumar (n1 in NUMBER, n2 in NUMBER) IS
resultado NUMBER;
BEGIN
	resultado := n1 + n2;
	DBMS_OUTPUT.PUT_LINE(resultado);
END;
/

EXECUTE sumar(4, 1);
--
BEGIN sumar(68, 1); END;


-- 6
CREATE OR REPLACE PROCEDURE
invertir(palabra IN VARCHAR2)
IS
contador NUMBER;
palabra_inversa VARCHAR2(20);
BEGIN
	contador := LENGTH(palabra);
	
	WHILE contador > 0 LOOP
		palabra_inversa := palabra_inversa || SUBSTR(palabra, contador, 1);
		contador := contador - 1;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE(palabra || ' inversa es: ' || palabra_inversa);

END;
/

EXECUTE INVERTIR('LANA');


-- 7 

CREATE OR REPLACE 
FUNCTION funcion_sumar (n1 in NUMBER, n2 in NUMBER) RETURN NUMBER 
IS
resultado NUMBER;
BEGIN
	resultado := n1 + n2;
	RETURN(resultado);
END;
/

BEGIN DBMS_OUTPUT.PUT_LINE('La suma de 2 + 4 es: ' || funcion_sumar(2, 4)); END;

-----

CREATE OR REPLACE FUNCTION
funcion_invertir(palabra IN VARCHAR2) 
RETURN VARCHAR
IS
contador NUMBER;
palabra_inversa VARCHAR2(20);
BEGIN
	contador := LENGTH(palabra);
	
	WHILE contador > 0 LOOP
		palabra_inversa := palabra_inversa || SUBSTR(palabra, contador, 1);
		contador := contador - 1;
	END LOOP;

	RETURN(palabra || ' inversa es: ' || palabra_inversa);
END;
/

BEGIN DBMS_OUTPUT.PUT_LINE('LANA al reves es: ' || FUNCION_INVERTIR('LANA')); END;


-- 8
CREATE OR REPLACE FUNCTION obtener_ano(fecha IN DATE)
RETURN VARCHAR2
IS 
  ano VARCHAR2(4);
BEGIN
  ano := TO_CHAR(fecha, 'YYYY');
  RETURN ano;
END;
/


-- 9 

DECLARE
	fecha DATE := TO_DATE('10-10-2023', 'DD-MM-YYYY');
BEGIN 
	DBMS_OUTPUT.PUT_LINE(OBTENER_ANO(fecha));
END;



-- 10 
CREATE OR REPLACE PROCEDURE
sumar5numeros (
	n1 NUMBER,
	n2 NUMBER,
	n3 NUMBER,
	n4 NUMBER,
	n5 NUMBER
)
IS
resultado NUMBER;
BEGIN
	resultado := (n1+n2+n3+n4+n5);
	DBMS_OUTPUT.PUT_LINE('La suma es: ' || resultado);
END;
/

EXECUTE SUMAR5NUMEROS(1,2,3,4,5);


-- 11
CREATE OR REPLACE FUNCTION
solo_letras (texto IN VARCHAR2) RETURN VARCHAR2
IS

	tamano NUMBER := LENGTH(TEXTO);
	caracter VARCHAR2(100);
	num NUMBER;
	fue_numero BOOLEAN;
 	texto_solo_letras VARCHAR2(100) := '';

BEGIN
	FOR i IN 1..tamano LOOP
		BEGIN
			fue_numero := FALSE;
			caracter := SUBSTR(texto, i, 1);
			num := TO_NUMBER(caracter);		
			fue_numero := true;

		EXCEPTION WHEN OTHERS THEN fue_numero := false;

		END;

		IF fue_numero THEN
			texto_solo_letras := texto_solo_letras || ' ';
		ELSE
			texto_solo_letras := texto_solo_letras || caracter;
		END IF;
	
	END LOOP;

	return texto_solo_letras;
END;
/

BEGIN 
	DBMS_OUTPUT.PUT_LINE(SOLO_LETRAS('ab444c3d')); 
end;


-- 12
CREATE OR REPLACE PROCEDURE
borrar_empleado(numero IN NUMBER)
IS
BEGIN
	delete from emple where emp_no = numero;
END;
/


Execute BORRAR_EMPLEADO(7934);



-- 13

select object_name, status from user_objects where object_type in ('PROCEDURE', 'FUNCTION');