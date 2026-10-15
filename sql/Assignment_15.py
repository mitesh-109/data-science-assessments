import sqlite3
import pandas as pd

# Q1. Create foodie.db and Restaurants table
conn = sqlite3.connect('foodie.db')
cur = conn.cursor()
cur.execute('''
CREATE TABLE IF NOT EXISTS Restaurants (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    cuisine TEXT,
    rating REAL
)''')
conn.commit()

# Q2. Insert and fetch rating above 4.0
cur.executemany('INSERT INTO Restaurants (name, cuisine, rating) VALUES (?, ?, ?)', [
    ('Swagat', 'South Indian', 4.3),
    ('Pizza Palace', 'Italian', 4.6),
    ('Dragon Wok', 'Chinese', 3.8)
])
conn.commit()

print("--- Restaurants rating > 4.0 ---")
cur.execute('SELECT name FROM Restaurants WHERE rating > 4.0')
for row in cur.fetchall():
    print(row[0])

# Q3. Load into Pandas, show top 2 rows
df = pd.read_sql_query('SELECT * FROM Restaurants', conn)
print("\n--- Top 2 Rows ---")
print(df.head(2))

# Q4. Add delivery_charge and final_rating
df['delivery_charge'] = 50
df['final_rating'] = df.apply(
    lambda r: r['rating'] + 0.1 if r['cuisine'] == 'Italian' else r['rating'],
    axis=1
)
print("\n--- Processed DataFrame ---")
print(df)

# Q5. Daily summary to CSV
top = pd.read_sql_query('SELECT * FROM Restaurants WHERE rating > 4.5', conn)
top.to_csv('top_rated_restaurants.csv', index=False)
print('\nSaved top_rated_restaurants.csv successfully!')

conn.close()