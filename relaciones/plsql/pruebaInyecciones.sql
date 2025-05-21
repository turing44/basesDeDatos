CREATE TABLE notas (
    usuario VARCHAR2(20),
    passwd VARCHAR2(20),
    nota_secreta VARCHAR2(100)
)

INSERT INTO notas VALUES ('roberto', '1234', 'jajajaja');
INSERT INTO notas VALUES ('leo', '0000', 'secretitos');
INSERT INTO notas VALUES ('hola', '2224', 'xddd');


SELECT nota_secreta FROM notas where usuario = '&prompt_usuario' AND passwd = '&prompt_passwd';


/*
' OR '1'='1
' OR '1'='1

*/

