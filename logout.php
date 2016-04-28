<?php 

session_start();

session_unset();

session_destroy();


include 'encabezado.php'
?>


</head>
<body>
<div class="alert alert-success fade in">
	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	<strong>Cerrando Sesion!</strong> Finalizando la sesion.
</div>
</body>
</html>




<?php 
header("refresh:3; url=index.php");
?>
 