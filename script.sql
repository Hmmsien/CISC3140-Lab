sqlite3 cars.db << 'EOS'
.headers on
.mode csv

DROP TABLE IF EXISTS Judges;
CREATE TABLE Judges (
    Judge_ID text,
    Judge_Name text);
.mode csv
.import \Judges.csv Judges

DROP TABLE IF EXISTS Car_Score;
CREATE TABLE Car_Score(
   Car_ID int primary key,
   Car_Score int);
.mode csv
.import \Car_Score.csv Car_Score

DROP TABLE IF EXISTS Cars_Info;
CREATE TABLE Cars_Info(
   Car_ID int primary key,
   Year int,
   Make text,
   Model text,
   Name text,
   Email text);
.mode csv
.import \Cars_Info.csv Cars_Info

DROP TABLE IF EXISTS Ranking;
CREATE TABLE Ranking(
   Car_ID int primary key,
   Year int,
   Make text,
   Model text);

INSERT INTO Ranking SELECT Cars_Info.Car_ID, Cars_Info.Year,Cars_Info.Make,Cars_Info.Model
From Cars_Info 
INNER JOIN Car_Score ON Car_Score.Car_ID = Cars_Info.Car_ID
ORDER BY  Car_Score.Car_Score DESC;

DROP TABLE IF EXISTS Rank;
CREATE TABLE Rank(
   Ranking int,
   Car_ID int primary key,
   Year int,
   Make text,
   Model text);
INSERT INTO Rank (Ranking, Car_ID, Year, Make, Model) SELECT rowid,Car_ID,Year,Make,Model FROM Ranking;   

.mode csv
.output extract1.csv
SELECT * From Rank;

.mode column
.output

EOS
