--- Desafío Genérico Clase 7 - Práctica SQL

-- 1) Indicar cuántos cursos y carreras tiene el área de Data. Renombrar la nueva columna como 
-- cant_asignaturas. Keywords: Tipo, Área, Asignaturas.

USE CoderHouse;
    
SELECT tipo, COUNT(Area) AS cant_asignaturas
FROM Asignaturas
where Area = 5
GROUP by Tipo;
 
-- o 
 
SELECT tipo, COUNT(AsignaturasID) AS cant_asignaturas
FROM Asignaturas
where Area = 5
GROUP by Tipo;

-- 2) Se requiere saber cual es el nombre, el documento y el teléfono de los estudiantes que son 
-- profesionales en agronomía y que nacieron entre el año 1970 y el año 2000. 
-- Keywords: Estudiantes, Profesión, fecha de Nacimiento.

SELECT Nombre, Documento, Telefono
FROM Estudiantes
WHERE Profesion = '6'
AND [Fecha de Nacimiento] BETWEEN '1970-01-01' AND '2000-12-31';

-- 3) Se requiere un listado de los docentes que ingresaron en el año 2021 y concatenar los campos nombre y apellido. 
-- El resultado debe utilizar un separador: guión (-). Ejemplo: Elba-Jimenez. Renombrar la nueva columna como 
-- Nombres_Apellidos. Los resultados de la nueva columna deben estar en mayúsculas. 
-- Keywords: Staff, Fecha Ingreso, Nombre, Apellido.

SELECT UPPER(CONCAT(Nombre,'-',Apellido)) AS Nombres_Apellidos
FROM Staff
WHERE YEAR([Fecha Ingreso]) = 2021;

-- 4) Indicar la cantidad de encargados de docentes y de tutores. Renombrar la columna como CantEncargados. 
-- Quitar la palabra “Encargado” en cada uno de los registros. Renombrar la columna como NuevoTipo. 
-- Keywords: Encargado, tipo, Encargado_ID.

SELECT 
REPLACE(Tipo,'Encargado ','') AS NuevoTipo,
COUNT(Encargado_ID) as CantEncargados
FROM Encargado
GROUP BY Tipo;

-- 5)Indicar cuál es el precio promedio de las carreras y los cursos por jornada. 
-- Renombrar la nueva columna como Promedio. Ordenar los promedios de Mayor a menor. 
-- Keywords: Tipo, Jornada, Asignaturas.

SELECT Tipo, Jornada, AVG(Costo) AS Promedio
FROM Asignaturas
GROUP BY Tipo, Jornada
ORDER BY Promedio desc;

-- 6) Se requiere calcular la edad de los estudiantes en una nueva columna. Renombrar a la nueva columna Edad.
-- Filtrar solo los que son mayores de 18 años. Ordenar de Menor a Mayor. Keywords: Fecha de Nacimiento, Estudiantes.

SELECT *, DATEDIFF(year,[Fecha de Nacimiento],GETDATE()) AS Edad
FROM Estudiantes
WHERE DATEDIFF(year,[Fecha de Nacimiento],GETDATE()) >= 18
ORDER BY Edad ASC;

-- Nota: GETDATE() devuelve la fecha y hora de la base de datos. Es la manera de poner la fecha actual.

-- 7) Se requiere saber el Nombre, el correo, la camada y la fecha de ingreso de personas del staff que contienen 
-- correo .edu y su DocentesID sea mayor o igual que 100. Keywords: Staff, correo, DocentesID.

SELECT Nombre, Correo, Camada, [Fecha Ingreso]  
FROM Staff
WHERE Correo like '%.edu%' and DocentesID >= 100;

-- 8) Se requiere conocer el documento, el domicilio, el código postal y el nombre de los primeros estudiantes 
-- que se registraron en la plataforma. Keywords: Documento, Estudiantes, Fecha Ingreso.

SELECT Documento, Domicilio, [Codigo Postal], Nombre
FROM Estudiantes
WHERE [Fecha Ingreso] = (SELECT MIN([Fecha Ingreso]) AS fechamin FROM Estudiantes);

-- 9)Indicar el nombre, apellido y documento de los docentes y tutores que tienen asignaturas “UX” . 
-- Keywords: Staff, Asignaturas, Nombre, Apellido.

SELECT Nombre, Apellido, documento
FROM Staff
WHERE Asignatura in 
(SELECT AsignaturasID FROM Asignaturas WHERE nombre like '%UX%');

-- 10) Se desea calcular el 25% de aumento para las asignaturas del área de marketing de la jornada mañana. 
-- Se deben traer todos los campos, más el de los cálculos correspondientes. El porcentaje y el Nuevo costo 
-- debe estar en decimal con 3 dígitos. Renombrar el cálculo del porcentaje con el nombre porcentaje y la suma del 
-- costo más el porcentaje por NuevoCosto. Keywords: Asignaturas, Costo, Área, Jornada, Nombre.

SELECT *,
CAST((costo * 0.25) as decimal (7,3)) AS porcentaje,
Costo + CAST((costo * 0.25) as decimal (7,3)) AS NuevoCosto
FROM Asignaturas 
WHERE Area = (SELECT AreaID FROM Area WHERE Nombre like '%Marketing%')
and Jornada ='Manana';