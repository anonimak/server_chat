const config_db = require('../config/config_db');
var mysql = require('mysql2');

//var db = mysql.createConnection(config_db);
var db = mysql.createPool(config_db);

// db.connect(function (err) {
//     if (err) {
//         console.error('error connecting: ' + err.stack);
//         return;
//     }

//    console.log('connected as id ' + db.threadId);
// });

module.exports = db.promise();


// db.end();
