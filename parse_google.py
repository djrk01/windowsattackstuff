import sqlite3
import os
import glob

# Dynamically find the first available Chrome profile
profile_dirs = glob.glob(os.path.join(os.environ['APPDATA'], 'Local', 'Google', 'Chrome', 'User  Data', 'Profile *'))
history_db_path = os.path.join(profile_dirs[0], 'History') if profile_dirs else None

if history_db_path and os.path.exists(history_db_path):
    # Connect to the database
    conn = sqlite3.connect(history_db_path)
    c = conn.cursor()

    # Get all tables in the database
    c.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = c.fetchall()

    # Parse each table
    for table in tables:
        table_name = table[0]
        print(f"Table: {table_name}")
        c.execute(f"SELECT * FROM {table_name};")
        rows = c.fetchall()
        for row in rows:
            print(row)

    # Close the connection
    conn.close()
else:
    print("No profile found or History database does not exist.")