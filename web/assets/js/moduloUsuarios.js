(function () {
	var rol = document.getElementById("rolActivo").outerText;
	if (rol == 'Director') {
		document.getElementById("ocultarDirector").style.display = "none";
	}
}())

// ***************************Añadir
function verificarPASS() {
	var pass = document.getElementById("pass").value;
	var repeat = document.getElementById("repeatpass").value;
	if (pass.length > 0 && repeat.length > 0 && pass === repeat) {
		document.getElementById("enviarBTN").click();
	} else {
		Swal.fire({
			icon: 'error',
			title: 'Contraseñas insonsistentes',
			text: 'Verifique que las contraseñas sean iguales',
		})
	}
}

// ***************************Borrar
function preguntaBorrar() {
	Swal.fire({
		title: '¿Desea eliminarlo?',
		text: "Se eliminaran los datos de acceso de esta persona",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#6c757d',
		cancelButtonColor: '#3085d6',
		confirmButtonText: 'Si, Realizar!'
	}).then((result) => {
		if (result.value)
			document.getElementById("enviarForm").click();
	})
}

// ***************************Actualizar
function preguntaModificar() {
	Swal.fire({
		title: '¿Desea actualizarlo?',
		text: "Se actualizaran los datos modificados",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#6c757d',
		cancelButtonColor: '#3085d6',
		confirmButtonText: 'Si, Realizar!'
	}).then((result) => {
		if (result.value)
			document.getElementById("enviarForm").click();
	})
}