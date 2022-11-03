n = 0
document.addEventListener("DOMContentLoaded", function(event) {

	document.onmousemove = (function () {
		var onmousestop = function () {
			/* do stuff when mouse stops */
			document.querySelector(".center").style.cursor = "none";
			},
			thread;

		return function () {
			clearTimeout(thread);
			thread = setTimeout(onmousestop, 5000);
		};
	})();

	addEventListener("mousemove", (event) => {});
	onmousemove = (event) => {
	document.querySelector(".center").style.cursor = "default";
	};

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

	// Infinite loop by timer
	setInterval(clock, 1000);

	
	async function LoadNews() { 
		var xhttp = new XMLHttpRequest();  // XMLHttpRequest gives typeError, but its has noget run in to any problems
		xhttp.onload = async function() {
			
		 	const svar = await xhttp.responseText;
			const opslagdata = await JSON.parse(svar)
			const opslag = await opslagdata.news
					
			async function fadingData() { // using jquerry to make it fade and make it change to the next set of data
				await setInterval(function () {
					n++
					
					let timer = new Date().getTime();
					var headernumber = $(".info_titeltext").data("header") || 0;
					var bodynumber = $(".info_text").data("body") || 0;
					var startnumber = $(".startdateholder").data("startdate") || 0;
					var endnumber = $(".enddateholder").data("enddate") || 0;
					
					$(".info_titeltext").data("header", headernumber == opslag.length - 1 ? 0 : headernumber + 1).html(opslag[headernumber].header)
					$(".info_text").data("body", bodynumber == opslag.length - 1 ? 0 : bodynumber + 1).html(opslag[bodynumber].body);
					$(".startdateholder").data("startdate", startnumber == opslag.length - 1 ? 0 : startnumber + 1).html(opslag[startnumber].startdate);
					$(".enddateholder").data("enddate", endnumber == opslag.length - 1 ? 0 : endnumber + 1).html(opslag[endnumber].enddate);
						
					$(".info_titeltext,.info_text").fadeIn(500).delay(10000).fadeOut(500);

					console.log(opslag[bodynumber].header)
					console.log(opslag[bodynumber].body)

					//console.log(n)
					//console.log("[" + (new Date().getTime() - timer) / 1000 + "s]")
					
				}, 11100);
				
			}

			fadingData();
  		};
		  
		xhttp.open("GET", "/getMyJSON/", true);
		xhttp.send();
 	}

	LoadNews();



})
