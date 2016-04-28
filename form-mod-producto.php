<?php 
require 'validar.php';
require "conexion.php";
include 'encabezado.php';

if (isset($_GET['codbar']))
	{
	$codbaras = $_GET['codbar'];
	}
	else
	{
		$codbaras='999999999';
	}



$sql = "SELECT  nombre, precio, (precio * stockexistente) as monto, stockexistente, codigobarra  FROM productos";
/*
$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
$cantidad = mysqli_num_rows($resultado);
mysqli_close($link);
*/
$titulo = "Modificacion de producto";
?>


</head>
<body>
	<div class="container">
		<?php include 'menu2.php';?>	
			<div class="panel panel-primary">
  				<div class="panel-heading">
    				<h3 class="panel-title"><?php echo $titulo; ?></h3>
  				</div>
  			<div class="panel-body">
    			<div class="row">
					<div class="col-md-4">
				  		<div class="panel panel-primary">
  							<div class="panel-heading">
    							<h3 class="panel-title">Busqueda de producto <i class="fa fa-search"></i></h3>
  							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										    <div class="form-group">
										    <div class="col-lg-12">
      											<label for="inputEmail" class=" control-label"
      											>Codigo de producto</label>
      										</div>
								      			<div class="col-lg-12">
								        			<input type="text" class="form-control" placeholder="" id="codbarb" value="<?php echo $codbaras; ?>">
								      			</div>
								    		</div>

								    		<div id="gifcarga"></div>
								    		<div class="row">
										<div class="col-md-12">
											<div id="gifcarga2"></div>

										</div>
									</div>
									</div>
								</div>



									<div class="row">
									<div class="col-md-12">
										    <div class="form-group">
										    	<div class="col-lg-8">
      											
      											</div>
								      			<div class="col-lg-4">
								      			<br>
								        			<input type="submit" class="btn btn-primary" value="Buscar" id="btbuscar"></input>
								      			</div>
								    		</div>
									</div>
								</div>

							</div>
				  		</div>
				  </div>

			  <form action="" method="" accept-charset="utf-8"	enctype="multipart/form-data">	
				  <div class="col-md-8">
				  	<div class="panel panel-primary">
  						<div class="panel-heading" id="PanelT">
    						<h3 class="panel-title">Detalle de producto <i class="fa fa-info-circle"></i></h3>
  							</div>
							<div class="panel-body" id="Info">
								<div class="row">
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Codigo de barra</label>
      											<input type="text" class="form-control" id="txtcodbar" placeholder="Codigo de barra" readonly>
									 </div>
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Nombre de producto</label>
      											<input type="text" class="form-control" placeholder="Producto 1"  id="txtnombre" name="nombre">
									 </div>
								
								</div>
								<div class="row">
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Precio</label>
      											<input type="text" class="form-control" id="txtprecio" placeholder="$59.99" >
									 </div>
									 <div class="col-md-6">
											<label>Stock existente</label>
      											<input type="text" class="form-control" id="txtstocke" placeholder="60" >
									 </div>
								</div>
									<div class="row">
									 <div class="col-md-6">
											<label for="inputEmail" class=" control-label"
      										>Tipo de categoria</label>
      										<input type="text" class="form-control" id="txtcat" placeholder="Limpieza	" >
									 </div>
									</div>



								<div class="row">

										</div>
												<div class="col-md-9">
													<br>
													<img id="imgprodu" width="200px">													
												</div>
												<div class="col-md-1">
												<br>
													<input type="button" class="btn btn-primary" value="Confirmar edición" id="btconfirmar"></input>
												</div>
										</div>

								</div>

							</div>
				  		</div>
				  </div>
				</div>
			</form>		
				</div>
				
				</div>
  			</div>
			</div>
		</div>


		<script src="js/jquery-ui.js"></script>
<script src="js/modificacion-producto.js"></script>
			<script src="js/validacionesedicion.js"></script> 


			<style>
  tr {
    margin: 8px;
    font-size: 16px;
    background: yellow;
  }

  </style>
</body>
</html>