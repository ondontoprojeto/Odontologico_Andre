<?php

	include_once 'conexao.php';
	
	$nome =  $_POST['nome'];
	$nomeconsulta =  $_POST['nomeconsulta'];	
	$dia =  $_POST['dia'];
	$hora =  $_POST['hora'];
	$descricao =  $_POST['descricao'];
	$nomedentista =  $_POST['nomedentista'];
    $procedimento_1 = $_POST['procedimento_1'];   
    $procedimento_2 = $_POST['procedimento_2'];
    $procedimento_3 = $_POST['procedimento_3'];
    $valor_1 = $_POST['valor_1'];
    $valor_2 = $_POST['valor_2'];   
    $valor_3 = $_POST['valor_3'];   

	//$id_pessoa =  $_POST['id_pessoa'];



	

   echo $sql = "INSERT INTO atend VALUES(null, '{$nome}','{$nomeconsulta}','{$dia}','{$hora}','{$descricao}','{$nomedentista}','{$procedimento_1}','{$procedimento_2}','{$procedimento_3}','{$valor_1}','{$valor_2}','{$valor_3}')" ;

   //echo $sql = "INSERT INTO paciente VALUES(null, '{$nome}',{id_pessoa}')"; 




   

	// $inserir = mysqli_query($con, $sql);

	$msg = (mysqli_query($con, $sql)) ? "Gravado com sucesso" : "Erro ao gravar";

	header("location:msgAgenda.php?msg=".$msg);
?>