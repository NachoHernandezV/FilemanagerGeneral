<?php
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>File manager</title>
	<link rel="stylesheet" href="css/Estilos.css">
	<meta name="generator" content="Geany 1.22" />
	
	<style type="text/css">	
	.transparente {
		background-color:transparent;
		-moz-border-radius:4px;
		-webkit-border-radius:4px;
		border-radius:4px;
		border:0px solid #ffffff;
		display:inline-block;
		cursor:pointer;
		color:#ff1f32;
		font-family:Georgia;
		font-size:12px;
		padding:3px 13px;
		text-decoration:none;
		text-shadow:0px 1px 0px #b23e35;
	}
	.transparente:hover {
		background-color:transparent;
	}
	.transparente:active {
		position:relative;
		top:1px;
	}
	
	.text_encima {
		position: absolute;
		color: #7715D1;
		font-size: 13px;
		font-family: arial;
	}
	
	
.regresar {
	-moz-box-shadow:inset 0px 39px 0px -24px #e67a73;
	-webkit-box-shadow:inset 0px 39px 0px -24px #e67a73;
	box-shadow:inset 0px 39px 0px -24px #e67a73;
	background-color:#e4685d;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:5px 15px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.regresar:hover {
	background-color:#eb675e;
}
.regresar:active {
	position:relative;
	top:1px;
}


	</style>
</head>




<body background="fond3.png">
	<h2 align="center">
	<FONT size="4" FACE="small fonts" color="#3B170B"><strong>Archivos Compartidos</strong></FONT>
	</h2>
	<br/>
	
	
<table width="85%" border="1px" align="center">
	
	<?php
		
		include 'Datos/conexion.php';
		$departamentoBOTON="";
		$departamentoUSER=$_SESSION['depart'];
		$Areas=$_POST[Areas];
		$Misarchivos=$_POST[MisArchivos];
		
		//formar la RUTA DE SIGUIENTE
		$_SESSION['ruta'].='/'.$_POST['madrecarp'];
	
		
		if($_POST['retroceder'] == 1)
		{
				$longitudMAX=strlen($_SESSION['ruta']);
				
				
				$rutacompleta=$_SESSION['ruta'];
				$contador=0;
				
					
					$num=0;
				for($i=$longitudMAX;$i>=0;$i--)
				{
					if($contador == 1)
					{
						$rutase[$num]=$rutacompleta[$i];
					}
					if($rutacompleta[$i] == '/')
						{
							$contador=1;
						}
					$num=$num + 1;
				}
				
				///////////////////
				$num=0;
				$contador=0;
				//$longitudMAX2=strlen($rutase);
				for($i=0; $i<=$longitudMAX; $i++)
				{

					if($contador == 1)
					{
						$rutase2[$num]=$rutase[$i];
					}
					
						if($rutase[$i] == '/')
					{
						$contador=1;
					}
					
					
					$num=$num + 1;
				}
				///////////////////
				for($n=$longitudMAX;$n>=0;$n--)
				{
					$rutaprocesada.=$rutase2[$n];
				}
				//echo $rutaprocesada;	
				$_SESSION['ruta']=$rutaprocesada;
		}
		
		
	
						echo "<tr>";
						//ELABORACION DE BOTON REGRESAR
						if( empty($_POST['madrecarp']) )
						{
							
						}
						else
						{
							//nombre carpeta madre REGRESAR
							$consultaarchivos3="SELECT c.carpetaMadre FROM carpetas c WHERE c.carpeta='".$_POST['madrecarp']."'";
							$re3=mysqli_query($con,$consultaarchivos3);
							$carpetamadreANTERIOR=mysqli_fetch_array($re3);
							
							//ID CARPETA MADRE A REGRESAR
							$consultaarchivos4="SELECT c.idcarpeta FROM carpetas c WHERE c.carpeta='".$carpetamadreANTERIOR[0]."'";
							$re4=mysqli_query($con,$consultaarchivos4);
							$IDcarpetamadreANTERIOR=mysqli_fetch_array($re4);
							
							if($carpetamadreANTERIOR[0]=='Cero')
							{
								$raiz="Cero";
								$IDcarpetamadreANTERIOR[0]=0;
							}
		
								if($_POST['regresarraiz']!="Cero")
								{
									echo "<form name='formulario' method='post' action='central.php'>";
														echo "<td align='left'>";
														echo "<input  type='submit' name='Atras' class='regresar' Value='Atras' width='90' height='95' /></br>";		
														echo "</td>";
														echo "<td align='left'>";
														echo "<label for='ruta'>$_SESSION[ruta]</label>";
														echo "</td>";
														echo "<td align='center'>";
															echo  "<input type='hidden' name='codigoarchivocar' value='".$IDcarpetamadreANTERIOR[0]."' />";
														echo "</td>";
														echo "<td align='center'>";
															echo  "<input type='hidden' name='madrecarp' value='".$carpetamadreANTERIOR[0]."' />";
														echo "</td>";
														echo "<td align='center'>";
															echo  "<input type='hidden' name='regresarraiz' value='".$raiz."' />";
														echo "</td>";
														echo "<td align='center'>";
															echo  "<input type='hidden' name='retroceder' value='1' />";
														echo "</td>";
									echo "</form>";
								}
		
						}
						echo "</tr>";
					/////////////////////////////////
	
		echo "</table>";
		echo "<table border='0px' align='center'>";
		
		
		
		$consultaarchivos2="SELECT count(*)FROM carpetas a WHERE a.carpetaMadre='".$_POST['madrecarp']."'";
		
		if($Misarchivos=="Mis Archivos")
		{	
			$consultaarchivos2="SELECT count(*) FROM carpetas a WHERE a.carpetaMadre='Cero'";
			$_SESSION['ruta']='';
		}
		
		$re2=mysqli_query($con,$consultaarchivos2);
		$f2=mysqli_fetch_array($re2);
		$columnas=3*$f2[0];
		
		echo "<tr>";
		echo "<td align='center' colspan='$columnas'>";
		echo "<FONT size='4' FACE='small fonts' color='#3B170B'><strong>Carpetas</strong></FONT>";
		echo "</td>";
		echo "</tr>";
	
	
	
		
	
			mysqli_set_charset($con,"utf8");

			//cargar la carpeta madre
			 $_SESSION['carpetamadre']=$_POST['madrecarp'];
		
		if($Misarchivos=="Mis Archivos" or $_POST['regresarraiz']=="Cero")
		{
			$_SESSION['Areas']=$departamentoUSER;
			
			$consultaarchivos="SELECT a.idcarpeta,a.carpeta,a.carpetaMadre FROM carpetas a WHERE a.carpetaMadre='Cero'";
			$re=mysqli_query($con,$consultaarchivos);
					
				$num='0';
				while ($f=mysqli_fetch_array($re)) 
				{		
						echo "<form name='formulario2' method='post' action='central.php'>";
							echo "<td align='center'>";
							echo "<input type=image border=0 ALIGN='BOTTOM' src='imagenes/carpeta.png'  name='$f[carpeta]' width='90' height='95'></br>";
							echo "<font size='3'>$f[carpeta]</font>";		
							echo "</td>";
							echo "<td align='center'>";
								echo  "<input type='hidden' name='codigoarchivocar' value='$f[idcarpeta]' />";
							echo "</td>";
							echo "<td align='center'>";
								echo  "<input type='hidden' name='madrecarp' value='$f[carpeta]' />";
							echo "</td>";
						echo "</form>";
				}
		}
		////////////////FIN BOTON MIS ARCHIVOS
		
		
		
		if($_POST[codigoarchivo] > 0) //Para cuando se elimina se cargen otra vez los DATOS pero sin e eliminado
		{
			$Areas=$departamentoUSER;
			
			$consultaarchivos1="DELETE from permisos WHERE idarchivo='".$_POST[codigoarchivo]."'";
			mysqli_query($con,$consultaarchivos1);
			
			$consultaarchivos="DELETE from archivos WHERE idarchivo='".$_POST[codigoarchivo]."'";
			mysqli_query($con,$consultaarchivos);
			
		}
			
		
		
		if($_POST['codigoarchivocar'] > 0) ///PARA TODAS LAS SUBCARPETAS Y ARCHIVOS INTERNOS
		{
			//CREAR SUBCARPETAS
				$consultaarchivos="SELECT a.idcarpeta,a.carpeta,a.carpetaMadre FROM carpetas a WHERE a.carpetaMadre='".$_POST['madrecarp']."'";
				$re=mysqli_query($con,$consultaarchivos);
					
					while ($f=mysqli_fetch_array($re)) 
					{		
							echo "<form name='formulario' method='post' action='central.php'>";
								echo "<td align='center'>";
								echo "<input type=image src='imagenes/carpeta.png'  name='$f[carpeta]' width='90' height='95' /></br>";
								echo "<font size='3'>$f[carpeta]</font>";		
								echo "</td>";
								echo "<td align='center'>";
									echo  "<input type='hidden' name='codigoarchivocar' value='".$f['idcarpeta']."' />";
								echo "</td>";
								echo "<td align='center'>";
									echo  "<input type='hidden' name='madrecarp' value='$f[carpeta]' />";
								echo "</td>";
							echo "</form>";
					}
			//FIN DE LAS SUBCARPETAS
			
			
		}  ///FIN DE LAS SUBCARPETAS Y ARCHIVOS
	
	echo "</table>";
	
	


	echo "</br>";
	echo "</br>";

	////////////////////////////////////////////////////INICIO DE LA TABLA PARA ARCHIVOS
	echo "<table border='1px' align='center'>";
	echo "<tr>";
		echo "<td align='center' colspan='10'>";
		echo "<FONT size='4' FACE='small fonts' color='#3B170B'><strong>Archivos</strong></FONT>";
		echo "</td>";
	echo "</tr>";
	
	echo "<tr>";
		echo "<td align='center' colspan='2'>";
		echo "<FONT size='3' FACE='small fonts' color='#3B170B'>Nombre</FONT>";
		echo "</td>";

		
		echo "<td align='center' colspan='3'>";
		echo "<FONT size='3' FACE='small fonts' color='#3B170B'>Tipo</FONT>";
		echo "</td>";
	
		
		echo "<td align='center'>";
		echo "<FONT size='3' FACE='small fonts' color='#3B170B'>Edicion</FONT>";
		echo "</td>";

		
		echo "<td align='center' colspan='4'>";
		echo "<FONT size='3' FACE='small fonts' color='#3B170B'>Acciones</FONT>";
		echo "</td>";

	echo "</tr>";
		
		if( $_POST['codigoarchivocar']>0 )
		{
			//CREAR FICHEROS INTERNOS	
			//obtener el area juna
					$consultaarchivos2="SELECT * FROM departamentos WHERE departamento='".$Areas."'";
					$re2=mysqli_query($con,$consultaarchivos2);
					
					while ($f2=mysqli_fetch_array($re2))
					{
						$nombrearchivoreal2=$f2['departamentoJunto'];
					}
				//////////////////
				
				
			
				$consultaarchivos="SELECT a.idarchivo,a.nombrearchivo,a.nombrereal,a.fecha FROM permisos p, archivos a WHERE a.idarchivo=p.idarchivo and a.departamento='".$_SESSION['Areas']."' and p.".$_SESSION['depart']."='si' and a.idcarpeta='".$_POST[codigoarchivocar]."'";
				$re=mysqli_query($con,$consultaarchivos);
				
				
				$num='0';
				while ($f=mysqli_fetch_array($re)) 
				{
					$num=$num+1;
					$nombrearchivoreal=$f['nombrereal'];
					//OBTENER LA EXTENCION DE ARCHIVO
					$iniciopunto='0';
					for($i=0;$i<=strlen($nombrearchivoreal) ;$i++)
					{
						if($nombrearchivoreal[$i]==".")
						$iniciopunto=$i;
					}
					$extarchivo=substr($nombrearchivoreal,$iniciopunto,5);  // bcd
					
					///////////////////
					
					
					echo "<tr>";
						
						echo "<td align='center' colspan='2'>";
						echo $f['nombrearchivo'];
						echo "</td>";
				
						
						
						echo "<td align='center' colspan='3'>".$extarchivo."</td>";
						
						echo "<td align='center'>";
						echo $f['fecha'];
						echo "</td>";
						
						
						echo "<td align='center' colspan='3'>";
						//echo "<A HREF=Imagenes/".$f['nombrereal'].">Abrir</A>";
						echo "<A HREF=\""."archivos/".$nombrearchivoreal2."/".$f['nombrereal']."\"/>Abrir</A>";
						echo "</td>";
						
						if($departamentoUSER==$_SESSION['Areas'])
						{
						echo "<form name='formulario' method='post' action='central.php'>";
						
								echo "<td align='center'>";
									echo "<input type='submit' name='eliminar".$num."' value='Eliminar' class='transparente' />";
								echo "</td>";
								
								echo "<td align='center'>";
									echo  "<input type='hidden' name='codigoarchivo' value='".$f['idarchivo']."' />";
								echo "</td>";
								
								echo "<td align='center'>";
									echo  "<input type='hidden' name='department' value='".$Areas."' />";
								echo "</td>";
								
								
						echo "</form>";
						}
					echo "</tr>";
					
						
				}
				//FIN ARCHIVOS
		}
			
		
		
		
		
					echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
					
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
				
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						echo "<td align='center'>&nbsp&nbsp&nbsp</td>";
						echo "</table>";
						
						
						
						
		
	?>
</table>	

</body>
</html>