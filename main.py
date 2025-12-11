from sqlmodel import *
from sqlalchemy import *
from datetime import *
from typing import *

# Создаём движок SQLAlchemy
engine = create_engine("postgresql+psycopg2://postgres:d7k_8TJsdt@localhost/postgres")
SQLModel.metadata.create_all(engine)