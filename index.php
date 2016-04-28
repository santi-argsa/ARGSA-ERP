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
									<form method="POST" action="login.php"> 
										<div class="col-md-12">
										    <div class="form-group">
										    <div class="col-lg-12">
      											<label for="inputEmail" class=" control-label"
      											>Usuario</label>
      										</div>
								      			<div class="col-lg-12">
								        			<input type="text" class="form-control" name="usu_login" placeholder="Ingrese su usuario">
								      			</div>
								    		</div>
								    		<div class="form-group">
										    <div class="col-lg-12">
										    <br>		
      											<label for="inputEmail" class=" control-label"
      											>Contraseña</label>
      										</div>
								      			<div class="col-lg-12">
								        			<input type="password" class="form-control" name="usu_clave" placeholder="Ingrese su contraseña">	
								      			</div>
								    		</div>

								    		<div class="form-group">
      										<div class="col-lg-4"></div>
								      			<div class="col-lg-4">
								      			<br>
								        			<input type="submit" class="btn btn-primary" value="Ingresar"></input>
								      			</div>
								    		</div>
										</div>
									</form>
						
								</div>
								<br>
											<?php 
									if (isset($_GET['error'])){
 									if ($_GET['error'] == "1"){ ?>
									<div class="alert alert-danger fade in">
    									<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
    									<strong>Error de Ingreso!</strong> Usuario y/o contraseña incorrecto.
									</div>
									<?php 
										}
										else if ($_GET['error'] == "2"){ ?>
									<div class="alert alert-warning fade in">
    									<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
    									<strong>Usuario no Logueado!</strong> Ingrese usuario y contraseña.
									</div>
									<?php 
										}
										}	
 										?>
							</div>
						</div>
					</div>	
				</div>
		</div>
	</div>
</body>
</html>