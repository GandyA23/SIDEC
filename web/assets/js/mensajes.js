function exitoso() {
	var mat = document.getElementById("mat").value;
	if(mat!=null){
		Swal.fire(
			'Insertado Exitoso!',
			'Se agrego el expediente clínico!',
			'success'
		)
	}

}
function confirmacion(){
	Swal.fire({
		title: '¿Estás seguro de eliminarlo?',
		text: "Los cambios no se pueden deshacer!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Si, borrar!'
	}).then((result) => {
		if (result.value) {
			Swal.fire(
				'Borrado!',
				'Se elimino el expediente.',
				'success'
			)
			var btnEliminar = document.getElementById("eliminar");
			btnEliminar.submit;
		}
		else{
			return false;
		}
	})
}