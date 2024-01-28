const URLbase="http://localhost/institucion/back/alumno/"
const URLbase1="http://localhost/institucion/back/materias/"
const URLbase2="http://localhost/institucion/back/notas/"
const URLfotos="http://localhost/institucion/back/fotos/"
const $tablaDatos=document.getElementById("tablaDatos")
const $codigo=document.getElementById("codigo")
const $nombre=document.getElementById("nombre")
const $apellido=document.getElementById("apellido")
const $cedula=document.getElementById("cedula")
const $grado=document.getElementById("grado")
const $id_alumno=document.getElementById("id_alumno") // este es el input oculto
const $foto=document.getElementById("foto")
const $btnOk=document.getElementById("btnOk")
const $btnCancelar=document.getElementById("btnCancelar")
const $imgDefault=document.getElementById("imgDefault")
const $frmalumnos=document.getElementById("frmalumnos")
const $btnBusca=document.getElementById("btnBusca")
const $busca=document.getElementById("busca")
const $btnCons=document.getElementById("btnCons")

//declarar las variables de la tabla donde se consultarán las notas
const $trdatos=document.getElementById("trdatos")
const $tdnombre=document.getElementById("tdnombre")
const $tdapellido=document.getElementById("tdapellido")
const $tdcedula=document.getElementById("tdcedula")
const $tdcodigo=document.getElementById("tdcodigo")
const $tdgrado=document.getElementById("tdgrado")
const $tdfoto=document.getElementById("tdfoto")
const $btntd=document.getElementById("btntd")
const $btnx=document.getElementById("btnx")

//Operación de consultar llamando a la API por GET (por defecto) sin pasar datos
const cargarAlumnos = () => {
    fetch(URLbase)
    .then(resultado => { resultado.json()
    .then(datos => {
        llenarTabla(datos)
       })
    })
}

//botón de buscar para la tabla 
$btnBusca.addEventListener("click",()=>{
    const busca = $busca.value
    fetch(URLbase+busca)
    .then(resultado => { resultado.json ()
    .then(datos => {
         llenarTabla(datos)
       })
    })
})

//llenar tabla

const llenarTabla = (datos) =>{
    let acum="", fila=1
    datos.forEach(d => {
        acum+=
        `<tr data-id=${d.id_alumno}> 
        <td class="campo">${fila}</td> 
        <td class="campo">${d.codigo}</td>
        <td class="campo">${d.nombre}</td>
        <td class="campo">${d.apellido}</td>
        <td class="campo">${d.cedula}</td>
        <td class="campo">${d.grado}</td>
        <td class="campo"><img src="${d.foto ? URLfotos + d.foto : 'img/default.png'}" class="fotico"</td> 
        <td class="campo" colspan='3'>
        <button class="btnEditar" title="Editar a ${d.nombre}">Editar</button>
        <button class="btnBorrar" title="Borrar a ${d.nombre}">Borrar</button>
        <button class="btnCons" id="btnCons" title="Consultar las notas de ${d.nombre}">Consultar</button></td>
        </tr>`
        fila++
    })
    $tablaDatos.innerHTML=acum
}

//borrar y editar

$tablaDatos.addEventListener("click", (e)=>{
    let id_alumno = e.target.parentElement.parentElement.dataset.id
    let quiereBorrar = e.target.classList.contains('btnBorrar')
    let quiereEditar = e.target.classList.contains('btnEditar')
    let quiereConsultar = e.target.classList.contains('btnCons')

    if((quiereBorrar) && (confirm("¿está seguro de eliminar el registro?"))){
        fetch(URLbase+id_alumno,{method:"DELETE"})
        .then(resultado => {
            resultado.json()
        .then(datos =>{
            cargarAlumnos();
        })
        })
    } //Fin del borrado
    if((quiereEditar) && (confirm("¿está seguro de editar el registro?"))){
        fetch(URLbase+"id/"+id_alumno,{method:"GET"})
        .then(resultado => {
            resultado.json()
            .then(datos =>{
                mostrarDatosAlumnoEnFormulario(datos);
            })
        })
    }
})

//mostrar datos del alumno en la sección de ingresar para editar

function mostrarDatosTablaNotas(m){
    $id_alumno.value=m[0].id_alumno //variale oculta
    $codigo.value=m[0].tdcodigo
    $nombre.value=m[0].tdnombre
    $apellido.value=m[0].tdapellido
    $cedula.value=m[0].tdcedula
    $grado.value=m[0].tdgrado
    $imgDefault.src=URLfotos+m[0].tdfoto
}


function mostrarDatosAlumnoEnFormulario(m){
    $id_alumno.value=m[0].id_alumno //variable oculta
    $codigo.value=m[0].codigo
    $nombre.value=m[0].nombre
    $apellido.value=m[0].apellido
    $cedula.value=m[0].cedula
    $grado.value=m[0].grado
    $imgDefault.src=URLfotos+m[0].foto
    $btnOk.value="Editar"
    $nombre.focus()
}

$foto.addEventListener("change",() =>{
    $imgDefault.src=URL.createObjectURL($foto.files[0])
})

//Operación de insertar llamando a la API por POST y pasando datos
$btnOk.addEventListener("click",(e)=>{
    e.preventDefault()
    let datosEnviar = new FormData($frmalumnos)
    let id_alumno = $id_alumno.value
    let peticion = URLbase //peticion por defecto POST a alumnos inserción
    if (id_alumno>-1){ //está editando y se arma la peticion alumnos/#id_alumno
        peticion=peticion+id_alumno
    }
    fetch(peticion,{method:"POST", body: datosEnviar})
    .then(resultado => {
        resultado.json()
        .then(datos => {
            cargarAlumnos()
            limpiarFormulario()
        })
    })
})

//poner los formularios en blanco después de completar ciertas operaciones

function limpiarFormulario(){
    $id_alumno.value=-1
    $codigo.value=""
    $nombre.value=""
    $apellido.value=""
    $cedula.value=""
    $grado.value=""
    $foto.value=""
    $imgDefault.src="img/default.png"
    $btnOk.value="Agregar"
    $nombre.focus()
}

$btnCancelar.addEventListener("click",()=>{
    limpiarFormulario()
})

cargarAlumnos() //Inicia por aquí
limpiarFormulario()
