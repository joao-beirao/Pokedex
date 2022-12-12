import pyodbc 

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=localhost;'
                      'Database=pokedex;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()
cursor.execute('SELECT * FROM pokemons')

for i in cursor:
    print(i)