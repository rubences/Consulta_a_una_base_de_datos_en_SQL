# MUBIO06 · Actividad 1 · Consulta a una base de datos en SQL

[![SQL QA](https://github.com/rubences/Consulta_a_una_base_de_datos_en_SQL/actions/workflows/ci.yml/badge.svg)](https://github.com/rubences/Consulta_a_una_base_de_datos_en_SQL/actions/workflows/ci.yml)

Resolución reproducible de la actividad de consultas SQL sobre la base de datos de alquiler de vehículos suministrada por la asignatura.

## Estado de validación

La solución canónica contiene **13/13 consultas** y la validación semántica automatizada comprueba las cardinalidades esperadas y tres controles críticos de contenido. La ejecución de referencia está en verde en GitHub Actions.

| Bloque | Consultas | Estado |
|---|---|---|
| Básicas | Q01–Q03 | PASS |
| Fáciles | Q04–Q06 | PASS |
| Intermedias | Q07–Q09 | PASS |
| Difíciles | Q10–Q12 | PASS |
| Compleja | Q13 | PASS |

## Entregables principales

- `sql/01_consultas_resueltas.sql`: solución canónica de las 13 consultas.
- `MUBIO06_Actividad1_Informe_preparado.docx`: informe preparado para completar con capturas reales de MySQL Workbench.
- `docs/RESULTADOS_ESPERADOS.md`: resultados calculados a partir de la base suministrada.
- `docs/MATRIZ_RUBRICA.md`: trazabilidad 10/10 de la rúbrica.
- `docs/GUIA_CAPTURAS.md`: procedimiento para obtener la evidencia exigida.
- `docs/CIERRE_ENTREGA.md`: checklist técnico final antes de entregar.

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

GitHub Actions ejecuta esta validación en cada `push` y `pull_request`. Además de exigir Q01–Q13, comprueba específicamente que:

- Q07 devuelve la sede 1 con 7 vehículos;
- Q10 devuelve `EFGH345` e `IJKL789` para el cliente de mayor gasto;
- Q13 devuelve gastos totales 350, 220, 200 y 100 en el orden esperado.

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
│   ├── CIERRE_ENTREGA.md
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
