//
// function startTimer(duration, displayId) {
//     var timer = duration * 60, minutes, seconds;
//     var display = document.getElementById(displayId);
//     var interval = setInterval(function () {
//         minutes = parseInt(timer / 60, 10);
//         seconds = parseInt(timer % 60, 10);
//
//         minutes = minutes < 10 ? "0" + minutes : minutes;
//         seconds = seconds < 10 ? "0" + seconds : seconds;
//
//         display.textContent = minutes + ":" + seconds;
//
//         if (--timer < 0) {
//             clearInterval(interval);
//             display.textContent = "Time's up!";
//             playSound();
//         }
//     }, 1000);
// }
//
// var audio;
//
// function playSound() {
//     audio = new Audio('app/assets/sounds/alarm.wav');
//     audio.loop = true;
//     audio.play();
//     showAlert();
// }
//
// function showAlert() {
//     if (confirm("Time's up! Click OK to stop the alarm.")) {
//         stopSound();
//     }
// }
//
// function stopSound() {
//     if (audio) {
//         audio.pause();
//         audio.currentTime = 0;
//     }
// }
