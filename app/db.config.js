const mysql = require('mysql2');
const connection = mysql.createConnection({
  multipleStatements: true,
  host     : 'localhost',
  user     : 'root',
  password : '02082000',
  database : 'theater'
});

module.exports = connection;