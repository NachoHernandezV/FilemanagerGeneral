<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Visor de PDF</title>


<script language="JavaScript"> 
var ancho=screen.width;
var alto=screen.height;
</script>
	
	
</head>
<body style="background:#FFFFFF">

<div align="center">

<table>

<?php

$f=$_POST[nombrereal];
$nombrearchivoreal2=$_POST[nombre2];

$url="archivos/".$nombrearchivoreal2."/".$f;

$anchoPHP = "<script> document.write(ancho) </script>";
$altoPHP = "<script> document.write(alto) </script>";
//echo $anchoPHP." ".$altoPHP;

//echo $f."  --- ".$nombrearchivoreal2.$url;
		echo "<td align='center' colspan='3'>";
		//echo "<A HREF=Imagenes/".$f['nombrereal'].">Abrir</A>";
		/*echo $anchoPHP;
		if($anchoPHP>1920)
			echo "<embed src='$url' href='$url' width='1920' height='1080' ></embed>";*/
	//	echo "l".$anchoPHP."l";

		if(strcmp($anchoPHP,"1920") !== 0)
			echo "<embed src='$url' href='$url' width='1920' height='1080' ></embed>";

		elseif(strcmp($anchoPHP,"1600") !== 0)
			echo "<embed src='$url' href='$url' width='1600' height='900' ></embed>";
		elseif(strcmp($anchoPHP,"1366") !== 0)
			echo "<embed src='$url' href='$url' width='1366' height='768' ></embed>";
		elseif(strcmp($anchoPHP,"1360") !== 0)
			echo "<embed src='$url' href='$url' width='1360' height='768' ></embed>";
		elseif(strcmp($anchoPHP,"1280") !== 0)
			echo "<embed src='$url' href='$url' width='1280' height='1024' ></embed>";
		elseif(strcmp($anchoPHP,"1152") !== 0)
			echo "<embed src='$url' href='$url' width='1152' height='864' ></embed>";
		elseif(strcmp($anchoPHP,"1024") !== 0)
			echo "<embed src='$url' href='$url' width='1360' height='768' ></embed>";
		elseif(strcmp($anchoPHP,"800") !== 0)
			echo "<embed src='$url' href='$url' width='800' height='600' ></embed>";
		else
		echo "<embed src='$url' href='$url' width='1800' height='600' ></embed>";
	
		//echo "<A HREF=\""."archivos/".$nombrearchivoreal2."/".$f."\"/>Abrir</A>";
		echo "</td>";
		
echo "</table>";
?>


</body>
</html>