from tqdm import tqdm
import csv
import sys
import MySQLdb

conn = MySQLdb.connect(host="127.0.0.1", user="username", password="password", database="amazon_prime")

cursor = conn.cursor()
csv_data = csv.reader(open('acting_credits.csv'))
header = next(csv_data)

print('Importing the CSV Files')
for row in tqdm(csv_data):
    #print(row)
    cursor.execute(
        "INSERT INTO acting_credits (actor_id, titles_id, character_name, role_name) VALUES (%s, %s, %s, %s)", row)
   
conn.commit()
cursor.close()
print('Done')
