# Cierre técnico de la entrega

## Estado

- Base de datos original: incluida sin modificaciones funcionales en `sql/00_base_datos_original.sql`.
- Consultas canónicas: Q01–Q13 en `sql/01_consultas_resueltas.sql`.
- Validación automática: 13/13 consultas con cardinalidades correctas.
- Controles críticos: Q07, Q10 y Q13 verificados por contenido.
- Compatibilidad: alternativa a `INTERSECT` disponible para MySQL anterior a 8.0.31.
- Informe: preparado en DOCX con Calibri 12 e interlineado simple.
- Evidencia real pendiente de ejecución manual: capturas de los `Result Grid` de MySQL Workbench.

## Checklist antes de entregar

- [ ] Ejecutar `sql/00_base_datos_original.sql` en MySQL Workbench.
- [ ] Ejecutar Q01–Q13 individualmente desde `sql/01_consultas_resueltas.sql`.
- [ ] Confirmar que el número de filas coincide con `docs/RESULTADOS_ESPERADOS.md`.
- [ ] Obtener 13 capturas reales mostrando consulta y `Result Grid`.
- [ ] Sustituir los 13 marcadores rojos del DOCX por las capturas correspondientes.
- [ ] Comprobar que el documento final no supera 15 páginas.
- [ ] Entregar el DOCX final y, si se solicita, el fichero SQL de consultas.

## Resultados críticos de control

| Consulta | Control esperado |
|---|---|
| Q07 | Sede 1 · 7 vehículos |
| Q10 | `EFGH345`, `IJKL789` |
| Q11 | 7 matrículas comunes |
| Q13 | Gastos: 350, 220, 200, 100 |

## Criterio de evidencia

Las tablas de `docs/RESULTADOS_ESPERADOS.md` son una referencia de comprobación reproducible. No sustituyen la evidencia exigida por la actividad. Las capturas finales deben proceder de una ejecución real en MySQL Workbench.
