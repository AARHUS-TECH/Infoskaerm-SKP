n = 0


document.addEventListener("DOMContentLoaded", function(event) {

	document.onmousemove = (function () {
		var onmousestop = function () {
			/* do stuff when mouse stops */
			document.querySelector("body").style.cursor = "none";
			},
			thread;

		return function () {
			clearTimeout(thread);
			thread = setTimeout(onmousestop, 10000);
		};
	})();

	addEventListener("mousemove", (event) => {});
	onmousemove = (event) => {
	document.querySelector("body").style.cursor = "default";
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

	var newsCounter = 1;
	var info = $('.info');

	async function fadingData() {
		info.css('display', 'none');

		if (newsCounter < info.length -1) {
			newsCounter++;
		} else {
			newsCounter = 0;
		}

		$('.info-' + newsCounter).css('display', 'block');

	}
	setInterval(fadingData, 11100);

})
