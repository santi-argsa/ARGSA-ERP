<!-- <nav class="navbar navbar-default">
	 <div http://127.0.0.1/argsa-erp2/ventas.php#class="container-fluid">
	    <div class="navbar-header">
	       <a  class="navbar-brand " href="index.php">ARGSA - ERP</a>
	    </div>
	    	
	 		<ul class="nav navbar-nav">
	        		<li><a href="ventas.php#">Ventas</a></li>
	        		<li><a href="#">Proveedores</a></li>
					<li><a href="#">Productos</a>
	        		</li>
	      		</ul>
	      		<ul class="nav navbar-nav navbar-right">
	      			<li>
	      				<a href="logout.php"><span>
	      				<?php// echo $_SESSION['nombre'], " " ?>
	      				<i class="fa fa-sign-out"></i>	
	      				</span></a>
	      			</li>
	      		</ul>
	</div>
</nav>-->

<?php 
 $url =  "http://" . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];

 ?>

<nav class="navbar navbar-default"  >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand " href="#">ARGSA-ERP</a>
    </div>
    <ul class="nav navbar-nav">
      <li <?php if($url == "http://www.erp.argsa.com.ar/form-ventas.php"){ echo 'class="active"';} ?>><a href="form-ventas.php">Ventas</a></li>
      <li class=" <?php if($url == "http://www.erp.argsa.com.ar/form-alta-productos.php" || $url == "http://www.erp.argsa.com.ar/form-mod-producto.php" ){ echo 'active"';}   ?> dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li ><a href="form-alta-productos.php">Alta</a></li>
          <li><a href="form-baja-producto.php">Baja</a></li>
          <li><a href="form-mod-producto.php">Modificación</a></li> 
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Proveedores
        <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <li><a href="form-alta-proveedores.php">Alta</a></li>
          <li><a href="form-baja-proveedores">Baja</a></li>
          <li><a href="form-mod-proveedores">Modificación</a></li> 
        </ul>
      <li class=" <?php if($url == "http://www.erp.argsa.com.ar/form-caja-actual.php" ){ echo 'active';}   ?> dropdown">	
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Caja
        <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <li><a href="form-caja-actual.php">Visualizar caja actual</a></li>
          <li><a href="#">Cerrar caja</a></li>
          <li><a href="#">Historial de cajas</a></li>
        </ul>
        </li>
        <li <?php if($url == "http://www.erp.argsa.com.ar/form-stock-actual.php"){ echo 'class="active"';} ?>
        ><a href="form-stock-actual.php">Control de Stock</a></li>         
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.php"><?php echo $_SESSION['nombre'], " " ?><span class="glyphicon glyphicon-log-out"></span></a></li>
    </ul>
  </div>
</nav>


