# Matriz de trazabilidad de la rúbrica

| Criterio | Peso | Consultas | Evidencia técnica |
|---|---:|---|---|
| Consultas básicas | 10 % | Q01–Q03 | `SELECT`, `FROM`, `DISTINCT`, alias con `AS` |
| Consultas fáciles | 20 % | Q04–Q06 | `WHERE`, `IN`, `LIKE`, `BETWEEN`, `IS NOT NULL`, `ORDER BY` |
| Consultas intermedias | 30 % | Q07–Q09 | `GROUP BY`, `HAVING`, `JOIN`, `UPPER`, `CHAR_LENGTH` |
| Consultas difíciles | 30 % | Q10–Q12 | subconsulta correlacionada por criterio, `LIMIT`, `INTERSECT`, `MAX`, `MIN`, resta |
| Consulta compleja | 10 % | Q13 | `CONCAT`, `SUM`, `JOIN`, subconsultas, `IN`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| **Total** | **100 %** | **Q01–Q13** | Cobertura completa |

## Decisiones de calidad

- Todos los identificadores con acentos se protegen con *backticks*.
- Se añaden `ORDER BY` deterministas para que las capturas sean repetibles.
- Q10 desempata el mayor gasto por DNI para evitar resultados no deterministas si existiera empate.
- Q11 usa `INTERSECT` para evidenciar explícitamente operadores de conjuntos. Se incluye una alternativa `JOIN` para MySQL anterior a 8.0.31.
- Q13 calcula el gasto total del cliente en **todos** sus alquileres después de identificar qué clientes cumplen la condición BMW/Honda + sede máxima; evita limitar el gasto a los alquileres usados únicamente como filtro.
