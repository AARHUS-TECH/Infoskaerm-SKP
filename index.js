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

const app = express()
var personList = []

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

var db = con.getConnection()
var titleText = con.getNewsTitle()
var bodyText = con.getNewsBody()

// Needed to update news on refresh, can't be used in an async function
function getInfo() {
	titleText = con.getNewsTitle()
	bodyText = con.getNewsBody()
	startText = con.getNewsStartDate()
	endText = con.getNewsEndDate()
}

async function loadSite() {
	// Network Check
	net1 = await isReachable('217.116.222.48') // LAV FLERE HVIS I FÅR FLERE IP'ER
	// view engine + public folder
	app.set("views", "frontend")
	app.set('view engine', 'pug')
	app.use(express.json())
	app.use(express.urlencoded({
		extended: true
	}));
	app.use(express.static('Admin'));
	app.use('/images', express.static("./frontend/images"));
	app.use('/frontend/js', express.static(path.join(__dirname, '/frontend/js')));
	// net2 = await isReachable('217.116.222.48') // an extra connection

	// Deletes old dates from DB
	con.removeNews();

	// Index site
	getInfo() // Update news
	app.get('/', function(req, res) {
		res.render('index.pug', {
			// sends net1 bool into the variable netstatus on index.pug
			netstatus: net1,
			getNewsTitle: titleText,
			getNewsBody: bodyText,
			getNewsStart: startText,
			getNewsEnd: endText
		})
	})

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
					res.redirect("Admin/dashboard")
				} else {
					req.session.verificationFailed = true // Check to make sure fail message is shown
					res.redirect("/login")
				}
			})
		});

	})

	// admin panel
	app.get('/Admin/dashboard', function(req, res) {
		let session = req.session
		if (session.key) {
			res.render('Admin/dashboard.pug'), {
				userID: session.key
			}
		} else {
			req.session.verificationFailed = true // Check to make sure fail message is shown
			res.redirect("/login")
		}
	})

	app.get('/Admin/database', function(req, res) {
		let session = req.session
		if (session.key) {
			res.render('Admin/database.pug'), {
				userID: session.key
			}
		} else {
			req.session.verificationFailed = true // Check to make sure fail message is shown
			res.redirect("/login")
		}
	})

	// admin panel
	app.get('/Admin/messagemanager.pug', function(req, res) {
		let session = req.session
		if (session.key) {
			res.render('Admin/messagemanager.pug')
		} else {
			req.session.verificationFailed = true // Check to make sure fail message is shown
			res.redirect("/login")
		}
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
		res.redirect("Admin/dashboard")
	})

	app.get('/Admin/users', function(req, res) {
		let session = req.session
		if (session.key) {
			res.render('Admin/users.pug'), {
				userID: session.key
			}
		} else {
			req.session.verificationFailed = true // Check to make sure fail message is shown
			res.redirect("/login")
		}
	})

	app.post("/logout", function(req, res) {
		req.session.destroy(function(err) {
			res.redirect('/');
		});
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

		res.redirect("Admin/users?added=true")
	})
}

// Host siden
app.listen(PORT, ["0.0.0.0", "localhost"], () => {
	console.log("Siden kan nu loades!")
})