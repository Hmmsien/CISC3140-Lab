DROP TABLE IF EXISTS Judges;
DROP TABLE IF EXISTS Car_Score;
DROP TABLE IF EXISTS Cars_Info;
DROP TABLE IF EXISTS Rank;
DROP TABLE IF EXISTS Ranking;

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

CREATE TABLE Ranking(
   Car_ID primary key,
   Car_Score int);

INSERT INTO Ranking SELECT * FROM Car_Score Order By Car_Score DESC;

CREATE TABLE Rank(
   Rank int,
   Car_ID primary key);

INSERT INTO Rank(Rank,Car_ID) SELECT rowid,Car_ID FROM Ranking;

.mode csv
.output extract1.csv
--SELECT Rank.Rank, Rank.Car_ID, Cars_Info.Year,Cars_Info.Make,Cars_Info.Model
--From Rank
--INNER JOIN Cars_Info on Cars_Info.Car_ID = Rank.Car_ID;
select * from Rank;

