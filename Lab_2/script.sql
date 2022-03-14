.mode csv

DROP TABLE IF EXISTS Judges;
CREATE TABLE Judges (
    Judge_ID text,
    Judge_Name text);
.mode csv
.import \Judges.csv Judges
DELETE FROM Judges WHERE Judge_ID = 'Judge_ID';

DROP TABLE IF EXISTS Car_Score;
CREATE TABLE Car_Score(
   Car_ID int primary key,
   Car_Score int);
.mode csv
.import \Car_Score.csv Car_Score
DELETE FROM Car_Score WHERE Car_ID = 'Car_ID';

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
DELETE FROM Cars_Info WHERE Car_ID = 'Car_ID';

DROP TABLE IF EXISTS Ranking;
CREATE TABLE Ranking(
   Car_ID int primary key,
   Year int,
   Make text,
   Model text,
   Score int);

INSERT INTO Ranking SELECT Cars_Info.Car_ID, Cars_Info.Year,Cars_Info.Make,Cars_Info.Model,Car_Score.Car_Score
From Cars_Info 
INNER JOIN Car_Score ON Car_Score.Car_ID = Cars_Info.Car_ID
ORDER BY  Car_Score.Car_Score DESC;

DROP TABLE IF EXISTS Rank;
CREATE TABLE Rank(
   Rank int,
   Car_ID int primary key,
   Year int,
   Make text,
   Model text);
INSERT INTO Rank SELECT Score,Car_ID,Year,Make,Model FROM Ranking;

UPDATE Rank
SET Rank = rowid;   

.headers on
.mode csv
.output extract1.csv
SELECT * From Rank;


DROP TABLE IF EXISTS Top3;
CREATE TABLE Top3 (
	Rank INT,
	Car_ID INT,
	Year INT,
	Make TEXT,
	Model TEXT,
	Total INT
);

INSERT INTO Top3 SELECT rowid,* FROM Ranking ORDER BY Score DESC
where (
   select count(*) from Ranking as f
   where f.Make = Ranking.Make
) <= 3;

.headers ON
.mode csv
.output extract2.csv
SELECT * FROM Top3;
