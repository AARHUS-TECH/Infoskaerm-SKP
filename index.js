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

	
	function LoadNews() { 
		var xhttp = new XMLHttpRequest();  // XMLHttpRequest gives typeError, but its has noget run in to any problems
		xhttp.onload = function() {
		 	 const svar = xhttp.responseText;
			 const opslagdata = JSON.parse(svar);
			 const opslag = opslagdata.news
				
			 	for(var i = 0; i <= opslag.length; i++) {
					const titleText = opslag[i].header
					const bodyText = opslag[i].body
					const startText = opslag[i].startdate
					const endText = opslag[i].enddate
    				
					function rotateTerm() { // using jquerry to make it fade make it change to the next set of data
						var headernumber = $(".info_titeltext").data("header") || 0;
						var bodynumber = $(".info_text").data("body") || 0;
						var startnumber = $(".startdateholder").data("startdate") || 0;
						var endnumber = $(".enddateholder").data("enddate") || 0;
    					$(".info_titeltext")
      						.data("header", headernumber == opslag.length - 1 ? 0 : headernumber + 1)
							.html(opslag[headernumber].header)
      						.fadeIn(500)	
      						.delay(20000) 
      						.fadeOut(500);

						$(".info_text")
      						.data("body", bodynumber == opslag.length - 1 ? 0 : bodynumber + 1)
							.html(opslag[bodynumber].body)
      						.fadeIn(500)	
      						.delay(20000) 
      						.fadeOut(500);

						$(".startdateholder")
      						.data("startdate", startnumber == opslag.length - 1 ? 0 : startnumber + 1)
							.html(opslag[startnumber].startdate)
      						.fadeIn(500)	
      						.delay(20000) 
      						.fadeOut(500);

						$(".enddateholder")
      						.data("enddate", endnumber == opslag.length - 1 ? 0 : endnumber + 1)
							.html(opslag[endnumber].enddate)
      						.fadeIn(500)	
      						.delay(20000) 
      						.fadeOut(500, rotateTerm);						
  					}
  					rotateTerm();
			
					document.querySelector(".info_titeltext").innerHTML = titleText
					document.querySelector(".info_text").innerHTML = bodyText
					document.querySelector(".startdateholder").innerHTML = startText
					document.querySelector(".enddateholder").innerHTML = endText
				}
				

  		};
		xhttp.open("GET", "http://localhost:3000/getMyJSON", true);
		xhttp.send();
 	}
	LoadNews();
})