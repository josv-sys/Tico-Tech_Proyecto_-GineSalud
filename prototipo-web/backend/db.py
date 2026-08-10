import os

import psycopg
from psycopg.rows import dict_row

DB_CONFIG = {
    "host": os.environ.get("PGHOST", "localhost"),
    "port": os.environ.get("PGPORT", "5433"),
    "dbname": os.environ.get("PGDATABASE", "ginesalud"),
    "user": os.environ.get("PGUSER", "ginesalud"),
    "password": os.environ.get("PGPASSWORD", "ginesalud"),
}


def get_connection():
    return psycopg.connect(row_factory=dict_row, **DB_CONFIG)


def query(sql: str, params: tuple = ()):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            return cur.fetchall()


def execute(sql: str, params: tuple = ()):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            row = cur.fetchone() if cur.description else None
            conn.commit()
            return row
