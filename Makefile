lab4:
	awk -f src/sepTable.awk data/data.csv
	sqlite3 cars.db < src/script.sql
