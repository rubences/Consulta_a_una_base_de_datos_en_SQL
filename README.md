# MUBIO06 · Actividad 1 · Consulta a una base de datos en SQL

Resolución reproducible de la actividad de consultas SQL sobre la base de datos de alquiler de vehículos suministrada por la asignatura.

## Entregables principales

- `sql/01_consultas_resueltas.sql`: solución canónica de las 13 consultas.
- `MUBIO06_Actividad1_Informe_preparado.docx`: informe preparado para completar con capturas reales de MySQL Workbench.
- `docs/RESULTADOS_ESPERADOS.md`: resultados calculados a partir de la base suministrada.
- `docs/MATRIZ_RUBRICA.md`: trazabilidad 10/10 de la rúbrica.
- `docs/GUIA_CAPTURAS.md`: procedimiento para obtener la evidencia exigida.

## Ejecución en MySQL Workbench

1. Abrir y ejecutar `sql/00_base_datos_original.sql`.
2. Verificar que existe el esquema `mydb`.
3. Abrir `sql/01_consultas_resueltas.sql`.
4. Ejecutar Q01–Q13 individualmente y capturar sus `Result Grid`.
5. Comprobar cada salida con `docs/RESULTADOS_ESPERADOS.md`.
6. Sustituir en el DOCX los marcadores de captura por evidencias reales.

La consulta Q11 utiliza `INTERSECT`, disponible desde MySQL 8.0.31. Para una versión anterior se incluye `sql/02_q11_compatibilidad_mysql_antiguo.sql`.

## Validación

`scripts/validate_queries.py` reconstruye los datos de los `INSERT` del SQL original y ejecuta las 13 consultas en SQLite con adaptadores mínimos para `CONCAT` y `CHAR_LENGTH`. La finalidad es comprobar semántica, cardinalidades y resultados de forma automatizada.

GitHub Actions ejecuta esta validación estática/semántica en cada `push` y `pull_request`.

## Estructura

```text
.
├── MUBIO06_Actividad1_Informe_preparado.docx
├── README.md
├── .gitignore
├── sql/
│   ├── 00_base_datos_original.sql
│   ├── 01_consultas_resueltas.sql
│   └── 02_q11_compatibilidad_mysql_antiguo.sql
├── docs/
│   ├── GUIA_CAPTURAS.md
│   ├── MATRIZ_RUBRICA.md
│   └── RESULTADOS_ESPERADOS.md
├── scripts/
│   └── validate_queries.py
└── .github/
    └── workflows/
        └── ci.yml
```

## Criterio académico

No se incluyen capturas simuladas. El documento final debe contener capturas obtenidas de una ejecución real en MySQL, tal como exige el enunciado.

El informe está preparado con Calibri 12 e interlineado simple y se ha diseñado para permanecer por debajo del máximo de 15 páginas una vez sustituidos los marcadores por capturas razonablemente recortadas.
