# CISC3140-Lab4
Backend API for car data.

## Description:
The objective of this lab is to build a backend API using a combination of SQL and JavaScript to enable users to view data that is stored in a database as well as update data.

-----------------------------------------------------------------------------------------------------------------------------
## Dependencies:
* SQLite3
* NodeJS
* Express  

----------------------------------------------------------------------------------------------------------------------------
## Getting Started:
Copy repo to local machine. The repo contains a csv file named `data.csv`
```sh
$ git clone git@github.com:jiaojiaon/CISC3140_Lab4.git
$ git submodule init
$ git submodule update
```
Run using the command below to create database tables in sql and csv. 
```sh
$ make lab4
```
Run using the command below to install all dependencies  
Then start server to connect database
```
npm i
npm start
```

### Documentation

- [API_Endpoint.md](./API_Endpoint.md): A file containing a description of each endpoint provided by the API. 



