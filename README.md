# Database-Login

Made in NodeJS &amp; ExpressJS

# Requirements

```js
NodeJS 14.18.0+
A way to show the database
Redis-Server
MySQL
```

To use this project, you need to open your `Terminal` and write `npm i` then it can download almost dependencies needed to use it
You also need to install MySQL `sudo apt get mysql` (or mariadb) and also Redis-Server `sudo apt get redis-server`

# Functions

**Database funktioner**

```js
getAllUserIDs(); // Get a list of all ids in the system
getUserID("name"); // Get a users id from their first name
getUserFirst(id); // Get a person first name from their id
getUserMiddle(id); // Get persons middle name from their id
getUserLast(id); // Get a users surname from their id
getUser(id); // To get all details about a user
addUser(firstname, middlename, surname, role, pswd, birth); // Add a user to the database
```

# Database

You need to make a database, a table called users and edit the code to use the table names. (there are already premade once, just remove those and replace it with whatever info you need). IDs is autoincrementing in the database.

Also make a table called users with **_Header (VARCHAR), Body (VARCHAR), StartDate (DATE), EndDate (DATE)_**

# Disclaimer

Users table is in case you wanna add birthdays to display that in the future.

# Hardware

PC:
I5-3470 CPU
Storage-120 gb hdd
8gb ram

Extended Router

Raspberry Pi
OS: Ubuntu 20.04
