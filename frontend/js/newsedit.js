const fruits = ["Banana", "Orange", "Apple", "Mango"];
let text = fruits.toString();

function myFunction() {
  document.getElementById("demo").innerHTML = fruits;
  alert("Hello! I am an alert box!");
}

window.onload = function () {
  // (B) ARRAY OF DATA
  var data = [
    { name: "doge", age: 14 },
    { name: "cate", age: 12 },
    { name: "birb", age: 9 },
    { name: "doggo", age: 5 },
    { name: "moon moon", age: 1 },
    { name: "awkward seal", age: 20 },
  ];

  // (C) CREATE HTML TABLE
  // (C1) HTML TABLE STRING
  var myTable = "<table><tr>";

  // (C2) LOOP THROUGH ARRAY & GENERATE ROWS-CELLS
  var perrow = 2; // 2 CELLS PER ROW
  data.forEach((value, i) => {
    // "NORMAL" CELL
    myTable += `<td>${value.name} ${value.age} </td>`;

    // CLICK ON CELL TO DO SOMETHING
    // myTable += `<td onclick="FUNCTION()">${value}</td>`;

    // TO PASS IN A RUNNING NUMBER OR PARAMETER
    // myTable += `<td onclick="FUNCTION(${i})">${value}</td>`;

    // BREAK INTO NEXT ROW
    var next = i + 1;
    if (next % perrow == 0 && next != data.length) {
      myTable += "</tr><tr>";
    }
  });

  // (C3) CLOSE THE TABLE STRING
  myTable += "</tr></table>";

  // (D) ATTACH HTML TO CONTAINER
  document.getElementById("container").innerHTML = myTable;
};

// test
function getConnection() {
  return mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "infoscreendb",
  });
}

// Get connection to the database

const mysql = require("mysql");

const con = getConnection();

con.connect((err) => {
  if (err) {
    console.log("Error connecting to DB");
    console.log(err);
    return;
  }
});
