(function () {
	let ctrRol = document.getElementById("mostrarRol").outerText;
	if (ctrRol == "Director") {
		for (var i = 1; i <= 5; i++) {
			document.getElementById(`ctrDirector${i}`).style.display = 'none';
		}
	} else if (ctrRol == "Docente") {
		for (var i = 1; i <= 5; i++) {
			document.getElementById(`ctrDirector${i}`).style.display = 'none';
		}
		for (var i = 1; i <= 9; i++) {
			document.getElementById(`ctrDocente${i}`).style.display = 'none';
		}
		document.getElementById("nav-profile-tab").style.display = 'none';
	}
}())