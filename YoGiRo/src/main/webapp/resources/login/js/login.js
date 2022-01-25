var modal = document.getElementById("login");

document.getElementById("login").style.display = "block";

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
