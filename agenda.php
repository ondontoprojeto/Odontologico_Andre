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

        <h1 class = "text-center mb-4">Agenda de Pacientes</h1>
		
		
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
                                        <label for="nome">Paciente</label>
                                        <select type="text" class="form-control" id="nome" placeholder="" name = "nome">
                                        <?php
                                            include_once 'conexao.php';

                                            $sql = "SELECT * FROM pessoa";

                                            $busca = mysqli_query($con, $sql);

                                            while($array = mysqli_fetch_array($busca)){

                                                $nome = $array['nome'];

                                                ?>

                                               <option><?php echo $nome ?></option> 
                               
                                        <?php } ?>
                                        </select>
                                    </div> 

                                 <!-- AQUI É A LISTA DE SELEÇÃO DA consultas-->
                                    <div class="form-group">
                                    <label>Tipo da Consulta</label>
                                    <select class="form-control" name="nomeconsulta" id="nomeconsulta" placeholder="" name="nomeconsulta">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM tipoconsulta";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $nomeconsulta = $array['nomeconsulta'];
                               
                                    ?>

                                        <option><?php echo $nomeconsulta ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>
                                            
                                            <div class="row">
                                            <div class="form-group col-md-6">
                                             <label for="data">Data</label>
                                              <input type="date" class="form-control" id="data" placeholder="dia" name="dia">
                                            </div>
                                            
                                            <div class="form-group col-md-4">
                                             <label for="hora">Hora</label>
                                              <input type="time" class="form-control" id="hora" placeholder="hora" name="hora">
                                            </div>
                                            </div>                                    
                                           
                                                                           
                                                                                                                                                                        
                                    
                                    <!-- AQUI É A LISTA DE SELEÇÃO DE DENTISTA-->
                                    <div class="form-group">
                                    <label>Nome Dentista</label>
                                    <select class="form-control" name="nomedentista" id="nomedentista" placeholder="" name="nomedentista">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM dentista";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $nomedentista = $array['nomedentista'];
                               
                                    ?>

                                        <option><?php echo $nomedentista ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>

                                    <div class="row">
                                    <div class="form-group col-md-6 ">
                                    <label>Procedimentos</label>
                                    <select class="form-control" name="tipoproce" id="tipoproce" placeholder="" name="tipoproce">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM procedimento";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $tipoproce = $array['tipoproce'];
                               
                                    ?>

                                        <option><?php echo $tipoproce ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>

                                      <div class="form-group col-md-4 ">
                                        <label for="valor">Valor</label>
                                        <input type="text" class="form-control" id="valor" placeholder="" name = "valor">
                                      </div>
                                    </div>
                                    
                                    <div class="row">
                                    <div class="form-group col-md-6 ">
                                   <!-- <label>Procedimento 2</label> -->
                                    <select class="form-control" name="tipoproce" id="tipoproce" placeholder="" name="tipoproce">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM procedimento";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $tipoproce = $array['tipoproce'];
                               
                                    ?>

                                        <option><?php echo $tipoproce ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>

                                      <div class="form-group col-md-4 ">
                                      <!--  <label for="valor">Valor 2</label> -->
                                        <input type="text" class="form-control" id="valor" placeholder="" name = "valor">
                                      </div>
                                    </div>
                                    
                                    <div class="row">
                                    <div class="form-group col-md-6 ">
                                    <!-- <label>Procedimento 3</label> -->
                                    <select class="form-control" name="tipoproce" id="tipoproce" placeholder="" name="tipoproce">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM procedimento";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $tipoproce = $array['tipoproce'];
                               
                                    ?>

                                        <option><?php echo $tipoproce ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>

                                      <div class="form-group col-md-4 ">
                                       <!-- <label for="valor">Valor 3</label> -->
                                        <input type="text" class="form-control" id="valor" placeholder="" name = "valor">
                                      </div>
                                    </div>
                                  
                                     <div class="form-group">
                                        <label for="obs">Descrição</label>
                                        <textarea type="text" class="form-control" id="descricao" placeholder="" name = "descricao"></textarea>
                                     </div>                                   
                                    

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

                                    <input type="submit" class="btn btn-primary float-right" value = "Cadastrar">
                                </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>

    </span>                
                <div class = "overflow-auto ml-1 mr-1" style = "max-height: 550px">
                    <table class="table w-100 mt-4">
                        <thead class="thead-dark">
                            <tr>
                               <th scope="col">Paciente</th>
                                <th scope="col">Tipo da Consulta</th>
                                <th scope="col">Data</th>
                                <th scope="col">Hora</th>                               
                                <th scope="col">Dentista</th>                                
                                <th scope = "col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php

                                include_once 'conexao.php';

                                $sql = "SELECT * FROM atend";

                                $busca = mysqli_query($con, $sql);

                                while($array = mysqli_fetch_array($busca)){


                                    $nome = $array['nome'];
                                    $nomeconsulta = $array['nomeconsulta'];
                                    $dia = $array['dia'];
                                    $hora = $array['hora'];
                                    $descricao = $array['descricao']; 
                                    $nomedentista = $array['nomedentista'];
                                    $procedimento_1 = $array['procedimento_1'];  
                                    $procedimento_2 = $array['procedimento_2'];
                                    $procedimento_3 = $array['procedimento_3']; 
                                    $valor_1 = $array['valor_1'];
                                    $valor_2 = $array['valor_2'];
                                    $valor_3 = $array['valor_3'];
                                                             
                               
                                    //Ajuste da formatação da data DD/MM/AAAA
                                    $dtConsu = explode('-', $dia);
                                    $diaConsu = $dtConsu[2] . "-" . $dtConsu[1]. "-" . $dtConsu[0];
                            ?>
                                <tr>                                    
                                    <td><?php echo $nome?></td>
                                    <td><?php echo $nomeconsulta?></td>
                                    <td><?php echo $diaConsu?></td>                                    
                                    <td><?php echo $hora?></td>                                   
                                    <td><?php echo $nomedentista?></td>
                                    <td><?php echo $procedimento_1?></td>                                    
                                    <td><?php echo $procedimento_2?></td>                                   
                                    <td><?php echo $procedimento_3?></td>
                                    <td><?php echo $valor_1?></td>                                    
                                    <td><?php echo $valor_2?></td>                                   
                                    <td><?php echo $valor_3?></td>

                                    <td>


                         <button type="button" class="btn btn-secondary btn-sm ml-1" data-toggle="modal" data-target="#modal3">VER CADASTRO</button>   
     
                        <a class="btn btn-success btn-sm" href="consulta.php" role="button">CONSULTAS</a>                               
                        <a class="btn btn-primary btn-sm"  style="color:#fff" href="#" onclick = "excluir(<?php echo $array['id_pessoa']?>)" role="button"><i aria-hidden="true"></i>VER FICHA</a>           

                        <a class="btn btn-warning btn-sm"  style="color:#fff" href="editaragenda.php?id_atend=<?php echo $id?>" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true">EDITAR</i></a>  

                       
                        <a class="btn btn-danger btn-sm"  style="color:#fff" href="#" onclick="excluir(<?php echo $array['id_atend']; ?>)" role="button"><i class="fa fa-trash-o" aria-hidden="true"></i>CANCELAR</a>
                                    </td>
                                </tr>
                            <?php
                        };?>                    

                        </tbody>
                    </table>
                </div>

<!-- <div class="modal fade" id="modal3" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true"> 
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title text-primary ml-5" id="modalTitle">Cadastro de Procedimentos</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body2">
                <h5 class = "ml-4">Tipo de Procedimentos:</h5>
              <form class = "form-group mt-2 ml-4 mr-4" action="AgendaconsuProced.php" method="post">
                <div class="form-group">

                                        <label for="id_atendimento">ID Atendimento</label>
                                        <input type="number" class="form-control" id="id_atend" placeholder="" name = "id_atend">
                                    </div>                    

                                   
                                    <div class="form-group">
                                        <label for="id_paciente">ID Paciente</label>
                                        <input type="text" class="form-control" id="id_paciente" placeholder="" name = "id_paciente">
                                    </div>

                                    <div class="form-group">
                                    <label>Nome do Procedimento</label>
                                    <select class="form-control" name="tipoproce" id="tipoproce" placeholder="" name="tipoproce">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM procedimento";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $tipoproce = $array['tipoproce'];
                               
                                    ?>

                                        <option><?php echo $tipoproce ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>

                                    <div class="form-group">
                                    <label>Nome Dentista</label>
                                    <select class="form-control" name="nomedentista" id="nomedentista" placeholder="" name="nomedentista">
                   
                                    <?php
                                       include_once 'conexao.php';

                                        $sql = "SELECT * FROM dentista";

                                        $busca = mysqli_query($con, $sql);

                                        while($array = mysqli_fetch_array($busca)){
                                    
                                        $nomedentista = $array['nomedentista'];
                               
                                    ?>

                                        <option><?php echo $nomedentista ?></option> 
                               
                                        <?php } ?>                          
                                    </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="valor">Valor</label>
                                        <input type="text" class="form-control" id="valor" placeholder="" name = "valor">
                                    </div>

                                    <div class="form-group">
                                            <label for="Evolução">Evolução</label>
                                            <input type="text" class="form-control" id="evolucao" id="evolucao" placeholder="" name = "evolucao">
                                    </div>
                                    <?php
                                    include_once 'conexao.php';

                                $sql = "SELECT * FROM consuproced";

                                $busca = mysqli_query($con, $sql);

                                while($array = mysqli_fetch_array($busca)){


                                    $id_consuproced = $array['id_consuproced'];
                                    $nomeproced = $array['nomeproced'];
                                    $nomedentista = $array['nomedentista'];
                                    $evolucao = $array['evolucao'];
                                    $valor = $array['valor'];
                                 ?> 

                                 <tr>
                                    
                                    <td><?php echo $id_consuproced?></td>
                                    <td><?php echo $nomeproced?></td>
                                    <td><?php echo $nomedentista?></td>
                                    <td><?php echo $evolucao?></td>
                                    <td><?php echo $valor?></td>
                                    <td>

                                        
                                    </td>
                                </tr>
                            <?php } ?>  
                                    <input type="submit" class="btn btn-primary float-right" value = "Cadastrar">
                                </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div> -->
        </div>
      </div>

            </div>     
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>