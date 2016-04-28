<?php 
require 'validar.php';
require "conexion.php";
include 'encabezado.php';
$titulo = "Alta de productos";


//Rutina para subir imagenes 
$prd_foto1 = "sin-foto.png";
$prd_foto1TMP;
$ruta = "img/";

if($_FILES['foto1']['name'] != "")
	{
	$prd_foto1 = $_FILES['foto1']['name'];	
	$prd_foto1TMP = $_FILES['foto1']['tmp_name'];
	move_uploaded_file($prd_foto1TMP, $ruta.$prd_foto1);
	}


$prodnombre = $_POST['nombre'];
$codproducto = $_POST['codproducto'];
$codproveedor = $_POST['codproveedor'];
$precioventa = $_POST['precioventa'];
$preciocompra = $_POST['preciocompra'];
$tipoproducto = $_POST['tipoproducto'];
$descripcion = $_POST['descripcion'];
$stock = $_POST['stock'];

$stockexistente = 

$sql = "INSERT INTO productos
		VALUES (NULL,'".$codproducto."','".$prodnombre."','".$preciocompra."','".$stock."','".$precioventa."','".$prd_foto1."','".$tipoproducto."','".$descripcion."')";
$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));

mysqli_close($link);
?>

</header>
<body>
	<div class="container">
	<?php include 'menu2.php';?>


<span>Se agrego el producto <?php$prodnombre;?></span>
<span>En 5 segundos se redireccionará al formulario de alta</span>

<?php header('refresh:5; URL=form-alta-productos.php'); ?>
	</div>
</body>