import pandas as pd
from ishch.connector import my_connection
from sqlalchemy import text



def get_payload(engine):
    with open("ishch/1_task.sql", "r") as f:
        query = text(f.read())
    df = pd.read_sql(query, engine)
    return df


if __name__ == "__main__":
    print(get_payload(my_connection()))


