/*
Importo los datos del csv a oracle sql

Tras analizarlos veo que SOLO HAY DATOS DE ENERO, FEBRERO Y LOS 2 PRIMEROS DIAS DE MARZO.
Como analista de datos senior le diría a la empresa que como pretende que le haga un analisis con los datos que tengo.
*/

-- 1 ¿En qué mes del año debería contratar más personal para cubrir la demanda? ¿Y por qué?

/*
Esta pregunta no se puede responder con los datos disponibles

Ademas, no me defines que es lo que le supone al empleado la carga de trabajo
si le es el mismo esfuerzo vender un mueble que un libro,
si importa la cantidad de objetos vendidos
o si le supone lo mismo al empleado que le paguen en efectivo o con tarjeta

Yo voy a suponer que la carga de trabajo se define por cantidad de productos vendidos
*/


-- Ejecutamos un comando que por cada mes saque la media diaria de productos vendidos y el total de productos vendidos
SELECT 
TO_CHAR(Fecha, 'MM-YYYY') AS MES,
SUM(QUANTITY) AS PRODUCTOS_VENDIDOS ,
SUM(QUANTITY) / COUNT(DISTINCT TO_CHAR(Fecha, 'YYYY-MM-DD')) AS AVG_DIARIA_PRODUCTOS_VENDIDOS
FROM VENTAS
GROUP BY TO_CHAR(Fecha, 'MM-YYYY')
ORDER BY MES;




/*
MES     PRODUCTOS_VENDIDOS AVG_DIARIA_PRODUCTOS_VENDIDOS
------- ------------------ -----------------------------
01-2023               2850                    91.9354839
02-2023               2716                            97
03-2023                173                          86.5

No podemos fiarnos mucho del mes de marzo porque solo tenemos los 2 primeros dias.

Lo unico que podemos sacar aqui en conclusion es que 
en febrero de media se venden un 5,2% mas
aunque las ventas totales fueron un 4,7% menos que en enero

Entonces aunque en total se vendio mas en enero, el numero de ventas distribuidos por los dias parece ser mas uniforme.
Así que contrataria mas personal en febrero porque parece tener picos de mayor intensidad.
*/


-- 2 ¿En qué mes del año sería recomendable que los empleados se tomen vacaciones? ¿Y por qué?

/*
Pues esta pregunta es igual que la anterior pero al reves así que ejecutaria al mismo comando que en la pregunta 1

Y digo lo mismo que en enero es un 5,2% mas uniforme y con menos picos de muchas ventas a si que diria que se fuesen de vacaciones en enero.
*/


-- 3 ¿A qué producto se le podría subir ligeramente el precio?¿Y por qué?

/*
Para esto voy a basarme en la ley de la oferta y la demanda: 
a mayor demanda de un producto mas aumento su precio.

Entonces ejecutaré un comando que me diga la demanda de cada producto.
*/

SELECT 
PRODUCTID, SUM(QUANTITY) AS UNIDADES_VENDIDAS
FROM VENTAS
GROUP BY PRODUCTID
ORDER BY UNIDADES_VENDIDAS DESC;


/*

PRODUCTID                  UNIDADES_VENDIDAS
-------------------------- -----------------
PRD3089                                   29
PRD2034                                   20
PRD1366                                   19
PRD3803                                   19
PRD5149                                   18
PRD3599                                   18

Veo que el producto mas vendido es el PRD3089
asi que seria a ese al que le podria subir el precio

*/

-- 4 ¿En qué categoría de productos debería especializarse la tienda?¿Y por qué?

/*
Haré lo mismo que en el ejercicio anterior pero con categorias
*/

SELECT 
CATEGORY, SUM(QUANTITY) AS UNIDADES_VENDIDAS
FROM VENTAS
GROUP BY CATEGORY
ORDER BY UNIDADES_VENDIDAS DESC;

/*

CATEGORY                   UNIDADES_VENDIDAS
-------------------------- -----------------
Toys                                    1064
Clothing                                1022
Groceries                                974
Books                                    911
Furniture                                905
Electronics                              863

Vemos que no hay mucha diferencia entre categorias como para decidirme por especializarme en una en concreto

Aunque veo que la categoria mas vendidas son los juguetes asi que me especializaría en esa si tuviera que elegir solo una

*/


-- 5 ¿Se ha detectado alguna transacción irregular o posible fraude?¿Y por qué?

SELECT * FROM VENTAS
WHERE TOTAL != (QUANTITY * PRICE);
-- no encuentra nada asi que todas las ventas tienen sentido


SELECT * FROM VENTAS ORDER BY QUANTITY;
SELECT * FROM VENTAS ORDER BY QUANTITY DESC;
-- vemos que siempre se venden entre 1 y 10 productos


-- Ejecuto un comando que muestre las transacciones en las que un producto ha cambiado de precio
select * from VENTAS
WHERE PRODUCTID IN (
select PRODUCTID
from VENTAS
group by PRODUCTID
having count(DISTINCT price) > 1
);

-- Devuelve 155 ventas
-- Eso significa que 155 un producto se a vendido con distinto precio
-- No tiene porque ser un fraude porque pueden ser rebajas pero si es "irregular"




-- 6 ¿Qué acciones podrían tomarse para aumentar las ventas?¿Y por qué?

-- Ejecutaré un comando que me muestre los productos mas caros y que menos se venden (pongo los que se venden menos de 5)
SELECT ProductID, MAX(Price) AS Precio_Maximo, SUM(Quantity) AS Total_Vendido
FROM ventas
GROUP BY ProductID
having sum(QUANTITY) < 5
ORDER BY Precio_Maximo DESC, Total_Vendido ASC;


/*
Devuelve:


PRODUCTID            PRECIO_MAXIMO TOTAL_VENDIDO
-------------------- ------------- -------------
PRD2080                      596.2             3
PRD4871                      595.2             1
PRD3714                     594.55             1
PRD5580                     594.46             4
PRD2437                     594.23             1
PRD4764                     593.91             4
PRD2360                     590.59             4
PRD1798                     590.21             3
PRD5404                     587.98             2
PRD2163                     587.04             4
PRD1896                      586.4             1

Le trataria de bajar el precio a los siguientes productos a ver si así consigo mas ventas
*/




-- 7 ¿Qué producto debería dejar de venderse?¿Y por qué?

-- Ejecutare un comando que me diga cuales son los productos con menos demanda y que menos ingresos dan.

SELECT ProductID, SUM(Quantity) AS Total_Vendido, SUM(Total) AS Ingreso_Total
FROM ventas
GROUP BY ProductID
ORDER BY Total_Vendido ASC, Ingreso_Total ASC;

/*

PRODUCTID            TOTAL_VENDIDO INGRESO_TOTAL
-------------------- ------------- -------------
PRD4659                          1           7.8
PRD4003                          1           8.3
PRD2498                          1         14.29
PRD5540                          1         30.49
PRD3405                          1         39.72
PRD2834                          1         39.79
PRD2270                          1         43.42
PRD4355                          1         50.55
PRD5949                          1         56.34
PRD4377                          1         57.83
PRD2309                          1         65.26
...

Al ser estos los productos que menos se venden y que menos generan yo los dejaria de vender 
*/





/*
Conclusión:


Solo con los datos de enero y febrero no sabria predecir los que va a suceder el resto del año, 
le diria a la empresa que esperara a tener mas datos sobre sus ventas
*/