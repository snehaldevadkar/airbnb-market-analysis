from pathlib import Path
import sqlite3
import pandas as pd

# Get the project folder reliably
project_folder = Path(__file__).resolve().parent.parent

# Path to the cleaned dataset
data_path = project_folder / "data" / "airbnb_clean.csv"

# Path to the SQLite database
database_path = project_folder / "sql" / "airbnb_analysis.db"

# Load the cleaned Airbnb dataset
df = pd.read_csv(data_path)

# Create the SQLite database
connection = sqlite3.connect(database_path)

# Load the dataset into a SQL table
df.to_sql("listings", connection, if_exists="replace", index=False)

print("Database created successfully!")
print("Table 'listings' loaded successfully!")
print("Rows:", len(df))
print("Database:", database_path)

connection.close()