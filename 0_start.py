import pandas as pd
from ishch.connector import my_connection
from sqlalchemy import text

engine = my_connection()

with open("ishch/0_start.sql", "r") as f:
    queries = f.read()
    queries = queries.split('###')

    for query in queries:
        query = text(query)
        print(query)
        connection = engine.connect()
        connection.execute(query)