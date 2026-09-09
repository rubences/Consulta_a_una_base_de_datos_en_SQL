# Resultados esperados

Estos resultados se han calculado a partir del fichero `mubio06_act1_base_datos.sql` suministrado con la actividad. Sirven para comprobar las capturas reales de MySQL Workbench; no sustituyen dichas capturas.

## Resumen de control

| Consulta | Filas esperadas |
|---|---:|
| Q01 | 17 |
| Q02 | 4 |
| Q03 | 2 |
| Q04 | 2 |
| Q05 | 2 |
| Q06 | 7 |
| Q07 | 1 |
| Q08 | 2 |
| Q09 | 9 |
| Q10 | 2 |
| Q11 | 7 |
| Q12 | 11 |
| Q13 | 4 |

## Q01 · Básica 1

Obtener todos los datos de la tabla «Mantenimiento».

|   Identificador_M | Descripcion_M         | Fecha_M    | Vehículo_Matricula_V   |
|------------------:|:----------------------|:-----------|:-----------------------|
|                 1 | Cambio de aceite      | 2020-03-01 | ABCD123                |
|                 2 | Reemplazo de frenos   | 2020-03-01 | ABCD123                |
|                 3 | Cambio de aceite      | 2020-07-15 | ABCD123                |
|                 4 | Alineación de ruedas  | 2021-01-01 | ABCD123                |
|                 5 | Alineación de ruedas  | 2020-04-25 | QRST345                |
|                 6 | Cambio de batería     | 2020-04-25 | QRST345                |
|                 7 | Alineación de ruedas  | 2021-08-31 | QRST345                |
|                 8 | Cambio de aceite      | 2020-03-01 | IJKL789                |
|                 9 | Reemplazo de frenos   | 2020-03-01 | IJKL789                |
|                10 | Mantenimiento general | 2021-01-01 | IJKL789                |
|                11 | Reparación carrocería | 2020-03-01 | GHIJ567                |
|                12 | Mantenimiento general | 2021-01-01 | GHIJ567                |
|                13 | Reparación carrocería | 2020-03-20 | KLMN890                |
|                14 | Cambio de aceite      | 2020-07-15 | KLMN890                |
|                15 | Alineación de ruedas  | 2021-09-09 | EFGH345                |
|                16 | Reparación de motor   | 2021-09-09 | EFGH345                |
|                17 | Reemplazo de frenos   | 2021-01-30 | CDEF234                |

## Q02 · Básica 2

Extraer el identificador_S y Direccion_S de todas las sedes.

|   identificador_S | Direccion_S         |
|------------------:|:--------------------|
|                 1 | Calle Principal 123 |
|                 2 | Avenida Central 456 |
|                 3 | Plaza Mayor 789     |
|                 4 | Paseo del Sol 234   |

## Q03 · Básica 3

Listar los diferentes dueños de aseguradoras, renombrando la columna y eliminando duplicados.

| DueñoAseguradora   |
|:-------------------|
| Fernando Alonso    |
| Pedro Martinez     |

## Q04 · Fácil 1

Obtener los vehículos BMW u Honda que pertenecen a la sede 2.

| Matricula_V   | Marca_V   | Modelo_V   | Caracteristicas_V                    |   Sede_identificador_S |
|:--------------|:----------|:-----------|:-------------------------------------|-----------------------:|
| KLMN890       | BMW       | Serie 3    | Motor de 3.0L, tracción trasera      |                      2 |
| UVWX678       | Honda     | Civic      | Motor híbrido, eficiencia energética |                      2 |

## Q05 · Fácil 2

Listar los nombres de los clientes cuyo nombre comienza por L.

| Nombre_C      |
|:--------------|
| Laura Torres  |
| Luis Martínez |

## Q06 · Fácil 3

Seleccionar los mantenimientos de 2021 que tienen una descripción no nula.

|   Identificador_M | Descripcion_M         | Fecha_M    | Vehículo_Matricula_V   |
|------------------:|:----------------------|:-----------|:-----------------------|
|                 4 | Alineación de ruedas  | 2021-01-01 | ABCD123                |
|                10 | Mantenimiento general | 2021-01-01 | IJKL789                |
|                12 | Mantenimiento general | 2021-01-01 | GHIJ567                |
|                17 | Reemplazo de frenos   | 2021-01-30 | CDEF234                |
|                 7 | Alineación de ruedas  | 2021-08-31 | QRST345                |
|                15 | Alineación de ruedas  | 2021-09-09 | EFGH345                |
|                16 | Reparación de motor   | 2021-09-09 | EFGH345                |

## Q07 · Intermedia 1

Contar los vehículos por sede y mostrar solo las sedes con más de cinco.

|   identificador_S |   NumeroVehiculos |
|------------------:|------------------:|
|                 1 |                 7 |

## Q08 · Intermedia 2

Obtener los clientes que han alquilado el vehículo IJKL789.

| Nombre_C       |
|:---------------|
| Javier Sánchez |
| María López    |

## Q09 · Intermedia 3

Para cada cliente, mostrar nombre, email en mayúsculas y longitud del email.

| Nombre_C       | Email_Mayusculas     |   Longitud_Email |
|:---------------|:---------------------|-----------------:|
| Ana Rodríguez  | CLIENTE6@EXAMPLE.COM |               20 |
| Andrés Gómez   | CLIENTE5@EXAMPLE.COM |               20 |
| Carlos Ramírez | CLIENTE3@EXAMPLE.COM |               20 |
| Javier Sánchez | CLIENTE7@EXAMPLE.COM |               20 |
| Juan Pérez     | CLIENTE1@EXAMPLE.COM |               20 |
| Laura Torres   | CLIENTE4@EXAMPLE.COM |               20 |
| Luis Martínez  | CLIENTE9@EXAMPLE.COM |               20 |
| María López    | CLIENTE2@EXAMPLE.COM |               20 |
| Sofía Herrera  | CLIENTE8@EXAMPLE.COM |               20 |

## Q10 · Difícil 1

Obtener los vehículos alquilados por el cliente que ha gastado más en alquileres.

| Matricula_V   | Marca_V   | Modelo_V   | Caracteristicas_V                       |   Sede_identificador_S |
|:--------------|:----------|:-----------|:----------------------------------------|-----------------------:|
| EFGH345       | Honda     | Accord     | Motor turbo de 1.5L, control de crucero |                      3 |
| IJKL789       | Toyota    | Corolla    | Motor de 2.0L, tracción delantera       |                      3 |

## Q11 · Difícil 2

Listar las matrículas de vehículos que han sido alquilados y han tenido mantenimientos.

| Matricula_V   |
|:--------------|
| ABCD123       |
| CDEF234       |
| EFGH345       |
| GHIJ567       |
| IJKL789       |
| KLMN890       |
| QRST345       |

## Q12 · Difícil 3

Para cada vehículo, obtener la diferencia entre el precio máximo y mínimo de alquiler.

| Matricula_V   |   PrecioMaximo |   PrecioMinimo |   DiferenciaPrecio |
|:--------------|---------------:|---------------:|-------------------:|
| ABCD012       |            170 |             50 |                120 |
| ABCD123       |             90 |             90 |                  0 |
| CDEF234       |             90 |             90 |                  0 |
| EFGH345       |            220 |             50 |                170 |
| GHIJ567       |             50 |             50 |                  0 |
| IJKL678       |             50 |             50 |                  0 |
| IJKL789       |            135 |             50 |                 85 |
| KLMN890       |            135 |            135 |                  0 |
| MNOP012       |             90 |             90 |                  0 |
| QRST345       |             90 |             50 |                 40 |
| UVWX678       |             50 |             50 |                  0 |

## Q13 · Compleja

Obtener nombre y teléfono de clientes que alquilaron BMW/Honda en la sede con más vehículos y su gasto total.

| Cliente                    |   GastoTotal |
|:---------------------------|-------------:|
| Carlos Ramírez - 634567890 |          350 |
| Luis Martínez - 690123456  |          220 |
| Andrés Gómez - 656789012   |          200 |
| Laura Torres - 645678901   |          100 |
