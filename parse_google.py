import os
import sqlite3
import csv
from datetime import datetime

# Define the path to the Chrome history database
data_path = os.path.expanduser('~') + r"\AppData\Local\Google\Chrome\User Data\Default"
history_db = os.path.join(data_path, 'History')

# Connect to the database
conn = sqlite3.connect(history_db)
cursor = conn.cursor()

# Query to fetch URLs and their visit times
query = """
SELECT urls.url, urls.title, urls.visit_count, 
datetime(urls.last_visit_time / 1000000 + (strftime('%s', '1601-01-01')), 'unixepoch', 'localtime') 
FROM urls ORDER BY urls.last_visit_time DESC;
"""

# Execute the query
cursor.execute(query)
results = cursor.fetchall()

# Write results to a CSV file
with open('chrome_history.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['URL', 'Title', 'Visit Count', 'Last Visit Time'])  # Header
    for row in results:
        writer.writerow(row)

# Close the database connection
conn.close()

print("Google Chrome browsing history has been written to chrome_history.csv.")