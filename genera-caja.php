<?php 
require 'Classes/PHPExcel.php';
require 'Classes/PHPExcel/Writer/Excel2007.php';

/** PHPExcel_Writer_Excel2007 */

require "conexion.php";
$sql = "SELECT  op.id_operacion, pr.nombre, op.codigobarra, op.cantvend, pr.precioventa, op.monto, vt.id_venta,ca.id_caja FROM operaciones AS op INNER JOIN productos AS pr ON op.codigobarra = pr.codigobarra INNER JOIN cajas as ca on op.id_caja = ca.id_caja INNER JOIN ventas AS vt ON op.id_venta = vt.id_venta where ca.estado = 1 order by vt.id_venta desc";

$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
$cantidad = mysqli_num_rows($resultado);
mysqli_close($link);
$fecha =  date("Y-m-d"); 
$objPHPExcel = new PHPExcel();
 
$objPHPExcel->getProperties()->setCreator("ERP-ARGSA");
$objPHPExcel->getProperties()->setLastModifiedBy("ERP");
$objPHPExcel->getProperties()->setTitle("INFORME DE CAJA");
$objPHPExcel->getProperties()->setSubject("CAJA -". $fecha);
$objPHPExcel->getProperties()->setDescription("CAJA GENERADA DESDE PHP CON ERP-ARGSA.");

// Select current sheet
$objPHPExcel->setActiveSheetIndex(0);
// Add some data
$objPHPExcel->getActiveSheet()->SetCellValue('A1', 'NOMBRE DEL PRODUCTO');
$objPHPExcel->getActiveSheet()->SetCellValue('B1', 'PRECIO UNITARIO DE VENTA');
$objPHPExcel->getActiveSheet()->SetCellValue('C1', 'CODIGO BARRA');
$objPHPExcel->getActiveSheet()->SetCellValue('E1', 'PRECIO DE VENTA');
$objPHPExcel->getActiveSheet()->SetCellValue('D1', 'CANTIDAD VENDIDA');
$objPHPExcel->getActiveSheet()->SetCellValue('F1', 'MONTO DE LA VENTA');
$objPHPExcel->getActiveSheet()->SetCellValue('G1', 'ID DE VENTA');
$objPHPExcel->getActiveSheet()->SetCellValue('H1', 'ID DE CAJA');


//column number, which we will be incrementing



$colnum=1;
while ($fila = mysqli_fetch_assoc($resultado))  {
    $colnum++;
    $objPHPExcel->getActiveSheet()->SetCellValue("A".$colnum, $fila['id_operacion']);
    $objPHPExcel->getActiveSheet()->SetCellValue("B".$colnum, $fila['nombre']);
    $objPHPExcel->getActiveSheet()->SetCellValue("C".$colnum, $fila['codigobarra']);
    $objPHPExcel->getActiveSheet()->SetCellValue("E".$colnum, $fila['precioventa']);
    $objPHPExcel->getActiveSheet()->getStyle("E".$colnum)->getNumberFormat()->setFormatCode('[Blue][>=3000]$#,##0;[Red][<0]$#,##0;$#,##0.00');
    $objPHPExcel->getActiveSheet()->getStyle("F".$colnum)->getNumberFormat()->setFormatCode('[Blue][>=3000]$#,##0;[Red][<0]$#,##0;$#,##0.00');
    $objPHPExcel->getActiveSheet()->SetCellValue("D".$colnum, $fila['cantvend']);
    $objPHPExcel->getActiveSheet()->SetCellValue("F".$colnum, $fila['monto']);
    $objPHPExcel->getActiveSheet()->SetCellValue("G".$colnum, $fila['id_venta']);
    $objPHPExcel->getActiveSheet()->SetCellValue("H".$colnum, $fila['id_caja']);

  
/*
    $objPHPExcel->getActiveSheet()->getStyle('A'.$colnum.':H'.$colnum)
->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

$objPHPExcel->getActiveSheet()->getStyle('A'.$colnum.':H'.$colnum)
->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

$objPHPExcel->getActiveSheet()->getStyle('A'.$colnum.':H'.$colnum)
->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

$objPHPExcel->getActiveSheet()->getStyle('A'.$colnum.':H'.$colnum)
->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
*/
 }


  $borders = array(
      'borders' => array(
        'allborders' => array(
          'style' => PHPExcel_Style_Border::BORDER_THIN,
          'color' => array('argb' => 'FF000000'),
        )
      ),
    );
$objPHPExcel->getActiveSheet()->getStyle("A1:H".$colnum)->applyFromArray($borders);

$objPHPExcel->getActiveSheet()->getStyle("A1:H".$colnum)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);



//##################################################//
//#################CALCULA LOS TOTALES############////
//##################################################//

 $filafin = $colnum + 1;
 $objPHPExcel->getActiveSheet()->SetCellValue("C".$filafin,'TOTALES');
 $objPHPExcel->getActiveSheet()->SetCellValue("D".$filafin,'=SUM(D2:D'.$colnum.')');
 $objPHPExcel->getActiveSheet()->SetCellValue("E".$filafin,'=SUM(E2:E'.$colnum.')');
 $objPHPExcel->getActiveSheet()->SetCellValue("F".$filafin,'=SUM(F2:F'.$colnum.')');

$objPHPExcel->getActiveSheet()->getStyle('C2:C'.$filafin)->getNumberFormat()->setFormatCode('##################');
$objPHPExcel->getActiveSheet()->getStyle("E".$filafin)->getNumberFormat()->setFormatCode('[Blue][>=3000]$#,##0;[Red][<0]$#,##0;$#,##0.00');
$objPHPExcel->getActiveSheet()->getStyle("F".$filafin)->getNumberFormat()->setFormatCode('[Blue][>=3000]$#,##0;[Red][<0]$#,##0;$#,##0.00');
/*
  $borders2 = array(
      'borders' => array(
        'allborders' => array(
          'style' => PHPExcel_Style_Border::BORDER_THICK,
          'color' => array('argb' => 'FF000000'),
        )
      ),
    );
$objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)->applyFromArray($borders2);

*/

    $objPHPExcel->getActiveSheet()->getStyle("A1:H".$colnum)
->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("A1:H".$colnum)
->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("A1:H".$colnum)
->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("A1:H".$colnum)
->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);




    $objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)
->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)
->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)
->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)
->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THICK);

$objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)->applyFromArray(array('font' => array('size' => 10,'bold' => true,'color' => array('rgb' => 'FFFFFFF'))));


$objPHPExcel->getActiveSheet()->getStyle("C".$filafin.":F".$filafin)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);








foreach(range('A','H') as $columnID)
{
    $objPHPExcel->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
}

$objPHPExcel->getActiveSheet()->freezePane('A2');
	cellColor('A1','164767');
	cellColor('B1','164767');
	cellColor('C1','164767');
    cellColor('D1','164767');   
    cellColor('E1','164767');
    cellColor('F1','164767');
    cellColor('G1','164767');
    cellColor('H1','164767');
    cellColor('C'.$filafin,'164767');
    cellColor('D'.$filafin,'164767');   
    cellColor('E'.$filafin,'164767');
    cellColor('F'.$filafin,'164767');

    $objPHPExcel->getActiveSheet()->getStyle('A1:H1')->applyFromArray(array('font' => array('size' => 10,'bold' => true,'color' => array('rgb' => 'FFFFFFF'))));

/*
$objPHPExcel->getActiveSheet()->getStyle('A1:H1'.$colnum)
->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
*/

$f=date("y-m-d");
    header('Content-Type: application</span>/vnd.ms-excel');
    $fecha01="reporte".$f.".xls";
    header('Content-Disposition: attachment;filename='.$fecha01.'');
    header('Cache-Control: max-age=0');
 
    $objPHPExcel->getActiveSheet(1)->setTitle('CAJA - '. $f);
    $objWriter=PHPExcel_IOFactory::createWriter ($objPHPExcel,'Excel5');
    $objWriter->save('php://output');
    exit;



    function cellColor($cells,$color){
    global $objPHPExcel;

    $objPHPExcel->getActiveSheet()->getStyle($cells)->getFill()->applyFromArray(array(
        'type' => PHPExcel_Style_Fill::FILL_SOLID,
        'startcolor' => array(
             'rgb' => $color
        )
    ));
}


header("form-caja-actual.php")
?>