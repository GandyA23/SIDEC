(function () {
	var mostrarSMS = document.getElementById("mostrarSMS").value;
	switch (mostrarSMS) {
		case "1":
			Swal.fire(
				'¡Accion exitosa!',
				'Se efectuo correctamente en el sistema',
				'success'
			)
			break;
		case "0":
			Swal.fire({
				icon: 'error',
				title: '¡Registo no encontrado!',
				text: 'Algo pasó, revise los datos',
				footer: '<b class="text-center">Posiblemente no exista, este de baja o ya tiene el registro</b>'
			})
			break;
	}

	var valueIsEmpty = document.getElementById("valorLleno");
	if(valueIsEmpty != null){
		document.getElementById("btnControl").disabled = false;
	}

}())




