<?php 
include 'encabezado.php';
$titulo = "ARGSA - Sistema ERP";
?>

</header>
<body>
	<div class="container">
		<?php include 'menu.php';?>	
	
		<div class="panel-body">
    			<div class="row">
    			<div class="col-md-4"></div>
					<div class="col-md-4">
					<h3 align="center"><?php echo $titulo; ?></h3>
						<div class="panel panel-primary">
  							<div class="panel-heading">
    							<h3 class="panel-title">Login <i class="fa fa-sign-in"></i></h3>
  							</div>
							<div class="panel-body">
								<div class="row">
									<form method="POST" action="genera-caja.php"> 
										<div class="col-md-12">
										   

								    		<div class="form-group">
      										<div class="col-lg-4"></div>
								      			<div class="col-lg-4">
								      			<br>
								        			<input type="submit" class="btn btn-primary" value="Generar caja"></input>
								      			</div>
								    		</div>
										</div>
									</form>
						
								</div>
								<br>
								
							</div>
						</div>
					</div>	
				</div>
		</div>
	</div>
</body>
</html>