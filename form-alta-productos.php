<?php 
require 'validar.php';
require "conexion.php";
include 'encabezado.php';
mysqli_close($link);
$titulo = "Alta de productos";


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
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12">
										<form action="alta-producto.php" method="post" accept-charset="utf-8" 
												enctype="multipart/form-data">
											    <div class="form-group">
										    		<div class="col-lg-6">
      												<label for="inputEmail" class=" control-label"
      												>Nombre del Producto</label>
									        			<input type="text" class="form-control" placeholder="Ingrese Nombre del producto..." id="codbarb" name="nombre">	
									      			</div>
									      			<div class="col-lg-6">
      												<label for="inputEmail" class=" control-label"
      												>Codigo de producto</label>
									        			<input type="text" class="form-control" placeholder="Ingrese codigo de producto..." id="codbarb" name="codproducto">	
									      			</div>

									      			<div class="col-lg-6">
									      			<br>
      												<label for="inputEmail" class=" control-label"
      												>Proveedor</label>
									        			<input type="text" class="form-control" placeholder="Ingrese codigo el proveedor..." id="codbarb" name="codproveedor">	
									      			</div>
									      			<div class="col-lg-6">
									      			<br>
      												<label for="inputEmail" class=" control-label"
      												>Precio de venta</label>
									        			<input type="text" class="form-control" placeholder="Ingrese precio de venta..." id="codbarb" name="precioventa">	
									      			</div>

									      			<div class="col-lg-6">
									      			<br>
      												<label for="inputEmail" class=" control-label"
      												>Precio de compra</label>
									        			<input type="text" class="form-control" placeholder="Ingrese precio de compra..." id="codbarb" name="preciocompra">	
									      			</div>
									      			<div class="col-lg-6">
									      			<br>
      												  <label for="sel1">Tipo de producto:</label>
														  <select class="form-control" id="sel1" name="tipoproducto">
 														   <option>1</option>
 														   <option>2</option>
 														   <option>3</option>
 														   <option>4</option>
 														 </select>	
									      			</div>
									      			<div class="col-lg-6">
									      			<br>
      												<label for="inputEmail" class=" control-label"
      												>Stock</label>
									        			<input type="text" class="form-control" placeholder="Ingrese stock..." id="stock" name="stock">	
									      			</div>
									      			<div class="col-lg-6">
									      			<br>
      												<label for="inputEmail" class=" control-label"
      												>Imagen</label>
									        			<input type="file" name="foto1">	
									        			<br>
									        			<div class="col-lg-4"></div>
									        			<img src="img/noimg.png" alt="" height="72" width="80" margin/><span></span>
									      			</div>
									      			<div class="col-lg-6">
									      			<br>
      												<label for="inputEmail" class=" control-label"
      												>Descripcion del producto</label>
									        			<textarea  class="form-control" rows="5" name="descripcion"></textarea>
									      			</div>
								    			</div>
									</div>
									<div class="row">
										<div class="col-md-12">
										    <div class="form-group">
										    		<div class="col-lg-6">
									      			<br>
									        		<input type="button" class="btn btn-danger" value="Cancelar" id="btcancelar" onclick="formventas()">
									      			</div>
									      			<div class="col-lg-4"></div>
									      			<div class="col-lg-1">
									      			<br>			
      												<input type="submit" class="btn btn-success" 
								        			value="Agregar" id="btagregar"></input>
									      			</div>									    
								      			<div class="col-lg-8">
								      				<br>
								      			</div>
								    			</div>
											</div>
										</form></div>
									</div>
				  			</div>
				  	</div>
<script src="js/validacionesproductos.js"></script>
</body>
</html>