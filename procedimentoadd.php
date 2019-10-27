<?php

	include_once 'conexao.php';
    //$id                     = $_POST['id'];
    $atendimento_id         = $_POST['atendimento_id'];
    $procedimento_tipo_id   = $_POST['procedimento_tipo_id'];
	$valor                  = $_POST['valor'];
    $obs                    = $_POST['obs'];
	
    $sql = "INSERT INTO procedimento VALUES(null,null,null, '{$valor}', '{$obs}')"; 

	// $inserir = mysqli_query($con, $sql);

	$msg = (mysqli_query($con, $sql)) ? "Gravado com sucesso" : "Erro ao gravar";

	header("location:msgProcedimento.php?msg=".$msg);
?>