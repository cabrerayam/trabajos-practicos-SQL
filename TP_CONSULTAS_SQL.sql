
/*A – Básicas*/

/*1) Indicar cuáles son los títulos y autores de los libros cuyo tipo sea ‘no’ y sus precios
originales superen los $21.*/

SELECT 
TITULO, 
AUTOR
FROM LIBRO
WHERE TIPO = 'NO' AND PRECIO_ORI > 21;

/*2) ¿Cuáles son los números, precios originales y ediciones de los libros cuyo tipo sea ‘no’
o que sus precios originales superen $21 y las ediciones sean posteriores a 1985? */

SELECT 
NRO_LIBRO,
PRECIO_ORI,
EDICION 
FROM LIBRO
WHERE TIPO = 'NO' AND PRECIO_ORI > 21 AND  EDICION < 1985;

/*3)Obtener la lista autores y ediciones de los libros cuyos nombres de autores comiencen
con la letra L */

SELECT 
AUTOR,
EDICION
FROM LIBRO 
WHERE AUTOR LIKE 'L%';

/*4.Obtener la lista de autores y ediciones de los libros cuyos nombres de autores no
comiencen con la letra G. */

SELECT 
AUTOR,
EDICION
FROM LIBRO 
WHERE AUTOR NOT LIKE 'G%';

/*5)Obtener la lista de autores, precios originales y ediciones de los libros cuyos autores
tengan la hilera "RR" en algún lugar del nombre */

SELECT 
AUTOR,
PRECIO_ORI,
EDICION
FROM LIBRO 
WHERE AUTOR LIKE '%RR%';

/*6)Obtener la lista de títulos y ediciones de aquellos libros cuyos precios originales no
estén comprendidos entre $12 y $25. */

SELECT 
TITULO,
EDICION
FROM LIBRO
WHERE PRECIO_ORI NOT BETWEEN 12 AND 25;

/*7)Obtener todos los tipos y ediciones DISTINTAS(en tipo y Edición) de los libros,
ordenado por Edición y año de edición ascendente. */

SELECT DISTINCT
TIPO,
EDICION
FROM LIBRO
ORDER BY EDICION ASC ;

/*8)Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias
de precios para todos los libros clasificado por tipo y por dicha diferencia en forma
ascendente, en ese orden.*/

SELECT
NRO_LIBRO,
EDICION,
TIPO, 
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO
ORDER BY TIPO  ASC , DIFERENCIA_PRECIO ASC;

/*9) Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias 
de precios para todos los libros de estudio. */

SELECT
NRO_LIBRO,
EDICION,
TIPO, 
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO;

/*10) ¿Cuáles son los números, precios originales y ediciones de los libros cuyas ediciones 
son posteriores a 1985 y además o bien el tipo es ‘no’ o el precio original supera $21? */

SELECT
NRO_LIBRO,
PRECIO_ORI,
EDICION
FROM LIBRO
WHERE (EDICION > 1985) AND (TIPO = 'no' OR PRECIO_ORI > 21);

/*11)¿Cuáles son los títulos y nombres de los autores de los libros cuyo tipo sea ‘no’ o 
aquellos cuyos precios de origen superan $21? */

SELECT 
TITULO,
AUTOR
FROM LIBRO 
WHERE TIPO = 'no' OR PRECIO_ORI > 21;

/*12. Obtener la lista de títulos y precios originales de los libros que se editaron en 1948, 
1978 y 1985 */

SELECT
TITULO,
PRECIO_ORI,
EDICION
FROM LIBRO
WHERE EDICION IN (1948,1978,1985);

/*13. Obtener los títulos y ediciones de los libros cuyos precios originales estén dentro del 
rango de $12 a $25 inclusive */

SELECT 
TITULO,
EDICION
FROM LIBRO
WHERE PRECIO_ORI BETWEEN 12 AND 25;

/*14. Obtener la lista de títulos, precios originales y ediciones de aquellos libros cuyos títulos 
tengan las letras "R" y "S" en algún lugar y en ese orden. */

SELECT
TITULO,
PRECIO_ORI,
EDICION
FROM LIBRO 
WHERE TITULO LIKE '%R%' AND TITULO LIKE  '%S%' ; -- REVISAR 

/*15. Obtener la lista de títulos, precios originales y ediciones de aquellos libros que tengan 
la letra "A" en la segunda posición del título. */

SELECT
TITULO,
PRECIO_ORI,
EDICION
FROM LIBRO 
WHERE TITULO LIKE '_A%' ;

/*16. Ordenar en secuencia ascendente por año de edición los títulos de los libros cuyo tipo 
sea ‘no’. Listar también la edición. */

SELECT
TITULO,
EDICION,
FROM LIBRO
WHERE TIPO LIKE 'no'
ORDER BY EDICION ASC;

/*17. Listar los números, ediciones y tipos de libros cuyos precios originales superen los $20. 
Clasificar por edición en forma descendente y por número de libro ascendente en ese 
orden. */

SELECT
NRO_LIBRO,
EDICION,
TIPO
FROM LIBRO
WHERE PRECIO_ORI > 20
ORDER BY EDICION DESC, NRO_LIBRO ASC;

/*18. Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias 
de precios para todos los libros cuyas diferencias de precio sean superiores a $10. */

SELECT
NRO_LIBRO,
EDICION,
TIPO,
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10;

/*19. Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias 
de precios para todos los libros cuyas diferencias de precio sean superiores a $10, 
clasificado por dicha diferencia en forma descendente. */

SELECT
NRO_LIBRO,
EDICION,
TIPO,
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10
ORDER BY (PRECIO_ACT - PRECIO_ORI) DESC;


/*B - Funciones de Agregación, Having */


/*1) Obtener la suma y el promedio de los precios originales y el mínimo y el máximo de los 
precios actuales para todos los libros cuyo año de edición sea mayor a 1970*/

SELECT
SUM (PRECIO_ORI) AS SUMA_PRECIO_ORI,
AVG (PRECIO_ORI) AS AVG_PRECIO_ORI,
MIN(PRECIO_ACT) AS PRECIO_ACT_MINIMO,
MAX(PRECIO_ACT) AS PRECIO_ACT_MAX
FROM LIBRO
WHERE EDICION > 1970 ;

/*2. Obtener de la suma total de la suma de los precios originales más los actuales, el 
promedio de dicha suma y el mínimo y el máximo de las diferencias de precios para 
todos los libros cuyo año de edición sea superior a 1970. */

SELECT
SUM ((PRECIO_ORI + PRECIO_ACT)) AS SUMA_TOTAL_PRECIOS,
AVG ((PRECIO_ORI) + (PRECIO_ACT)) AS AVG_TOTAL_PRECIOS,
MIN ((PRECIO_ACT - PRECIO_ORI)) AS MINIMO_DIFERENCIA,
MAX ((PRECIO_ACT - PRECIO_ORI)) AS MAXIMO_DIFERENCIA
FROM LIBRO
WHERE EDICION > 1970 ;


/*3. Listar la cantidad de libros, los distintos tipos de libros, el mínimo y el máximo del 
precio original, pero sólo para aquellos libros cuyo precio original supere los $45.*/

SELECT
COUNT(NRO_LIBRO) AS CANTIDAD_LIBROS,
COUNT(DISTINCT(TIPO)) AS CANTIDAD_TIPO_LIBRO,
MIN(PRECIO_ORI) AS PRECIO_MINIMO,
MAX(PRECIO_ORI) AS PRECIO_MAXIMO
FROM LIBRO
WHERE PRECIO_ORI > 45 ;

/*4. Listar los tipos de libros, totales de precios originales, promedios de precios actuales, 
resumidos por tipo de libro y para los libros cuyas ediciones no sean de 1946, pero sólo 
para aquellos tipos de libros cuya sumatoria de precios originales supere $40. */

SELECT
TIPO,
SUM (PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG (PRECIO_ACT) AS AVG_PRECIO_ACT
FROM LIBRO 
WHERE EDICION != 1946
GROUP BY TIPO 
HAVING SUM(PRECIO_ORI) > 40 ;

/*5. Listar los tipos de libros y promedios de precios originales agrupados por tipos, para 
aquellos tipos que tengan el promedio de sus precios originales por arriba del 
promedio de precios originales de todos los libros. */

SELECT
TIPO,
AVG(PRECIO_ORI) AS AVG_PRECIOS_ORI
FROM LIBRO
GROUP BY TIPO ;

/*6. Listar los tipos de libros, totales de precios originales y promedios de precios actuales, 
de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro. */

SELECT 
TIPO,
SUM(PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG(PRECIO_ACT) AS PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO ;

/*7. Listar los tipos de libros, totales de precios originales y promedios de precios actuales, 
de aquellos libros que no fueron editados en 1946, resumidos por tipo de libro 
clasificado por promedio de precios actuales de menor a mayor. */

SELECT
TIPO,
SUM(PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG (PRECIO_ACT) AS PROM_PRECIO_ACT
FROM LIBRO
WHERE NOT EDICION = 1946
GROUP BY TIPO
ORDER BY PROM_PRECIO_ACT ASC ;

/*8. Listar los tipos de libros, totales de precios originales y promedios de precios actuales, 
de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro. */

SELECT
TIPO,
SUM(PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG (PRECIO_ACT) AS PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO ;

/*9. Listar el salario máximo agrupado por el tipo de trabajo.*/

SELECT
TRABAJO,
MAX(SALARIO) AS SALARIO_MAX
FROM LECTOR
GROUP BY TRABAJO ;

/*10. Listar el salario promedio agrupado por tipo de trabajo de los lectores que viven en 
capital.*/

SELECT 
TRABAJO,
DIRECCION,
MAX(SALARIO) AS SALARIO_MAX
FROM LECTOR
WHERE DIRECCION LIKE '%CAPITAL%'
GROUP BY TRABAJO, DIRECCION ;

/*D -- Consultas en varias tablas – uso de join (inner join – left join – right join)  */

/*1. Listar el Titulo, fecha de Préstamo y la fecha de Devolución de los Libros prestados*/

SELECT 
TITULO,
F_PREST,
F_DEVOL
FROM LIBRO
INNER JOIN PRESTAMO  ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO ;


/*2. Listar el Nro de Libro, Titulo, fecha de Préstamo y la fecha de Devolución de los Libros 
prestados */

SELECT 
LIBRO.NRO_LIBRO,
TITULO,
F_PREST,
F_DEVOL
FROM LIBRO
INNER JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO ;


/*3. Listar el número de lector, su nombre y la cantidad de préstamos realizados a ese 
lector. */

SELECT 
LECTOR.NRO_LECTOR,
NOMBRE,
COUNT(PRESTAMO.NRO_LIBRO) AS CANT_PRESTAMOS
FROM LECTOR
INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR
GROUP BY LECTOR.NRO_LECTOR, NOMBRE;

/*4. Listar el número de libro, el título, el número de copia, y la cantidad de préstamos 
realizados para cada copia de cada libro. */

SELECT
LIBRO.NRO_LIBRO,
TITULO,
NRO_COPIA,
COUNT(PRESTAMO.NRO_LIBRO) AS CANT_PRESTAMOS
FROM PRESTAMO
LEFT JOIN LIBRO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
GROUP BY NRO_COPIA, LIBRO.NRO_LIBRO, TITULO ;

/*5. Listar el número de libro, el título, y la cantidad de préstamos realizados para ese libro 
a partir del año 2012 */

SELECT
LIBRO.NRO_LIBRO,
TITULO,
COUNT(PRESTAMO.NRO_LIBRO) AS CANT_PRESTAMOS
FROM LIBRO
INNER JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
WHERE PRESTAMO.F_PREST >= 2012
GROUP BY LIBRO.NRO_LIBRO, TITULO ;


/*6. Listar el número de libro, el título, el número de copia, y la cantidad de préstamos 
realizados para cada copia de cada libro, pero sólo para aquellas copias que se hayan 
prestado más de 1 vez. */

SELECT 
LIBRO.NRO_LIBRO,
TITULO,
NRO_COPIA,
COUNT(PRESTAMO.NRO_COPIA) AS CANT_PRESTAMOS_POR_COPIA
FROM LIBRO 
JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
GROUP BY LIBRO.NRO_LIBRO, TITULO, NRO_COPIA
HAVING COUNT(PRESTAMO.NRO_COPIA) > 1 ;

/*7. Listar el Nro de Libro, Titulo, nro de Copia y Fecha de Préstamo, de todas las Copias, 
hayan sido prestadas o no */

SELECT
LIBRO.NRO_LIBRO,
TITULO,
COPIAS.NRO_COPIA,
F_PREST
FROM LIBRO
LEFT JOIN COPIAS ON LIBRO.NRO_LIBRO  = COPIAS.NRO_LIBRO
LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO  = PRESTAMO.NRO_LIBRO

/*8. Listar Nro de Lector, Nombre, nro de Libro, Titulo, Descripción del Tipo de Libro , fecha 
de préstamo que aquellos Prestamos que hayan sido devueltos y el tipo de Libro sea 
Novela o Cuentos */

SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
PRESTAMO.NRO_LIBRO,
TITULO,
DESCTIPO,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
JOIN TIPOLIBRO ON TIPOLIBRO.TIPO = LIBRO.TIPO
WHERE F_DEVOL IS NOT NULL AND DESCTIPO LIKE '%Novela%' OR DESCTIPO LIKE '%Cuentos%'

/*9. Obtener la lista de los títulos de los libros prestados y los nombres de los lectores que 
los tienen en préstamo */
SELECT
TITULO,
NOMBRE
FROM PRESTAMO
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR

/*10. Listar el Nro de Lector, Nombre y fecha de Préstamo de aquellos Lectores que hayan 
realizado un préstamo y no lo hayan devuelto */

SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
WHERE F_DEVOL IS NULL

/*11. Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de préstamo que aquellos 
Prestamos que hayan sido devueltos */
SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
PRESTAMO.NRO_LIBRO,
TITULO,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
WHERE F_DEVOL IS NOT NULL;

/*12. Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de préstamo que aquellos 
Prestamos que hayan sido devueltos y el tipo de Libro sea Novela o Cuentos */
SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
PRESTAMO.NRO_LIBRO,
TITULO,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
JOIN TIPOLIBRO ON LIBRO.TIPO = TIPOLIBRO.TIPO
WHERE F_DEVOL IS NOT NULL AND DESCTIPO LIKE '%Novela%' OR DESCTIPO LIKE '%Cuentos%' ;


/*13. Listar el Nro de Lector, Nombre y fecha de Préstamo de Todos los Lectores, hayan 
tenido Prestamos o no*/
SELECT
LECTOR.NRO_LECTOR,
NOMBRE,
F_PREST
FROM LECTOR
FULL OUTER JOIN PRESTAMO ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR ;











