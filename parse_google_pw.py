import os
import sqlite3
import csv
import win32crypt  # Requires pywin32
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa
from datetime import datetime
import json
import base64

# Define the path to the Chrome history and login data databases
data_path = os.path.expanduser('~') + r"\AppData\Local\Google\Chrome\User Data\Default"
history_db = os.path.join(data_path, 'History')
login_db = os.path.join(data_path, 'Login Data')

# Function to decrypt Chrome passwords
def decrypt_password(encrypted_password):
    try:
        # Decrypt the password using Windows Data Protection API
        return win32crypt.CryptUnprotectData(encrypted_password)[1].decode()
    except Exception as e:
        print(f"Error decrypting password: {e}")
        return None

# Connect to the history database
conn_history = sqlite3.connect(history_db)
cursor_history = conn_history.cursor()

# Query to fetch URLs and their visit times
query_history = """
SELECT urls.url, urls.title, urls.visit_count, 
datetime(urls.last_visit_time / 1000000 + (strftime('%s', '1601-01-01')), 'unixepoch', 'localtime') 
FROM urls ORDER BY urls.last_visit_time DESC;
"""

# Execute the query for history
cursor_history.execute(query_history)
history_results = cursor_history.fetchall()

# Write history results to a CSV file
with open('chrome_history.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['URL', 'Title', 'Visit Count', 'Last Visit Time'])  # Header
    for row in history_results:
        writer.writerow(row)

# Connect to the login database
conn_login = sqlite3.connect(login_db)
cursor_login = conn_login.cursor()

# Query to fetch saved passwords
query_login = """
SELECT origin_url, username_value, password_value FROM logins;
"""

# Execute the query for passwords
cursor_login.execute(query_login)
login_results = cursor_login.fetchall()

# Write password results to a CSV file
with open('chrome_passwords.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['Origin URL', 'Username', 'Password'])  # Header
    for row in login_results:
        origin_url = row[0]
        username = row[1]
        encrypted_password = row[2]
        decrypted_password = decrypt_password(encrypted_password)
        writer.writerow([origin_url, username, decrypted_password])

# Close the database connections
conn_history.close()
conn_login.close()

print("Google Chrome browsing history has been written to chrome_history.csv.")
print("Google Chrome saved passwords have been written to chrome_passwords.csv.")