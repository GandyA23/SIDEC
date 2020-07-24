(function () {
	var mostrarSMS = document.getElementById("mostrarSMS").value;
	switch (mostrarSMS) {
		case "1":
			Swal.fire(
				'¡Exito!',
				'Todo salió de maravilla :D',
				'success'
			)
			break;
		case "0":
			Swal.fire({
				icon: 'error',
				title: '¡Ocurrio un Error!',
				text: 'Algo pasó, revise los datos D:',
			})
			break;
	}
}())

