# Guía de capturas para la entrega

La actividad exige, como mínimo, la sentencia SQL y una **captura real del resultado devuelto por MySQL**. No conviene sustituir esa evidencia por una tabla fabricada.

## Flujo recomendado

1. Importar `sql/00_base_datos_original.sql` en MySQL Workbench.
2. Comprobar que el esquema activo es `mydb`.
3. Abrir `sql/01_consultas_resueltas.sql`.
4. Ejecutar cada consulta por separado.
5. En cada captura deben verse:
   - la sentencia SQL o, al menos, la consulta seleccionada;
   - el `Result Grid`;
   - las columnas y filas suficientes para demostrar el resultado.
6. Comparar el número de filas con `docs/RESULTADOS_ESPERADOS.md`.
7. Insertar cada captura en `MUBIO06_Actividad1_Informe_preparado.docx` sustituyendo el marcador correspondiente.

## Filas esperadas

| Consulta | Filas |
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

## Controles especialmente importantes

- Q07 debe devolver únicamente la sede **1**, con **7 vehículos**.
- Q10 debe identificar al cliente con mayor gasto total (355) y devolver `EFGH345` e `IJKL789`.
- Q11 debe devolver 7 matrículas comunes a alquileres y mantenimientos.
- Q13 debe devolver, por este orden, a Carlos Ramírez (350), Luis Martínez (220), Andrés Gómez (200) y Laura Torres (100).
