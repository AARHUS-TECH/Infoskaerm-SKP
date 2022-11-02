const mysql = require("mysql");
var fName = "";
var mName = "";
var lName = "";
var allDetails = "";
var store = [];
var allIds = [];
var userInfoID = [];
var userInfo = "";


function getConnection() {
  return mysql.createConnection({
    host: "localhost",
    user: "admin3",
    password: "password",
    database: "infoscreendb",
  });
}

// Get connection to the database
const con = getConnection();

// Get all users in the system
function getAllUsers() {
  var personList = []
    con.query("SELECT * FROM users", (err, rows) => {
        if (err) {
            throw err;
        }
        else {
            // Loop check on each row
            for (var i = 0; i < rows.length; i++) {

                // Create an object to save current row's data
                var person = {
                    'firstname': rows[i].fornavn,
                    'lastname': rows[i].efternavn,
                    'status': rows[i].status,
                    'id': rows[i].id
                }
                // Add object into array
                personList.push(person);
            }
        }
        return personList;
  });
}

// Get all details about a person from their ID
function getUser(i) {
	con.query('SELECT * FROM users', (err, rows) => {
		if (err) throw err;
		if (rows[i].mellemnavn == null)
			allDetails = "ID: " + i + ", Navn: " + rows[i].Fornavn + " " + rows[i].Efternavn + ", Role: " + rows[i].status + ", Birthday:" + rows[i].birthday
		else if (rows[i].mellemnavn != null)
			allDetails = "ID: " + i + ", Navn: " + rows[i].Fornavn + " " + rows[i].mellemnavn + " " + rows[i].Efternavn + ", Role: " + rows[i].status + ", Birthday:" + rows[i].birthday
	});
	return allDetails
}

// Get users first name from their ID
function getUserFirst(i) {
  con.query("SELECT * FROM users", (err, rows) => {
    if (err) console.log(err);

    fName = rows[i].Fornavn;
  });
  return fName;
}

// Get users middle name from their ID
function getUserMellem(i) {
  con.query("SELECT * FROM users", (err, rows) => {
    if (err) throw err;
    mName = rows[i].mellemnavn;
  });
  return mName;
}

// Get users surname from their ID
function getUserLast(i) {
  con.query("SELECT * FROM users", (err, rows) => {
    if (err) throw err;
    lName = rows[i].Efternavn;
  });
  return lName;
}

// HACK
function removeDuplicates(data) {
  return [...new Set(data)];
}

// Get user info from first name
function getUserInfo(i) {
  con.query('SELECT Id FROM users WHERE Fornavn ="' + i + '"', (err, rows) => {
    //Selects only users with first name
    if (err) throw err;
    con.query("SELECT * FROM users", (err, student) => {
      // makes it possible to get every user and select from them
      if (err) throw err;

      for (var d = 0; d < student.length; d++) {
        var data = "";
        rows.forEach(function (getDataID) {
          if ((student.Fornavn = i)) {
            data = JSON.stringify(getDataID)
              .replace(`{"Id":`, "")
              .replace("}", "");
            if (student[d].Fornavn == i)
              store.push(
                "ID: " +
                  parseInt(data) +
                  ", Navn: " +
                  i +
                  " " +
                  student[parseInt(data)].Efternavn +
                  ", Role: " +
                  student[parseInt(data)].status
              );
          }
        });
      }

      if (store.length == 0)
        return console.log("ERROR: Fornavn ikke fundet i databasen");

      return userInfoID.push(removeDuplicates(store));
    });
  });
}

// Få alle IDs
function getAllUserIDs() {
  con.query("SELECT * FROM users", (err, rows) => {
    if (err) throw err;
    for (var i = 0; i < rows.length; i++) {
      allIds[i] = rows[i].Id;
    }
  });
  return allIds;
}

// Tilføj bruger til databasen
function addUser(finame, mlmnavn, sname, stat, pswd) {
  if (mlmnavn != null) {
    if (pswd == null)
      var sql = `INSERT INTO users(Fornavn, mellemnavn, Efternavn, status, password) VALUES ('${finame}', '${mlmnavn}', '${sname}', '${stat}', ${pswd})`;

    if (pswd != null)
      var sql = `INSERT INTO users(Fornavn, mellemnavn, Efternavn, status, password) VALUES ('${finame}', '${mlmnavn}', '${sname}', '${stat}', '${pswd}')`;
  }

  if (mlmnavn == null) {
    if (pswd == null)
      var sql = `INSERT INTO users(Fornavn, mellemnavn, Efternavn, status, password) VALUES ('${finame}', ${mlmnavn}, '${sname}', '${stat}', ${pswd})`;

    if (pswd != null)
      var sql = `INSERT INTO users(Fornavn, mellemnavn, Efternavn, status, password) VALUES ('${finame}', ${mlmnavn}, '${sname}', '${stat}', '${pswd}')`;
  }

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 user added");
  });
}

// Tilføj nyhed
function addNews(title, body, startdato, slutdato) {
	var sql = `INSERT INTO news(Header, Body, Startdate, Enddate, Active) VALUES ('${title}', '${body}', ${startdato}, ${slutdato}, 1)`;
	con.query(sql, function(err, result) {
		if (err) throw err;
		console.log("1 news information added");
	});
}

// Set active til 0, hvor datoen er "udløbet"
function removeNews() {
  con.query(
    "UPDATE news SET active=0 WHERE Enddate < now() - interval 1 DAY;",
    (err, rows) => {
      if (err) return console.log(err);
    }
  );
}


module.exports = {
  getUser,
  getUserFirst,
  getUserMellem,
  getUserLast,
  getAllUsers,
  getUserInfo,
  getAllUserIDs,
  getConnection,
  addUser,
  addNews,
  removeNews,
};
