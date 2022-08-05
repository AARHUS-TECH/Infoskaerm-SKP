# Database-Login

Made in NodeJS &amp; ExpressJS

# Requirements

```js
NodeJS 14.18.0+
NPM
A way to show the database
Redis-Server
MySQL/MariaDB
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
addNews("title", "body", startDate, endDate); // Adds news to the database
getNewsTitle(); // Fetches the Titles
getNewsBody(); // Fetches the Bodies
```

# Database

You need to make a database, a table called users and edit the code to use the table names. (there are already premade once, just remove those and replace it with whatever info you need). IDs is autoincrementing in the database.

Also make a table called users with **_Header (VARCHAR), Body (VARCHAR), StartDate (DATE), EndDate (DATE)_**

# Hardware we use

**PC:**
I5-3470 CPU
Storage-120 gb hdd
8gb ram
OS: Ubuntu 20.04

**Internet:**
Extended Router

**Actual server:**
Raspberry Pi 3
OS: Raspberry OS

**Display:**
32" TV

# TO DO:
- [x] Add capability for more than 3 news (replace existing in order)
- [x] Implement startDate and endDate to the database
- [ ] Do not show newsitem after expiration date (endDate)
- [ ] Setting better time for slides, for better readability
- [ ] Admin interface for user
- [ ] Admin interface for newsitems
- [ ] Use of HTML in newsitems or other formatting
- [ ] Use og images in newsitems
- [ ] Regular backup settings
- [ ] Message part is not controlable for time
