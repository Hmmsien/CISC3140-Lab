DROP TABLE IF EXISTS Judges;
DROP TABLE IF EXISTS Car_Score;
DROP TABLE IF EXISTS Cars_Info;
DROP TABLE IF EXISTS Car_Ranking;

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

CREATE TABLE Car_Ranking(
   Car_ID int,
   Score int);

INSERT INTO Car_Ranking SELECT * FROM Car_Score ORDER BY Car_Score DESC;

.mode csv
.output extract1.csv
SELECT * FROM Car_Ranking;

