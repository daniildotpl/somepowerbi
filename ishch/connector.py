import os
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError
from dotenv import load_dotenv
from docx import Document
from docx.enum.text import WD_ALIGN_PARAGRAPH



load_dotenv()

dbhost = os.getenv('dbhost')
dbport = os.getenv('dbport')
dbname = os.getenv('dbname')
dbuser = os.getenv('dbuser')
dbpass = os.getenv('dbpass')
# print(f'{dbhost}:{dbport}:{dbname}:{dbuser}:{dbpass}')


def my_connection():
    try:
        engine = create_engine(f"mysql+pymysql://{dbuser}:{dbpass}@{dbhost}:{dbport}/{dbname}")
        with engine.connect() as test_conn:
            print("Successful connection")
        return engine
        
    except SQLAlchemyError as e:
        print(f"Error: {e}")
        return False
