document.addEventListener("DOMContentLoaded", function(event) {
	setDate()

	function setDate() {
		this.date = (new Date())
		document.getElementById('dato').innerHTML = Intl.DateTimeFormat("da-dk").format(this.date)
	}
	setInterval(setDate, 1000)

	clock()

	function clock() {
		var time = new Date(),
			hours = time.getHours(),
			minutes = time.getMinutes()
		document.querySelectorAll('.clock')[0].innerHTML = harold(hours) + ":" + harold(minutes);

		function harold(standIn) {
			if (standIn < 10) {
				standIn = '0' + standIn
			}
			return standIn;
		}
	}
	// Infinite loop
	setInterval(clock, 1000);

	function news() {
		// Tager info fra pug fil i sessionen
		var titleText = sessionStorage.getItem("titleText")
		var bodyText = sessionStorage.getItem("bodyText")
		var startText = sessionStorage.getItem("startText")
		var endText = sessionStorage.getItem("endText")


		// Splliter ved :-:, for at få de korrekte values i en array
		titleText = titleText.split(":-:,")
		bodyText = bodyText.split(":-:,")
		startText = startText.split(":-:,")
		endText = endText.split(":-:,")

		// Keeps track of position
		var pos = titleText.length

		// boxes
		for (var i = 0; i <= bodyText.length; i++) {
			makeNews(i, i + 1)
		}

		// Make a news box
		function makeNews(boxnumber, position) {
			this.boxnumber = boxnumber
			if (this.boxnumber < 3) {
				document.querySelectorAll(".info_titeltext")[this.boxnumber].innerHTML = `<p>${titleText[pos-position].replace(":-:", "")}</p>` // Replaces Title
				document.querySelectorAll(".info_text")[this.boxnumber].innerHTML = `<p>${bodyText[pos - position].replace(":-:","")}</p><div class="startdateholder"></div><div class="enddateholder"></div>`
				document.querySelectorAll(".startdateholder")[this.boxnumber].innerHTML = `${startText[pos - position].replace(":-:","").substring(4,15)}`
				document.querySelectorAll(".enddateholder")[this.boxnumber].innerHTML = `${endText[pos - position].replace(":-:","").substring(4,15)}`
			}
		}
	}
	news()
	setInterval(news, 5000)
})