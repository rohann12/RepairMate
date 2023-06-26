
		var startTime = 0;
		var elapsedTime = 0;
		var stopwatchInterval;
		var startBtn = document.getElementById("start_btn");
		var stopBtn = document.getElementById("stop_btn");
		var complete_btn = document.getElementById("complete_btn");
		var timeTakenElement = document.getElementById("time_taken");

		function startStopwatch() {
			startTime = new Date().getTime();
			startBtn.disabled = true;
			stopBtn.disabled = false;
			stopwatchInterval = setInterval(updateElapsedTime, 1000);
		}

		function stopStopwatch() {
			clearInterval(stopwatchInterval);
			startBtn.disabled = false;
			stopBtn.disabled = true;
			complete_btn.disabled = false;
		}

		function updateElapsedTime() {
			var currentTime = new Date().getTime();
			elapsedTime += currentTime - startTime;
			startTime = currentTime;
			var seconds = Math.floor(elapsedTime / 1000);
			timeTakenElement.innerText = seconds + " seconds";
		}
		function complete() {
			  var timeTakenElement = document.getElementById("time_taken");
			  var timeTaken = timeTakenElement.textContent;
			  var url = "time.jsp?timeTaken=" + encodeURIComponent(timeTaken);
			  window.location.href = url;
			}

