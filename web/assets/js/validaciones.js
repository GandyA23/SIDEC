const ctrRol = document.getElementById("mostrarRol").outerText;
(function(){
   switch (ctrRol) {
      case "Director":
            for(var i=1; i<=4; i++){
                var ctrl = `ctrDirector${i}`;
                document.getElementById(ctrl).style.display="none";
            }
         break;
      case "Docente":
          for(var i=1; i<=4; i++){
              var ctrl = `ctrDirector${i}`;
              document.getElementById(ctrl).style.display="none";
          }
          for(var i=1; i<=10; i++){
              var ctrl = `ctrDocente${i}`;
              document.getElementById(ctrl).style.display="none";
          }
         break;
   }
}())