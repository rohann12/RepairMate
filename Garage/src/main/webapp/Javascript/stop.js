var startTime = 0;
var elapsedTime = 0;
var stopwatchInterval;
var startBtn = document.getElementById("start_btn");
var stopBtn = document.getElementById("stop_btn");
var completeBtn = document.getElementById("complete_btn");
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
    completeBtn.disabled = false;
}

function updateElapsedTime() {
    var currentTime = new Date().getTime();
    elapsedTime += currentTime - startTime;
    startTime = currentTime;

    var hours = Math.floor(elapsedTime / (1000 * 60 * 60));
    var minutes = Math.floor((elapsedTime % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((elapsedTime % (1000 * 60)) / 1000);

    var timeString = formatTime(hours) + ":" + formatTime(minutes) + ":" + formatTime(seconds);
    timeTakenElement.innerText = timeString;
}

function formatTime(time) {
    return time < 10 ? "0" + time : time;
}

function complete() {
    var timeTaken = timeTakenElement.textContent;
    var url = "time.jsp?timeTaken=" + encodeURIComponent(timeTaken);
    window.location.href = url;
}
