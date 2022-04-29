lab2:
	awk -f sepTable.awk data.csv
	sqlite3 cars.db < script.sql
