import os

from database_connection import DatabaseConnection
from dotenv import load_dotenv

load_dotenv()

db_name = os.environ["DATABASE_NAME"]
db_path = os.environ["DATABASE_PATH"]

create_table_sql = """
CREATE TABLE IF NOT EXISTS readings (
    id  INTEGER PRIMARY KEY UNIQUE,
    room TEXT NOT NULL,
    temp REAL,
    humidity INTEGER,
    sensor_timestamp DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
"""


def create_table(conn):
    cursor = conn.cursor()
    cursor.execute(create_table_sql)


def main():
    with DatabaseConnection(db_name, db_path) as conn:
        try:
            create_table(conn)
        except Exception as e:
            raise Exception(f"{e}")


if __name__ == "__main__":
    main()
