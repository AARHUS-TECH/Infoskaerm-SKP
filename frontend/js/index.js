document.addEventListener("DOMContentLoaded", function(event) {

	setDate()

	function setDate() {
		var date = (new Date())
		document.getElementById('dato').innerHTML = Intl.DateTimeFormat("da-dk").format(date)
	}
	setInterval(setDate, 1000)

	clock()

	function clock() {
		var time = new Date(),
			hours = time.getHours(),
			minutes = time.getMinutes()
		document.querySelectorAll('.clock')[0].innerHTML = harold(hours) + ":" + harold(minutes);

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

		var dateThingy = 0

		// Make a news box
		function makeNews(boxnumber, position) {
			// Header
			if (boxnumber < 3) {
				//if (endText[pos - position])
				document.querySelectorAll(".info_titeltext")[boxnumber].innerHTML = `<p>${titleText[pos-position].replace(":-:", "")}</p>` // Replaces Title
				// Body
				document.querySelectorAll(".info_text")[boxnumber].innerHTML = `<p>${bodyText[pos-position].replace(":-:","")}</p><div class="startdateholder"></div><div class="enddateholder"></div>`
				if (startText[pos - position] != "null" || endText[pos - position] != "null") {
					document.querySelectorAll(".startdateholder")[boxnumber].innerHTML = `${startText[pos-position].replace(":-:","").substring(3,15)}`
					document.querySelectorAll(".enddateholder")[boxnumber].innerHTML = `${endText[pos-position].replace(":-:","").substring(3,15)}`
				}
			}
		}

		// box 1
		for (var i = 0; i <= bodyText.length; i++) {
			makeNews(i, i + 1)
		}

		function harold(standIn) {
			if (standIn < 10) {
				standIn = '0' + standIn
			}
			return standIn;
		}
	}
	// Infinite loop
	setInterval(clock, 1000);
})