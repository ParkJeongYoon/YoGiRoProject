var modal = document.getElementById("login");

document.getElementById("login").style.display = "block";

var close = document.getElementsByClassName('close');

function goBack() {
	window.history.back();
}

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}