<?php 
$estados = $_GET['estado'];
$titulo = "Caja actual";
include 'encabezado.php';
require 'conexion.php';
require 'validar.php';

$sql = "SELECT  op.id_operacion, pr.nombre, op.codigobarra, op.cantvend, pr.precioventa, op.monto, vt.id_venta,ca.id_caja FROM operaciones AS op INNER JOIN productos AS pr ON op.codigobarra = pr.codigobarra INNER JOIN cajas as ca on op.id_caja = ca.id_caja INNER JOIN ventas AS vt ON op.id_venta = vt.id_venta where ca.estado = 1";

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
							    <th>ID VENTA</th>
							    <th>NOMBRE</th>
							    <th>CODIGO DE BARRA</th>
							    <th>CANTIDAD VENDIDA</th>
							    <th>PRECIO DE VENTA</th>
							    <th>MONTO</th>
							    <th>N° DE VENTA</th>
							    <th>N° DE CAJA</th>
							  </tr>
							</thead>
							<tbody id="ventas">
										   	  	<?php 
					while ($fila = mysqli_fetch_assoc($resultado)){					
					
				?>
					<tr>
					 
						<td><?php echo  $fila['id_operacion']; ?></td>
						<td><?php echo  $fila['nombre']; ?></td>
						<td><?php echo  $fila['codigobarra']; ?></td>
						<td><?php echo  $fila['cantvend']; ?></td>
						<td><?php echo $fila['precioventa'];?></td>
						<td><?php echo $fila['monto'];?></td>
						<td><?php echo $fila['id_venta'];?></td>
						<td><?php echo  $fila['id_caja'];?></td>
						<!--<td><a onclick="Eliminar(this.parentNode.parentNode.rowIndex)"><span><i class="fa fa-trash"></td>-->
					</tr>		
					<?php 
					  } ?>
						</tbody>
					</table>
			</div>
			<div class="row">
				<div class="col-md-9"></div>
				<div class="col-md-3">
				<form action="genera-caja.php" method="post">
					<input type="submit" class="btn btn-warning" value="Cerrar caja" id="btbuscar">
				</form>
					<br>
					<br>
				</div>
			</div>
		</div>
</div>


						

<script src="js/argsa.js"></script>

