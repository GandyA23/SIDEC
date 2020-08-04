(function () {
	var mostrarSMS = document.getElementById("mostrarSMS").value;
	switch (mostrarSMS) {
		case "1":
			Swal.fire(
				'¡Yuju!, Éxito!',
				'Todo salió de maravilla',
				'success'
			)
			break;
		case "0":
			Swal.fire({
				icon: 'error',
				title: '¡Registo no encontrado!',
				text: 'Algo pasó, revise los datos',
				footer: '<b class="text-center">Posiblemente el estudiante no exista, este de baja o ya tiene el registro</b>'
			})
			break;
	}
}())




