from sqlalchemy import create_engine, text
import os
from dotenv import load_dotenv

class Database_operations:
    def __init__(self):
        load_dotenv()
        username = os.getenv('DB_USERNAME')
        password = os.getenv('DB_PASSWORD')
        host = os.getenv('DB_HOST')
        port = int(os.getenv('DB_PORT'))
        database = os.getenv('DB_NAME')
        DATABASE_URL = f"mysql+mysqlconnector://{username}:{password}@{host}:{port}/{database}"
        engine = create_engine(DATABASE_URL, echo=True)
        self.connection = engine.connect()

    def select_from_table(self, table_name):
        query = text(f"SELECT * FROM {table_name}")
        result = self.connection.execute(query)
        return result.fetchall()

    def select_from_table_with_where(self, table_name, where_string):
        query = text(f"SELECT * FROM {table_name} {where_string}")
        result = self.connection.execute(query)
        return result.fetchall()
    
    def select_column_from_table(self,column_name, table_name):
        query = text(f"SELECT {column_name} FROM {table_name}")
        result = self.connection.execute(query)
        flat_list = [value for row in result.fetchall() for value in row]
        return flat_list
    
    def insert_into_table(self, table_name, data):
        columns = ', '.join(data.keys())
        values = ', '.join([f'"{value}"' if isinstance(value, str) else str(value) for value in data.values()])
        query = text(f"INSERT INTO {table_name} ({columns}) VALUES ({values})")
        result = self.connection.execute(query)
        return result
    
    def update_table(self, table_name, data, where_column, where_value):
        set_values = ', '.join([f'{key}="{value}"' if isinstance(value, str) else f'{key}={value}' for key, value in data.items()])
        query = text(f"UPDATE {table_name} SET {set_values} WHERE {where_column} = :where_value")
        result = self.connection.execute(query, where_value=where_value)
        return result
    
    def delete_by_id(self, table_name, primary_key_column, id_value):
        query = text(f"DELETE FROM {table_name} WHERE {primary_key_column} = :id_value")
        result = self.connection.execute(query, id_value=id_value)
        return result


if __name__ == "__main__":
    obj = Database_operations()
    print(obj.select_from_table_with_where("visitors", 'WHERE v_name="Michael"'))

