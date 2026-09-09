#!/usr/bin/env python3
"""Valida las 13 consultas contra los datos del SQL original."""

from __future__ import annotations
import ast
import re
import sqlite3
from pathlib import Path
import pandas as pd

BASE_SQL = Path("sql/00_base_datos_original.sql")
QUERIES_SQL = Path("sql/01_consultas_resueltas.sql")

EXPECTED_ROWS = {
    "Q01": 17, "Q02": 4, "Q03": 2, "Q04": 2, "Q05": 2,
    "Q06": 7, "Q07": 1, "Q08": 2, "Q09": 9, "Q10": 2,
    "Q11": 7, "Q12": 11, "Q13": 4,
}

INSERT_RE = re.compile(
    r"INSERT INTO `mydb`\.`([^`]+)` \((.*?)\) VALUES \((.*?)\);",
    re.S,
)


def parse_source_data(text: str) -> dict[str, pd.DataFrame]:
    records: dict[str, list[dict]] = {}
    for match in INSERT_RE.finditer(text):
        table = match.group(1)
        columns = [c.strip().strip("`") for c in match.group(2).split(",")]
        values_text = re.sub(
            r"str_to_date\('(\d{2})/(\d{2})/(\d{4})',\s*'%d/%m/%Y'\)",
            lambda m: repr(f"{m.group(3)}-{m.group(2)}-{m.group(1)}"),
            match.group(3),
        )

        raw_values, current, in_quote = [], "", False
        for char in values_text:
            if char == "'":
                in_quote = not in_quote
                current += char
            elif char == "," and not in_quote:
                raw_values.append(current.strip())
                current = ""
            else:
                current += char
        raw_values.append(current.strip())

        values = []
        for value in raw_values:
            if value.upper() == "NULL":
                values.append(None)
            else:
                try:
                    values.append(ast.literal_eval(value))
                except Exception:
                    try:
                        values.append(int(value))
                    except Exception:
                        values.append(float(value))

        records.setdefault(table, []).append(dict(zip(columns, values)))

    return {table: pd.DataFrame(rows) for table, rows in records.items()}


def extract_queries(text: str) -> dict[str, str]:
    result = {}
    # Each canonical block begins with "-- Qxx ·".
    blocks = re.split(r"(?=-- Q\d{2} ·)", text)
    for block in blocks:
        m = re.search(r"-- (Q\d{2}) ·", block)
        if not m:
            continue
        qid = m.group(1)
        body_lines = [
            line for line in block.splitlines()
            if not line.lstrip().startswith("--")
        ]
        body = "\n".join(body_lines).strip()
        if body.endswith(";"):
            body = body[:-1]
        result[qid] = body
    return result


def main() -> None:
    source = BASE_SQL.read_text(encoding="utf-8")
    tables = parse_source_data(source)

    conn = sqlite3.connect(":memory:")
    conn.create_function(
        "CHAR_LENGTH", 1,
        lambda x: len(x) if x is not None else None,
    )
    conn.create_function(
        "CONCAT", -1,
        lambda *xs: "".join("" if x is None else str(x) for x in xs),
    )

    for name, df in tables.items():
        df.to_sql(name, conn, index=False)

    query_text = QUERIES_SQL.read_text(encoding="utf-8")
    # Remove USE, which SQLite does not support.
    query_text = re.sub(r"^\s*USE\s+`mydb`;\s*", "", query_text, flags=re.M)
    queries = extract_queries(query_text)

    missing = sorted(set(EXPECTED_ROWS) - set(queries))
    if missing:
        raise SystemExit(f"Faltan consultas: {missing}")

    for qid in sorted(EXPECTED_ROWS):
        result = pd.read_sql_query(queries[qid], conn)
        expected = EXPECTED_ROWS[qid]
        if len(result) != expected:
            raise SystemExit(
                f"{qid}: se esperaban {expected} filas y se obtuvieron {len(result)}"
            )
        print(f"{qid}: PASS ({len(result)} filas)")

    # Assertions de contenido en consultas críticas.
    q07 = pd.read_sql_query(queries["Q07"], conn)
    assert q07.iloc[0]["identificador_S"] == 1
    assert q07.iloc[0]["NumeroVehiculos"] == 7

    q10 = pd.read_sql_query(queries["Q10"], conn)
    assert set(q10["Matricula_V"]) == {"EFGH345", "IJKL789"}

    q13 = pd.read_sql_query(queries["Q13"], conn)
    assert q13["GastoTotal"].tolist() == [350, 220, 200, 100]

    print("OK: 13/13 consultas validadas y controles críticos superados.")


if __name__ == "__main__":
    main()
