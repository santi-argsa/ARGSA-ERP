<?php 
$estados = $_GET['estado'];
$titulo = "Panel - Control de Stock";
include 'encabezado.php';
require 'conexion.php';
require 'validar.php';

$sql = "SELECT nombre, codigobarra, preciocompra, precioventa, stockexistente FROM productos;
";

$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
$cantidad = mysqli_num_rows($resultado);
mysqli_close($link);
?>

<script src="js/jquery-1.12.0.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	</head>
<div class="container">
		<?php include 'menu2.php';?>	
			<div class="panel panel-primary">
  				<div class="panel-heading">
    				<h3 class="panel-title"><?php echo $titulo; ?></h3>
  				</div>
  				<div class="panel-body">
						<table id="tablacaja" class="table table-striped table-hover" >
										  <thead>
										    <tr class="success">
										      <!--<th>ID Producto</th>-->
			
										      <th>NOMBRE</th>
										      <th>CODIGO DE BARRA</th>
										      <th>PRECIO DE COMPRA</th>
										      <th>PRECIO DE VENTA</th>
										      <th>STOCK ACTUAL</th>
										      <th>ACTUALIZAR STOCK?</th>
										    </tr>
										  </thead>
										  <tbody id="ventas">
										   	  	<?php 
					while ($fila = mysqli_fetch_assoc($resultado)){					
				?>
					<tr 
						<?php if ($fila['stockexistente']< 20)
						{
							echo "class=danger";
						}

						elseif ($fila['stockexistente'] > 20 && $fila['stockexistente'] < 80){
							echo "class=warning";
							} ?>>
						<td><?php echo  $fila['nombre']; ?></td>
						<td><?php echo  $fila['codigobarra']; ?></td>
						<td><?php echo  $fila['preciocompra']; ?></td>
						<td><?php echo  $fila['precioventa']; ?></td>
						<td><?php echo  $fila['stockexistente'];?></td>
						<td><a href="form-mod-producto.php?codbar=<?php echo $fila['codigobarra'];?>"><i class="fa fa-plus-circle"></i></a></td>
						<!--<td><a onclick="Eliminar(this.parentNode.parentNode.rowIndex)"><span><i class="fa fa-trash"></td>-->
					</tr>		

					<?php  } ?>
				
					</div>
				</div>
			</div>
</div>
<script src="js/argsa.js"></script>

