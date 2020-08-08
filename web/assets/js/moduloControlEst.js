//****************VERIFICAR
(function () {
	var rol = document.getElementById("rolActivo").outerText;
	if(rol == 'Docente'){
		document.getElementById("docente1").hidden = true;
		var btn = document.getElementsByClassName("docente2");
		for(var i =0; i<btn.length;i++){
			btn[i].hidden = true;
		}
	}
}())


//****************COPIAR MATRICULA
function copiarMat(a) {
	var $temp = $("<input>");
	$("body").append($temp);
	$temp.val($(a).html()).select();
	document.execCommand("copy");
	$temp.remove();
	Swal.fire({
		position: 'top-end', icon: 'info', title: 'Se ha copiado la matrícula', showConfirmButton: false, timer: 500
	})
}