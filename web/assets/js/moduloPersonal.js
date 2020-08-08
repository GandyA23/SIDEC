// ***************************Borrar
function preguntaBorrar() {
	Swal.fire({
		title: '¿Desea eliminarlo?',
		text: "Se eliminarán los datos del estudiante",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#6c757d',
		cancelButtonColor: '#3085d6',
		confirmButtonText: 'Si, Realizar!'
	}).then((result) => {
		if (result.value) {
			document.getElementById("enviarForm").click();
		}
	})
}

// ***************************Actualizar
function preguntaModificar() {
	Swal.fire({
		title: '¿Desea actualizarlo?',
		text: "Se actualizarán los datos modificados",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#6c757d',
		cancelButtonColor: '#3085d6',
		confirmButtonText: 'Si, Realizar!'
	}).then((result) => {
		if (result.value) {
			document.getElementById("enviarForm").click();
		}
	})
}