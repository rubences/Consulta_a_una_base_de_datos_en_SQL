-- MUBIO06 · Actividad 1 · Consulta a una base de datos en SQL
-- Solución canónica para MySQL 8.0.31+.
-- Autor: Rubén Juárez Cádiz
--
-- IMPORTANTE:
-- 1) Ejecutar antes sql/00_base_datos_original.sql.
-- 2) El fichero original crea y selecciona el esquema `mydb`.
-- 3) Q11 utiliza INTERSECT para demostrar un operador de conjuntos.
--    INTERSECT está disponible en MySQL 8.0.31 y posteriores.
-- 4) Las sentencias incluyen ORDER BY cuando ayuda a obtener capturas
--    deterministas y comparables.

USE `mydb`;



-- ============================================================
-- Q01 · Básica 1
-- Obtener todos los datos de la tabla «Mantenimiento».
-- ============================================================
SELECT *
FROM `Mantenimiento`
ORDER BY `Identificador_M`;


-- ============================================================
-- Q02 · Básica 2
-- Extraer el identificador_S y Direccion_S de todas las sedes.
-- ============================================================
SELECT `identificador_S`, `Direccion_S`
FROM `Sede`
ORDER BY `identificador_S`;


-- ============================================================
-- Q03 · Básica 3
-- Listar los diferentes dueños de aseguradoras, renombrando la columna y eliminando duplicados.
-- ============================================================
SELECT DISTINCT `nombreDueño_A` AS `DueñoAseguradora`
FROM `Aseguradoras`
ORDER BY `DueñoAseguradora`;


-- ============================================================
-- Q04 · Fácil 1
-- Obtener los vehículos BMW u Honda que pertenecen a la sede 2.
-- ============================================================
SELECT *
FROM `Vehículo`
WHERE `Marca_V` IN ('BMW', 'Honda')
  AND `Sede_identificador_S` = 2
ORDER BY `Marca_V`, `Matricula_V`;


-- ============================================================
-- Q05 · Fácil 2
-- Listar los nombres de los clientes cuyo nombre comienza por L.
-- ============================================================
SELECT `Nombre_C`
FROM `Cliente`
WHERE `Nombre_C` LIKE 'L%'
ORDER BY `Nombre_C`;


-- ============================================================
-- Q06 · Fácil 3
-- Seleccionar los mantenimientos de 2021 que tienen una descripción no nula.
-- ============================================================
SELECT *
FROM `Mantenimiento`
WHERE `Fecha_M` BETWEEN '2021-01-01' AND '2021-12-31'
  AND `Descripcion_M` IS NOT NULL
ORDER BY `Fecha_M`, `Identificador_M`;


-- ============================================================
-- Q07 · Intermedia 1
-- Contar los vehículos por sede y mostrar solo las sedes con más de cinco.
-- ============================================================
SELECT s.`identificador_S`,
       COUNT(v.`Matricula_V`) AS `NumeroVehiculos`
FROM `Sede` AS s
JOIN `Vehículo` AS v
  ON v.`Sede_identificador_S` = s.`identificador_S`
GROUP BY s.`identificador_S`
HAVING COUNT(v.`Matricula_V`) > 5
ORDER BY `NumeroVehiculos` DESC, s.`identificador_S`;


-- ============================================================
-- Q08 · Intermedia 2
-- Obtener los clientes que han alquilado el vehículo IJKL789.
-- ============================================================
SELECT DISTINCT c.`Nombre_C`
FROM `Cliente` AS c
JOIN `Alquila` AS a
  ON a.`Cliente_DNI_C` = c.`DNI_C`
WHERE a.`Vehículo_Matricula_V` = 'IJKL789'
ORDER BY c.`Nombre_C`;


-- ============================================================
-- Q09 · Intermedia 3
-- Para cada cliente, mostrar nombre, email en mayúsculas y longitud del email.
-- ============================================================
SELECT `Nombre_C`,
       UPPER(`Email_C`) AS `Email_Mayusculas`,
       CHAR_LENGTH(UPPER(`Email_C`)) AS `Longitud_Email`
FROM `Cliente`
ORDER BY `Nombre_C`;


-- ============================================================
-- Q10 · Difícil 1
-- Obtener los vehículos alquilados por el cliente que ha gastado más en alquileres.
-- ============================================================
SELECT DISTINCT v.*
FROM `Vehículo` AS v
JOIN `Alquila` AS a
  ON a.`Vehículo_Matricula_V` = v.`Matricula_V`
WHERE a.`Cliente_DNI_C` = (
    SELECT `Cliente_DNI_C`
    FROM `Alquila`
    GROUP BY `Cliente_DNI_C`
    ORDER BY SUM(`Precio_CV`) DESC,
             `Cliente_DNI_C` ASC
    LIMIT 1
)
ORDER BY v.`Matricula_V`;


-- ============================================================
-- Q11 · Difícil 2
-- Listar las matrículas de vehículos que han sido alquilados y han tenido mantenimientos.
-- ============================================================
SELECT `Vehículo_Matricula_V` AS `Matricula_V`
FROM `Alquila`
INTERSECT
SELECT `Vehículo_Matricula_V`
FROM `Mantenimiento`
ORDER BY `Matricula_V`;


-- ============================================================
-- Q12 · Difícil 3
-- Para cada vehículo, obtener la diferencia entre el precio máximo y mínimo de alquiler.
-- ============================================================
SELECT `Vehículo_Matricula_V` AS `Matricula_V`,
       MAX(`Precio_CV`) AS `PrecioMaximo`,
       MIN(`Precio_CV`) AS `PrecioMinimo`,
       MAX(`Precio_CV`) - MIN(`Precio_CV`) AS `DiferenciaPrecio`
FROM `Alquila`
GROUP BY `Vehículo_Matricula_V`
ORDER BY `Vehículo_Matricula_V`;


-- ============================================================
-- Q13 · Compleja
-- Obtener nombre y teléfono de clientes que alquilaron BMW/Honda en la sede con más vehículos y su gasto total.
-- ============================================================
SELECT CONCAT(c.`Nombre_C`, ' - ', c.`Telefono_C`) AS `Cliente`,
       SUM(a_total.`Precio_CV`) AS `GastoTotal`
FROM `Cliente` AS c
JOIN `Alquila` AS a_total
  ON a_total.`Cliente_DNI_C` = c.`DNI_C`
WHERE c.`DNI_C` IN (
    SELECT DISTINCT a.`Cliente_DNI_C`
    FROM `Alquila` AS a
    JOIN `Vehículo` AS v
      ON v.`Matricula_V` = a.`Vehículo_Matricula_V`
    WHERE v.`Marca_V` IN ('BMW', 'Honda')
      AND v.`Sede_identificador_S` = (
          SELECT v2.`Sede_identificador_S`
          FROM `Vehículo` AS v2
          GROUP BY v2.`Sede_identificador_S`
          ORDER BY COUNT(*) DESC,
                   v2.`Sede_identificador_S` ASC
          LIMIT 1
      )
)
GROUP BY c.`DNI_C`, c.`Nombre_C`, c.`Telefono_C`
ORDER BY `GastoTotal` DESC, `Cliente` ASC;
