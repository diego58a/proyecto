<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
$method = $_SERVER['REQUEST_METHOD'];
if($method == "OPTIONS") {
    die();
}

require 'flight/Flight.php';

Flight::register('db', 'PDO', array('mysql:host=localhost;dbname=institucion','root',''));

////////Tabla periodos////////

////Consultar
Flight::route('GET /periodos', function () {
    $sentencia=Flight::db()->prepare("Select * from periodos ");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

////Insertar
Flight::route('POST /periodos', function () {
    $periodo=Flight::request()->data->periodo;
    $sentencia=Flight::db()->prepare("insert into periodos set periodo = ?");
    $sentencia->bindParam(1,$periodo);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: periodo ingresado}" );
});

////Actualizar
Flight::route('POST /periodos/@id_periodo', function ($id_periodo) {
    $periodo=Flight::request()->data->periodo;
    $sentencia=Flight::db()->prepare("update periodos set periodo = ? where id_periodo= ?");
    $sentencia->bindParam(1,$periodo);
    $sentencia->bindParam(2,$id_periodo);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: periodo actualizado}" );
});

////Eliminar
Flight::route('DELETE /periodos/@id_periodo', function ($id_periodo) {
    $sentencia=Flight::db()->prepare("delete from periodos where id_periodo= ?");
    $sentencia->bindParam(1,$id_periodo);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: periodo eliminado}" );
});

////////Fin de la tabla periodo////////

////////Tabla alumnos////////

//Consultar
Flight::route('GET /alumno', function () {
    $sentencia=Flight::db()->prepare("Select * from alumno order by nombre");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

Flight::route('GET /alumno/@buscar', function ($buscar) {
    $sentencia=Flight::db()->prepare("Select * from alumno
    where cedula like '%".$buscar."%' order by cedula");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

////Insertar
Flight::route('POST /alumno', function () {
    $codigo=Flight::request()->data->codigo;
    $nombre=Flight::request()->data->nombre;
    $apellido=Flight::request()->data->apellido;
    $cedula=Flight::request()->data->cedula;
    $grado=Flight::request()->data->grado;
    $foto=Flight::request()->files->foto;

    if(isset($foto["name"])){
        $extension = pathinfo($foto["name"], PATHINFO_EXTENSION);
        $nombreFoto= uniqid().".".$extension;
        move_uploaded_file($foto["tmp_name"], "fotos/".$nombreFoto);
        }

    $sentencia=Flight::db()->prepare("insert into alumno set codigo = ?,
                                      nombre = ?,
                                      apellido =?,
                                      cedula = ?,
                                      grado = ?,
                                      foto =?");
    $sentencia->bindParam(1,$codigo);   
    $sentencia->bindParam(2,$nombre);   
    $sentencia->bindParam(3,$apellido);
    $sentencia->bindParam(4,$cedula);
    $sentencia->bindParam(5,$grado);  
    $sentencia->bindParam(6,$nombreFoto);   
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje : representante ingresado}" );
});

////Actualizar
Flight::route('POST /alumno/@id_alumno', function ($id_alumno) {
    $codigo=Flight::request()->data->codigo;
    $nombre=Flight::request()->data->nombre;
    $apellido=Flight::request()->data->apellido;
    $cedula=Flight::request()->data->cedula;
    $grado=Flight::request()->data->grado;
    $sentencia=Flight::db()->prepare("update alumno set codigo = ?, nombre = ?, apellido = ?,
    cedula = ?, grado = ? where id_alumno= ?");
    $sentencia->bindParam(1,$codigo);
    $sentencia->bindParam(2,$nombre);
    $sentencia->bindParam(3,$apellido);
    $sentencia->bindParam(4,$cedula);
    $sentencia->bindParam(5,$grado);
    $sentencia->bindParam(6,$id_alumno);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: alumno actualizado}" );
});

////Eliminar
Flight::route('DELETE /alumno/@id_alumno', function ($id_alumno) {
    $sentencia=Flight::db()->prepare("delete from alumno where id_alumno= ?");
    $sentencia->bindParam(1,$id_alumno);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: alumno eliminado}" );
});

////Buscar por id
Flight::route('GET /alumno/id/@id', function ($id) {
    $sentencia=Flight::db()->prepare("
    Select r.id_alumno, r.codigo, r.nombre, r.apellido, r.cedula, r.grado, r.foto from alumno r  
    where r.id_alumno = ".$id);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

////////Fin de la tabla alumnos////////

////////Tabla materias////////

////Consultar
Flight::route('GET /materias', function () {
    $sentencia=Flight::db()->prepare("Select * from materias order by codigo");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

////Insertar
Flight::route('POST /materias', function () {
    $codigo=Flight::request()->data->codigo;
    $nombre=Flight::request()->data->nombre;
    $grado=Flight::request()->data->grado;
    $sentencia=Flight::db()->prepare("insert into materias set codigo = ?, nombre = ?, grado = ?");
    $sentencia->bindParam(1,$codigo);
    $sentencia->bindParam(2,$nombre);
    $sentencia->bindParam(3,$grado);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: materia ingresada}" );
});

////Actualizar
Flight::route('POST /materias/@id_materia', function ($id_materia) {
    $codigo=Flight::request()->data->codigo;
    $nombre=Flight::request()->data->nombre;
    $grado=Flight::request()->data->grado;
    $sentencia=Flight::db()->prepare("update materias set codigo = ?, nombre = ?, grado = ? where id_materia= ?");
    $sentencia->bindParam(1,$codigo);
    $sentencia->bindParam(2,$nombre);
    $sentencia->bindParam(3,$grado);
    $sentencia->bindParam(4,$id_materia);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: materia actualizada}" );
});

////Eliminar
Flight::route('DELETE /materias/@id_materia', function ($id_materia) {
    $sentencia=Flight::db()->prepare("delete from materias where id_materia= ?");
    $sentencia->bindParam(1,$id_materia);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: materia eliminada}" );
});

////////Fin de la tabla materias////////

////////Tabla notas////////

////Consultar
Flight::route('GET /notas', function () {
    $sentencia=Flight::db()->prepare("Select * from notas");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

////Insertar
Flight::route('POST /notas', function () {
    $id_materia=Flight::request()->data->id_materia;
    $id_alumno=Flight::request()->data->id_alumno;
    $id_periodo=Flight::request()->data->id_periodo;
    $nota=Flight::request()->data->nota;
    $lapso=Flight::request()->data->lapso;
    $sentencia=Flight::db()->prepare("insert into notas set id_materia = ?, id_alumno = ?, id_periodo = ?,
                                      nota = ?, lapso = ?");
    $sentencia->bindParam(1,$id_materia);
    $sentencia->bindParam(2,$id_alumno);
    $sentencia->bindParam(3,$id_periodo);
    $sentencia->bindParam(4,$nota);
    $sentencia->bindParam(5,$lapso);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: nota ingresada}" );
});

////Actualizar
Flight::route('POST /notas/@id_nota', function ($id_nota) {
    $id_materia=Flight::request()->data->id_materia;
    $id_alumno=Flight::request()->data->id_alumno;
    $id_periodo=Flight::request()->data->id_periodo;
    $nota=Flight::request()->data->nota;
    $lapso=Flight::request()->data->lapso;
    $sentencia=Flight::db()->prepare("update notas set id_materia = ?, id_alumno = ?, id_periodo = ?,
    nota = ?, lapso = ? where id_nota= ?");
    $sentencia->bindParam(1,$id_materia);
    $sentencia->bindParam(2,$id_alumno);
    $sentencia->bindParam(3,$id_periodo);
    $sentencia->bindParam(4,$nota);
    $sentencia->bindParam(5,$lapso);
    $sentencia->bindParam(6,$id_nota);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: nota actualizada}" );
});

////Eliminar
Flight::route('DELETE /notas/@id_nota', function ($id_nota) {
    $sentencia=Flight::db()->prepare("delete from notas where id_nota= ?");
    $sentencia->bindParam(1,$id_nota);
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json(" {mensaje: nota eliminada}" );
});

////////Fin de la tabla notas////////

Flight::start();
