const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
  host: 'sql5.freesqldatabase.com',
  user: 'sql5442699',
  password: 'Ww1BXcE42f',
  database: 'sql5442699',
  port: '3306',
  multipleStatements: true
});

mysqlConnection.connect(function (err) {
  if (err) {
    console.error(err);
    return;
  } else {
    console.log('db is connected');
  }
});

module.exports = mysqlConnection;
