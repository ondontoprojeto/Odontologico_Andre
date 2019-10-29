<!DOCTYPE html>
<html>
	<head>
		<title>Odontologico - Agendamento</title>
		<meta charset="utf-8">			
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="styleHeader.css"> 
        <script>
            function excluir(id){
                if(confirm('Deseja realmente Cancelar esse Agendamento?')){
                    location.href = 'deletarAgenda.php?id=' + id;   
                }
            }
        </script>
	</head>
<body>
	<?php include 'header.php'?>
    <h1 class = "text-center mb-4">Agendamento de Pacientes</h1>

    <div class="container">
        <?php $msg = $_GET["msg"];
             if($msg == "Gravado com sucesso"){  ?>
                <div class="alert alert-success" role="alert">
                    <?php echo $msg;?>
                </div>
        <?php } else {?>
                <div class="alert alert-danger" role="alert">
                    <?php echo $msg;?>
                </div>
        <?php };?>
        <!--<a href="agenda.php">Voltar</a>-->
    </div>
</body>
        	<div class = "pl-5 pr-5">
                <span class = "d-flex d-inline-flex mb-2">
                        <form class="form-inline">
                            <input class="form-control mr-2 ml-1" type="search" name = "nome">
                            <button class="btn btn-primary btn-md mr-3" type="submit">Pesquisar Nome</button>
                        </form>
                        <form class="form-inline">
                            <input class="form-control mr-2 ml-1" type="search" name = "dia">
                            <button class="btn btn-primary btn-md mr-3" type="submit">Pesquisar Data</button>
                        </form>

                    <button type="button" class="btn btn-primary btn-md ml-1" data-toggle="modal" data-target="#modal1">Marcar Consulta</button>
                    <input type="button" class ="btn btn-dark ml-5" onclick="window.print();" value="Imprimir">
                    <!--Modal Formulário de Agendamento -->
                    <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title text-primary" id="modalTitle">Cadastro de Consultas</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h5 class="front-left">Dados da Consulta</h5>
                                    <form class = "form-group mt-2" action="cadastrarAgenda.php" method="post"> 
                                       <div class="form-group">
                                            <label for="nome">Paciente:</label>
                                            <select type="text" class="form-control" id="nome" placeholder="" name="paciente_id">
                                            <?php
                                                include_once 'conexao.php';
                                                $sql = "SELECT * FROM paciente ORDER BY nome ASC";
                                                $busca = mysqli_query($con, $sql);

                                                while($array = mysqli_fetch_array($busca)){
                                                    $id     = $array['id'];
                                                    $nome   = $array['nome'];
                                                    ?>
                                                   <option value='<?php echo $id ?>'><?php echo $nome ?></option> 
                                            <?php } ?>
                                            </select>
                                        </div> 
                                     <!-- AQUI É A LISTA DE SELEÇÃO DA consultas-->
                                       <!--
                                        <div class="form-group">
                                            <label>Tipo da Consulta:</label>
                                            <select class="form-control" name="tipo_de_atendimento" id="atendimentonome" placeholder="" name="atendimentonome">
                                                <?php
                                                    /*
                                                   include_once 'conexao.php';

                                                    $sql = "SELECT * FROM atendimento_tipo";
                                                    $busca = mysqli_query($con, $sql);
                                                    while($array = mysqli_fetch_array($busca)){                                    
                                                        $atendimentonome = $array['atendimentonome'];
                                                    */
                                                ?>
                                                    <!--<option><?php //echo $atendimentonome ?></option> -->
                                                <?php //} ?>                          
                                                <!--
                                            </select>
                                        </div>    
                                        -->
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="data">Data:</label>
                                                <input type="date" class="form-control" id="data" placeholder="data" name="data">
                                            </div>
                                            
                                            <div class="form-group col-md-6">
                                                <label for="hora">Hora:</label>
                                                <input type="time" class="form-control" id="hora" placeholder="hora" name="hora">
                                            </div>
                                        </div>                                                                               
                                        <!-- AQUI É A LISTA DE SELEÇÃO DE DENTISTA-->
                                        <div class="form-group">
                                            <label>Nome Dentista:</label>
                                            <select class="form-control" name="dentista_id" id="nomedentista" placeholder="" name="nomedentista">
                                                <?php
                                                   include_once 'conexao.php';
                                                    $sql = "SELECT * FROM dentista ORDER BY nome ASC";
                                                    $busca = mysqli_query($con, $sql);

                                                while($array = mysqli_fetch_array($busca)){
                                                    $id     = $array['id'];
                                                    $nome   = $array['nome'];
                                                    ?>
                                                   <option value='<?php echo $id ?>'><?php echo $nome ?></option> 
                                                <?php } ?>                          
                                            </select>
                                        </div>

                                        <div class="row">
                                         <div class="form-group col-md-12">
                                              
                                            </div> 
                                        </div>
                                        <div class="form-group">
                                            <label for="obs">Descrição:</label>
                                            <textarea type="text" class="form-control" id="descricao" placeholder="" name = "descricao"></textarea>
                                        </div>  
                                        <div class = "d-flex justify-content-around">                                 
                                            <div class="form-check form-check-inline">  
                                                <input class="form-check-input" type="radio" name="gender" value="agendar" checked> Agendar<br>
                                            </div>
                                            <div class="form-check form-check-inline">  
                                                <input class="form-check-input" type="radio" name="gender" value="confirmar"> Confirmar<br>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" value="cancelar"> Cancelar<br>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" value="realizadas"> Realizadas
                                            </div>
                                        </div>
                                        <input type="submit" class="btn btn-primary float-right mt-3" value = "Cadastrar">
                                    </form>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                    </div>
                </span>

                <div class = "overflow-auto ml-1 mr-1" style = "max-height: 550px">
                    <table class="table w-100 mt-4 table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">atendimento_id </th>
                                <!--<th scope="col">atendimento_nome</th>-->
                                <th scope="col">paciente_nome</th>                               
                                <th scope="col">dentista_nome</th> 
                                <th scope="col">data</th>                               
                                <th scope = "col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php

                                include_once 'conexao.php';
                                //$sql = "SELECT * FROM atendimento";
                                //a.data, 
                                //a.descricao, 
                                //a.nome AS atendimento_nome, 


                            $sql = "SELECT 
                                    a.id AS atendimento_id, 
                                    p.nome AS paciente_nome, 
                                    d.nome AS dentista_nome,
                                    a.data
                                    FROM atendimento a, paciente p, dentista d
                                    WHERE 
                                    a.paciente_id = p.id
                                    AND
                                    a.dentista_id = d.id";
                                $busca = mysqli_query($con, $sql);

                                while($array = mysqli_fetch_array($busca)){
                                    $atendimento_id = $array['atendimento_id'];
                                    //$atendimento_nome = $array['atendimento_nome'];
                                    $paciente_nome = $array['paciente_nome'];
                                    $dentista_nome = $array['dentista_nome'];
                                    $data = $array['data'];
                                    //$hora = $array['hora'];
                                    //Ajuste da formatação da data DD/MM/AAAA
                                    //$dtConsu = explode('-', $data);
                                    //$diaConsu = $dtConsu[2] . "-" . $dtConsu[1]. "-" . $dtConsu[0];
                            ?>
                                <tr>                                    
                                    <td><?php echo $atendimento_id?></td>
                                    <!--<td><?php //echo $atendimento_nome?></td>-->
                                    <td><?php echo $paciente_nome?></td>                                   
                                    <td><?php echo $dentista_nome?></td>
                                    <td><?php echo $data?></td>
                                    <td class = "d-flex justify-content-around">
                                        <a class="btn btn-success btn-sm" href="procedimento.php?atendimento_id=<?php echo $atendimento_id ?>" role="button">
                                            <i class="fa fa-medkit mr-2" aria-hidden="true"></i>
                                            Procedimentos
                                        </a>      

                                        <a class="btn btn-primary btn-sm"  style="color:#fff" href="#" role="button">
                                            <i class="fa fa-eye mr-1" aria-hidden="true"></i> 
                                            Visualizar Ficha
                                        </a>           
                                        <a class="btn btn-warning btn-sm"  style="color:#fff" href="editaragenda.php?id>" role="button">
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                            Editar
                                        </a>  
                                        <a class="btn btn-danger btn-sm"  style="color:#fff" href="deletarAgenda.php" onclick="excluir" role="button">
                                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                                            Cancelar
                                        </a>
                                    </td>
                                </tr>
                            <?php
                        };?>                    
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>     
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>


