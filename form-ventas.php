	<?php 
require 'validar.php';
require "conexion.php";
include 'encabezado.php';

$sql = "SELECT  nombre, precio, (precio * stockexistente) as monto, stockexistente, codigobarra  FROM productos";
/*
$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
$cantidad = mysqli_num_rows($resultado);
mysqli_close($link);
*/
$titulo = "Sistema ERP - Panel de ventas";
?>
<script src="js/bootstrap3-typeahead.js"></script>
<script src="js/jquery-ui.js"></script>
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
								        			<input type="text" class="form-control" placeholder="Ingrese codigo de producto..." id="codbarb">	
								      			</div>
								    		</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
									<br>
										    <div class="form-group">
										    <div class="col-lg-12">
      											<label for="inputEmail" class=" control-label"
      											>Nombre del producto</label>
      										</div>
								      			<div class="col-lg-12">
								        			<input type="text" class="form-control" placeholder="Ingrese Nombre del producto..." id="nomprod" name="nomprod" data-provide="typeahead">	
								      			</div>

								    		</div>
									</div>
								</div>



									<div class="row">
									<div class="col-md-12">
										    <div class="form-group">
										    	<div class="col-lg-8">
      											
      										</div>								      			
								    		</div>
								    		<div class="row">
								    		<div id="gifcarga"></div>
											<div class="col-md-12">
												<div id="gifcarga2"></div>
											</div>
											</div>

									</div>
								</div>

							</div>
				  		</div>
				  </div>

				  <div class="col-md-8">
				  	<div class="panel panel-primary">
  						<div class="panel-heading" id="PanelT">
    						<h3 class="panel-title">Detalle de producto <i class="fa fa-info-circle"></i></h3>
  							</div>
							<div class="panel-body" id="Info">
								<div class="row">
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Nombre de producto</label>
      											<input type="text" class="form-control" placeholder="Producto 1"  id="txtnombre">
									 </div>
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Codigo de barra</label>
      											<input type="text" class="form-control" id="txtcodbar" placeholder="Codigo de barra" >
									 </div>
								</div>
								<div class="row">
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Precio</label>
      											<input type="text" class="form-control" id="txtprecio" placeholder="$59.99" >
									 </div>
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Tipo de categoria</label>
      											<input type="text" class="form-control" id="txtcat" placeholder="Limpieza	" >
									 </div>
								</div>
								<div class="row">
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Stock existente</label>
      											<input type="text" class="form-control" id="txtstocke" placeholder="60" >
									 </div>
									 <div class="col-md-6">
									 	<label for="inputEmail" class=" control-label"
      											>Cantidad a vender</label>
      											<input type="number"  min="1" class="form-control" id="txtcantv" placeholder="15" >
									 </div>
								</div>
								<div class="row">
									<div class="col-md-12">
											<label for="inputEmail" class=" control-label"
      											>Cantidad a vender</label>
      											 <select class="form-control" id="select">
												          <option>Normal</option>
												          <option>Promocion</option>
												          <option>Empleado</option>
												        </select> 
									</div>
								</div>
												<div class="col-md-9">
													<br>
													<input type="submit" value="Agregar al carrito" id="btvender"class="btn btn-primary" >
					
												</div>
												<div class="col-md-1">
												<br>
												<!--
													<input type="submit" class="btn btn-primary" value="Confirmar Venta" id="btconfirmar"></input>-->
												</div>

										</div>

								</div>

							</div>
				  		</div>

				  		<div class="row">
				  			<div class="col-md-12">
				  			<div class="col-md-10">
				  				
				  				

				  			</div>

				  			<div class="col-md-2">
				  				<input type="submit" class="btn btn-success" value="Confirmar Venta" id="btconfirmar"></input>
				  				
				  			</div>
				  			</div>
				  		</div>


				  		<div class="row" id="PanelDetalle">
				  			<div class="col-md-12">
				  				<br>
				  				<!-- ######## ACA VA LA TALBA CON EL DETALLE Y EL TOTAL DE LA COMPRA-->
					<div class="panel panel-primary">
  						<div class="panel-heading" >
    						<h3 class="panel-title">Detalle de Compra <i class="fa fa-info-circle"></i></h3>
  						</div>
  							

  							<table id="tabladetallet" class="table table-striped table-hover" >
										<thead>
										    <tr class="success">
										      
										      <th>Cantidad de productos</th>
										  	  <th>Monto totdal de la compra</th>
										    </tr>
										  </thead>
										  <tbody id="detallesv">
											<tr>
												<td id="cantidadvendida"></td>
												<td id="montovendido"></td>
											</tr>
										  </tbody>
							</table>




  						</div>
				  			</div>
				  		</div>
				  </div>
				</div>
					<div class="row" id="carrito">
					<div class="col-md-12">
						<div class="panel panel-primary" >
  							<div class="panel-heading">
    							<h3 class="panel-title">Carrito de compras <i class="fa fa-shopping-cart"></i></h3>
  							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<table id="tablaventas" class="table table-striped table-hover" >
										<thead>
										    <tr class="success">
										      
										      <th>Nombre</th>
										      <th>Precio</th>
										      <th>Monto</th>
										      <th>Cantidad Vendida</th>
										      <th>Codigobarra</th>
										      <th>Eliminar?</th>
										    </tr>
										  </thead>
										  <tbody id="ventas">

	    	  	<?php 
					//while ($fila = mysqli_fetch_assoc($resultado)){					
				?>
				<!--
					<tr>
						<td><?php// echo  $fila['idproducto']; ?></td>
						<td><?php// echo  $fila['nombre']; ?></td>
						<td><?php// echo  $fila['precio']; ?></td>
						<td><?php// echo  $fila['monto']; ?></td>
						<td><?php// echo  $fila['stockexistente']; ?></td>
						<td><?php// echo  $fila['codigobarra'];?></td>
						<td><a onclick="Eliminar(this.parentNode.parentNode.rowIndex)"><span><i class="fa fa-trash"></td>
					</tr>		

					<?php // } ?>

					
-->
										  </tbody>
										</table>
									</div>
								</div>
							</div>
				  		</div>
				  	</div>
				</div>
				<div class="row" id="panelde">
					<div class="col-md-12">
						<div class="panel panel-primary">
  							<div class="panel-heading">
    							<h3 class="panel-title">Detalle <i class="fa fa-shopping-bag"></i></h3>
  							</div>
							<div class="panel-body">	
							<div class="col-md-4"></div>
							<div class="col-md-8">
								<div id="dventas"></div>
								</div>
							</div>
				  		</div>
				  	</div>
				</div>
  			</div>
			</div>
		</div>



			<script src="js/confirmarventa.js"></script>
</body>
</html>