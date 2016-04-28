<?php 

const SERVER="argsa.com.ar";
const USUARIO="root";
const CLAVE="malvinas";
const BASE="argsa";

$link = mysqli_connect(SERVER,USUARIO,CLAVE,BASE);
mysqli_set_charset($link, "utf8");
 ?>