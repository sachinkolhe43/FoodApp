const mysql = require("mysql");

const connection = mysql.createConnection({
    connectionLimit:20,
    user: "root",
    password: "",
    host: "localhost",
    port: 3306,
    database: "foodapp",
    timezone: 'utc'
});

// connection.connect();


module.exports = {connection};
