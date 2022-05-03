const sqlite3 = require('sqlite3').verbose()
const DBSOURCE = "cars.db"

// connect to the database
const db = require("./database.js")

// commect to the database
let db = new sqlite3.Database(DBSOURCE, (err) => {

    // throw an error if cannot connect to database
    if(err) {
        console.error(err.message)
        throw err

    // display a message to the console if successfully connected to the database
    } else {
        console.log('Connected to the SQLite database.')
    }
});

// export the database so it can be used by other files
module.exports = db
