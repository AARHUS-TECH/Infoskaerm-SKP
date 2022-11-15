const session = require('express-session');
const { connect } = require('net');
const { start } = require('repl');

const con = require('./lib/connection.js'),
    express = require('express'),
    isReachable = require('is-reachable'),
    sess = require('express-session'),
    cookieParser = require("cookie-parser"),
    encoder = express.urlencoded({
        extended: true
    }),
    path = require('path'),
    redis = require('redis'),
    redisStore = require('connect-redis')(sess),
    client = redis.createClient();


//Hosting Port
const PORT = 3000

// Network Display bool
var status = "net1"
var net1 = false

//var net2 = false
// login security
var verificationFailed = false

// NIX PILLE
loadSite()
setInterval(loadSite, 10000) // 10000ms, website live reloads every 10 seconds

// Create the Express application object
const app = express()

//#region JSON api
app.get('/getMyJSON', function(req, res) { // data træk til opslagene med json og ajax
        var opslagdata = "*";

        db.query("SELECT * FROM news  WHERE Active=1 ORDER BY Startdate ASC", (err, rows, ) => {
            if (err) console.log(err);

            opslagdata = '{';
            opslagdata += '"news":[';
            for (var i = 0; i < rows.length; i++) {
                opslagdata += '{';
                opslagdata += '"header" : "' + rows[i].Header + '",';
                opslagdata += '"body" : "' + rows[i].Body + '",';
                opslagdata += '"startdate" : "' + rows[i].Startdate + '",';
                opslagdata += '"enddate" : "' + rows[i].Enddate + '"';
                opslagdata += '},';
            };

            opslagdata = opslagdata.substring(0, (opslagdata.length) - 1)
            opslagdata += ']}';
            res.send(opslagdata);
        });
    })
    //#endregion JSON api


//#region REDIS sessioncookies
app.use(sess({
        secret: 'WeNeedARaise',
        store: new redisStore({
            host: 'localhost',
            port: 6379,
            client: client,
            ttl: 260
        }),
        resave: true,
        saveUninitialized: true,
        cookie: {
            maxAge: 600000
        }
    }))
    //#endregion REDIS sessioncookies


var db = con.getConnection()

async function loadSite() {
    // Network Check
    net1 = await isReachable('217.116.222.48') // LAV FLERE HVIS I FÅR FLERE IP'ER

    // view engine + public folder
    app.set("views", "frontend")
    app.set("view engine", "pug")
    app.use(express.json())
    app.use(express.urlencoded({ extended: true }));
    app.use(express.static('admin'));
    app.use('/images', express.static("./frontend/images"));
    app.use('/frontend/js', express.static(path.join(__dirname, '/frontend/js')));

    // Deletes old dates from DB
    con.removeNews();

    // Index site
    app.get('/', function(req, res) {
        var connection = con.getConnection()
        connection.connect();
        var newsList = []
        connection.query("SELECT * FROM news WHERE Active=1 ORDER BY Startdate ASC", (err, rows) => {
            if (err) {
                res.status(500).json({ "status_code": 500, "status_message": "internal server error" });
            } else {
                // Loop check on each row
                for (var i = 0; i < rows.length; i++) {

                    // Create an object to save current row's data
                    var news = {
                        'enddate': rows[i].Enddate,
                        'startdate': rows[i].Startdate,
                        'body': rows[i].Body,
                        'header': rows[i].Header,
                        'id': rows[i].ID,
                        'index': i
                    }
                    // Add object into array
                    newsList.push(news);
                }
            }
            res.render('index.pug', { newsList: newsList, netstatus: net1 })
        });

        // Close the MySQL connection
        connection.end();
    })

    //#region admin panel

    //Login site
    app.get("/login", function(req, res) {
        res.render('login.pug', {
            verifyFail: req.session.verificationFailed // Transfer check over to pug file
        })
    })

    // Login system authentication
    app.post("/authenticate", encoder, function(req, res) {
        var Id = req.body.id
        var password = req.body.password
        db.query('SELECT * FROM users', (err, rows) => {
            db.query("SELECT * FROM users WHERE Id = ? AND password = ?", [Id, password], function(error, results, fields) {
                if (err) throw err;
                if (results.length > 0 && rows[Id].status == "superuser") {
                    req.session.key = Id;
                    res.redirect("admin/dashboard")
                } else {
                    req.session.verificationFailed = true // Check to make sure fail message is shown
                    res.redirect("/login")
                }
            })
        });

    })

    app.get('/admin/', function(req, res) {
        let session = req.session
        if (session.key) {
            res.render('admin/dashboard.pug'), {
                userID: session.key
            }
        } else {
            req.session.verificationFailed = true // Check to make sure fail message is shown
            res.redirect("/login")
        }
    })

    app.get('/admin/dashboard', function(req, res) {
        let session = req.session
        if (session.key) {
            res.render('admin/dashboard.pug'), {
                userID: session.key
            }
        } else {
            req.session.verificationFailed = true // Check to make sure fail message is shown
            res.redirect("/login")
        }
    })

    // DATABASE USERS & NEWS

    app.get('/admin/database', function (req, res) {
        let session = req.session
        if (session.key) {
            res.render('admin/database'), {
                userID: session.key
            }
        } else {
            req.session.verificationFailed = true // Check to make sure fail message is shown
            res.redirect("/login")
        }
    })

    // DATABASE USERS

    app.get('/admin/database/users', function(req, res) {
            let session = req.session
            var connection = con.getConnection()
            connection.connect();

            if (session.key) {
                var personList = []
                connection.query("SELECT * FROM users", (err, rows, fields) => {
                    if (err) {
                        res.status(500).json({ "status_code": 500, "status_message": "internal server error" });
                    } else {
                        // Loop check on each row
                        for (var i = 0; i < rows.length; i++) {

                            // Create an object to save current row's data
                            var person = {
                                'firstname': rows[i].Fornavn,
                                'middlename': rows[i].mellemnavn,
                                'lastname': rows[i].Efternavn,
                                'status': rows[i].status,
                                'id': rows[i].Id
                            }
                            // Add object into array
                            personList.push(person);
                        }
                    }
                    res.render('admin/users.pug', { personList: personList, userID: session.key })
                });

                // Close the MySQL connection
                connection.end();
            } else {
                req.session.verificationFailed = true // Check to make sure fail message is shown
                res.redirect("/login")
            }
        })

    app.get('/admin/database/users/:id', function (req, res) {
            // Connect to MySQL database.
            var connection = con.getConnection();
            connection.connect();

            // Do the query to get data.
            connection.query('SELECT * FROM users WHERE id = ' + req.params.id, function (err, rows, fields) {
                var person;

                if (err) {
                    res.status(500).json({ "status_code": 500, "status_message": "internal server error" });
                } else {
                    // Check if the result is found or not
                    if (rows.length == 1) {
                        // Create the object to save the data.
                        var person = {
                            'firstname': rows[0].Fornavn,
                            'middlename': rows[0].mellemnavn,
                            'lastname': rows[0].Efternavn,
                            'status': rows[0].status,
                            'id': rows[0].Id
                        }
                        // render the details.plug page.
                        res.render('admin/userDetails', { person: person });
                    } else {
                        // render not found page
                        res.status(404).json({ "status_code": 404, "status_message": "Not found" });
                    }
                }
            });

            // Close MySQL connection
            connection.end();
        })

    // DATABASE NEWS

    app.get('/admin/database/news', function (req, res) {
        let session = req.session
        var connection = con.getConnection()
        connection.connect();

        if (session.key) {
            var newsList = []
            connection.query("SELECT * FROM news", (err, rows, fields) => {
                if (err) {
                    res.status(500).json({ "status_code": 500, "status_message": "internal server error" });
                } else {
                    // Loop check on each row
                    for (var i = 0; i < rows.length; i++) {

                        // Create an object to save current row's data
                        var news = {
                            'enddate': rows[i].Enddate,
                            'startdate': rows[i].Startdate,
                            'body': rows[i].Body,
                            'header': rows[i].Header,
                            'id': rows[i].ID
                        }
                        // Add object into array
                        newsList.push(news);
                    }
                }
                res.render('admin/news.pug', { newsList: newsList, userID: session.key })
            });

            // Close the MySQL connection
            connection.end();
        } else {
            req.session.verificationFailed = true // Check to make sure fail message is shown
            res.redirect("/login")
        }
    })

    app.get('/admin/database/news/:id', function (req, res) {
        // Connect to MySQL database.
        var connection = con.getConnection();
        connection.connect();

        // Do the query to get data.
        connection.query('SELECT * FROM news WHERE id = ' + req.params.id, function (err, rows, fields) {
            var news;

            if (err) {
                res.status(500).json({ "status_code": 500, "status_message": "internal server error" });
            } else {
                // Check if the result is found or not
                if (rows.length == 1) {
                    // Create the object to save the data.
                    var news = {
                        'enddate': rows[0].Enddate,
                        'startdate': rows[0].Startdate,
                        'body': rows[0].Body,
                        'header': rows[0].Header,
                        'id': rows[0].ID
                    }
                    // render the details.plug page.
                    res.render('admin/newsDetails', { news: news });
                } else {
                    // render not found page
                    res.status(404).json({ "status_code": 404, "status_message": "Not found" });
                }
            }
        });

            // Close MySQL connection
            connection.end();
    });

    app.get('/deleteNews/:id', function (req, res) {
        let session = req.session
        var connection = con.getConnection();
        var id = req.params.id;
        if (session.key) {

            connection.connect();

            connection.query("DELETE FROM news WHERE id=?", [id])

            res.render('admin/database')
        } else {
            req.session.verificationFailed = true
            res.redirect(req.baseUrl + 'login')
        }
    })

    app.post('/changeNewsDetails/:id', function (req, res) {

        // Connect to MySQL database.
        var connection = con.getConnection();

        // Local Variabels
        var header = req.body.header;
        var body = req.body.body;
        var startdate = req.body.startdate;
        var enddate = req.body.enddate;
        var id = req.params.id;

        connection.connect();

        connection.query("UPDATE news SET Header=?,Body=?,Startdate=?,Enddate=?, Active=1 WHERE id=?", [header, body, startdate, enddate, id], (err, result) => {
            if (err) {
                console.log(err)
            } else {
                res.send(`"Updated ${ startdate }${ enddate }"`)
            }
        })

        //res.redirect(req.baseUrl + '/admin/database/news/:id')
    })

    // USER CHANGE

    app.get('/deleteUser/:id', function (req, res) {
        let session = req.session
        var connection = con.getConnection();
        var id = req.params.id;
        if (session.key) {

            connection.connect();

            connection.query("DELETE FROM users WHERE id=?", [id])

            res.render('admin/database')
        } else {
            req.session.verificationFailed = true
            res.redirect(req.baseUrl + 'login')
        }
    })

    app.post('/changeDetails/:id', function (req, res) {

        // Connect to MySQL database.
        var connection = con.getConnection();

        // Local Variabels
        var fname = req.body.firstname;
        var mname = req.body.middlename;
        var lname = req.body.lastname;
        var id = req.params.id;

        connection.connect();

        connection.query("UPDATE users SET Fornavn=?,mellemnavn=?,Efternavn=? WHERE id=?",[fname,mname,lname, id], (err, result) => {
            if (err) {
                console.log(err)
            } else {
                res.send("UPDATED")
            }
        })

        res.redirect(req.baseUrl + '/admin/database/users/:id')
    })

    app.post("/createUser", function(req, res) {
            fname = req.body.fornavn
            mname = req.body.mellemnavn
            sname = req.body.efternavn
            rname = req.body.role

            if (mname == "")
                mname = null
            if (rname != "user" || rname != "superuser")
                rname = "user"

            con.addUser(fname, mname, sname, rname, null)

            res.redirect("admin/users?added=true")
    })  

    app.post('/postnews', function(req, res) {
        var title = req.body.title
        var body = req.body.msg
        var start = req.body.msg_startdato
        var end = req.body.msg_enddato
        if (start != null || end != null)
            con.addNews(title.toString(), body.toString(), `"${start}"`, `"${end}"`)
        else {
            con.addNews(title.toString(), body.toString(), `null`, `null`)

        }
        res.redirect("admin/dashboard")
    })

    app.post("/logout", function(req, res) {
        req.session.destroy(function(err) {
            res.redirect('/');
        });
    })

}

// Host siden
app.listen(PORT, ["0.0.0.0", "localhost"], () => {
    console.log("Siden kan nu loades!")
})