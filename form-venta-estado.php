<?php 
$estados = $_GET['estado'];
$titulo = "ESTADO DE VENTA";
include 'encabezado.php';


 ?>
<div class="container">
		<?php include 'menu2.php';?>	
			<div class="panel panel-primary">
  				<div class="panel-heading">
    				<h3 class="panel-title"><?php echo $titulo; ?></h3>
  				</div>
  				<div class="panel-body">
					<div class="panel-body">

						<div class="alert alert-success fade in" id="mjserror2"><a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a><strong>ESTADO!: VENTA OK!!!
						<?php
						 echo $estados;
						?></strong></div>

						<div class="col-md-5"></div>
						<input type="button" value="Aceptar" class="btn btn-primary" onclick="formventas()">
					</div>
				</div>
			</div>
</div>
<script src="js/confirmarventa.js"></script>
										    	