DROP TABLE IF EXISTS Judges;
DROP TABLE IF EXISTS Car_Score;
DROP TABLE IF EXISTS Cars_Info;

CREATE TABLE Judges (
    Judge_ID text,
    Judge_Name text);
.mode csv
.import \Judges.csv Judges

CREATE TABLE Car_Score(
   Car_ID int primary key,
   Car_Score int);
.mode csv
.import \Car_Score.csv Car_Score

CREATE TABLE Cars_Info(
   Car_ID int primary key,
   Year int,
   Make text,
   Model text,
   Name text,
   Email text);
.mode csv
.import \Cars_Info.csv Cars_Info

.mode csv
.output extract1.csv

SELECT Car_Score.Car_Score,Car_Score.Car_ID,Cars_Info.Year,Cars_Info.Make,Cars_Info.Model
FROM Car_Score
INNER JOIN Cars_Info ON Cars_Info.Car_ID = Car_Score.Car_ID
ORDER BY Car_Score.Car_Score DESC;

