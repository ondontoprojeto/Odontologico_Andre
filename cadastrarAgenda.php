<?php

	include_once 'conexao.php';

	$nome =  $_POST['nome'];
	$nomeconsulta =  $_POST['nomeconsulta'];	
	$dia =  $_POST['dia'];
	$hora =  $_POST['hora'];
	$descricao =  $_POST['descricao'];
	$nomedentista =  $_POST['nomedentista'];


	$consulta = "SELECT * FROM paciente WHERE nome = '$nome'";
    $buscar = mysqli_query($con, $consulta);

    while($array = mysqli_fetch_array($buscar)){
    	$idPaciente = $array['paciente_id'];
        $nome = $array['nome'];
    };

   	$sql = "INSERT INTO atendimento VALUES(null, '{$nome}', '{$dia}', '{$hora}', '{$descricao}', '{$nomedentista}', {$idPaciente}, '{$nomeconsulta}')"; 
   	echo $sql;
	$msg = (mysqli_query($con, $sql)) ? "Gravado com sucesso" : "Erro ao gravar";

	header("location:msgAgenda.php?msg=".$msg);
?>