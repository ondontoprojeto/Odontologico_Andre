<?php
    include 'conexao.php';
    
    $id = $_GET["idPessoa"];

?>

<!DOCTYPE html>
<html>
	<head>
		<title>Consultas</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="styleHeader.css">
        <script>
            function excluir(id){
                if(confirm('Deseja realmente excluir este produto?')){
                    location.href = 'deletarEstoque.php?id=' + id;   
                }
            }
        </script>
	</head>
	<body>
		
		<?php include 'header.php'?>

        <h1 class = "text-center mb-4">Atendimentos Realizados</h1>
        <?php 
if(isset($_GET['msg'])) {
    echo $_GET['msg'];
}
        ?>
		
		
		<div class = "pl-5 pr-5">
            <button type="button" class="btn btn-primary btn-md ml-1" data-toggle="modal" data-target="#modal1">Cadastro de Consultas</button>
            <input type="button" class ="btn btn-dark ml-5" onclick="window.print();" value="Imprimir">
            <!--Modal-->
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
                                <form class = "form-group mt-2" action="admcadatendimento.php" method="post">
                                    
                                            <!-- AQUI É A LISTA DE SELEÇÃO DA consultas-->
                <div class="form-group">


                <label>Nome da Consulta</label>
                <select class="form-control" name="id_tipoconsulta">
                    
                    <?php
                    
                    include_once 'conexao.php';
                    $sql = "SELECT * FROM tipoconsulta order by nomeconsulta ASC";
                    //echo($sql);
                    $buscar = mysqli_query($con,$sql);

                    while ($array = mysqli_fetch_array($buscar)){
                    
                    $id_tipoconsulta = $array['id_tipoconsulta'];
                    $nomeconsulta = $array['nomeconsulta'];
                    
                    ?>
                    
                    <option value="<?php echo $id_tipoconsulta ?>"><?php echo $nomeconsulta ?></option>

                    
                <?php } ?>
                                        
                    
                </select>
            </div>

                                   
                                    <!--<div class="form-group">-->
                                    <!--    <label for="id_paciente">ID Paciente</label>-->
                                    <input type="hidden" class="form-control" id="id_paciente" placeholder="" name = "id_pessoa" value="<?php echo($id); ?>">
                                    <!--</div>-->

                                    <div class="form-group">


<label>Nome da Consulta</label>
<select class="form-control" name="id_dentista">
    
    <?php
    
    include_once 'conexao.php';
    $sql = "SELECT * FROM dentista order by nome ASC";
    //echo($sql);
    $buscar = mysqli_query($con,$sql);

    while ($array = mysqli_fetch_array($buscar)){
    
    $id_dentista = $array['id_dentista'];
    $nome = $array['nome'];
    
    ?>
    
    <option value="<?php echo $id_dentista ?>"><?php echo $nome ?></option>

    
<?php } ?>
                        
    
</select>
</div>

<div class="form-group">
                                        <label for="descricao">Descrição</label>
                                        <input type="text" class="form-control" id="descricao" placeholder="" name = "descricao">
                                    </div>

                                    <input type="submit" class="btn btn-primary float-right" value = "Cadastrar">
                                </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "overflow-auto ml-1 mr-1" style = "max-height: 550px">
                    <table class="table w-100 mt-4">
                        <thead class="thead-dark">
                            <tr>
                                
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                                <th scope="col">Data</th>
                                <th scope="col">Descrição</th>
                                <th scope="col">Dentista</th>                                
                                <th scope = "col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php

                                include_once 'conexao.php';

$sql = "SELECT 
            a.id_atendimento AS id_atendimento,
            tc.nomeconsulta AS nome,
            a.data AS data,
            a.descricao AS descricao,
            d.nome AS dentista
        FROM atendimento a, pessoa_atendimento pa, dentista d, tipoconsulta tc
        WHERE a.id_atendimento = pa.id_atendimento
        AND d.id_dentista = pa.id_dentista 
        AND tc.id_tipoconsulta = pa.id_tipoconsulta 
        AND   pa.id_pessoa = '$id'";

//echo($sql);
                                $busca = mysqli_query($con, $sql);

                                while($array = mysqli_fetch_array($busca)){


                                    
                                    $id_atendimento = $array['id_atendimento'];
                                    $nome = $array['nome'];
                                    $data = $array['data'];
                                    $descricao = $array['descricao'];
                                    $dentista = $array['dentista']; //andreneves precisa vir dinamico 
                               

                                ?>

                                <tr>
                                    
                                    <td><?php echo $id_atendimento?></td>
                                    <td><?php echo $nome?></td>
                                    <td><?php echo $data?></td>
                                    <td><?php echo $descricao?></td>
                                    <td><?php echo $dentista?></td>
                                    <td>

                                        <!--<a class="btn btn-secondary btn-sm"  style="color:#fff" href="<?php echo $id_atendimento?>" role="button"><i  aria-hidden="true">PROCEDIMENTOS</i></a>-->           
                                        <a class="btn btn-warning btn-sm"  style="color:#fff" href="atendimento_edit.php?id=<?php echo $id_atendimento?>" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                        <a class="btn btn-danger btn-sm"  style="color:#fff" href="deletaAtendimento.php?id=<?php echo $id_atendimento?>" role="button"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>     
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>