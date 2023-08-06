
    var startTime = 0;
    var elapsedTime = 0;
    var stopwatchInterval;
    var startBtn = document.getElementById("start_btn");
    var stopBtn = document.getElementById("stop_btn");
    var completeBtn = document.getElementById("complete_btn");
    var repairCheckboxes = document.getElementsByName("repairCheckbox");
    var timeTakenElement = document.getElementById("time_taken");

    function startStopwatch() {
        startTime = new Date().getTime();
        startBtn.disabled = true;
        stopBtn.disabled = false;
        completeBtn.disabled = true;
        enableCheckboxes(true);
        stopwatchInterval = setInterval(updateElapsedTime, 1000);
    }

    function stopStopwatch() {
        clearInterval(stopwatchInterval);
        startBtn.disabled = false;
        stopBtn.disabled = true;
        enableCheckboxes(false);
    }

    function enableCheckboxes(enabled) {
        for (var i = 0; i < repairCheckboxes.length; i++) {
            repairCheckboxes[i].disabled = !enabled;
        }
    }

    function updateElapsedTime() {
        var currentTime = new Date().getTime();
        elapsedTime += currentTime - startTime;
        startTime = currentTime;

        var hours = Math.floor(elapsedTime / (1000 * 60 * 60));
        var minutes = Math.floor((elapsedTime % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((elapsedTime % (1000 * 60)) / 1000);

        var timeString = formatTime(hours) + ":" + formatTime(minutes) + ":" + formatTime(seconds);
        time_taken.innerText = timeString;
        checkCompleteButton();
    }

    function formatTime(time) {
        return time < 10 ? "0" + time : time;
    }

    // Function to check if all repair checkboxes are checked and enable the "Complete" button
    function checkCompleteButton() {
        var allChecked = true;
        for (var i = 0; i < repairCheckboxes.length; i++) {
            if (!repairCheckboxes[i].checked) {
                allChecked = false;
                break;
            }
        }
        completeBtn.disabled = !allChecked;
    }

    // Add an event listener to each repair checkbox to call the checkCompleteButton function
    for (var i = 0; i < repairCheckboxes.length; i++) {
        repairCheckboxes[i].addEventListener("change", checkCompleteButton);
    }

    function complete() {
    	 var timeTaken = timeTakenElement.textContent;
    	    var url = "complete.jsp?timeTaken=" + encodeURIComponent(timeTaken);
    	    window.location.href = url;
    }

