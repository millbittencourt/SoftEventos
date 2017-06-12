$(document).ready(function () { 
        var $CampoCpf = $("#cpf");
        var $CampoTelefone = $("#telefone");
        var $CampoTurma = $("#turma");
        
        $CampoCpf.mask('000.000.000-00', {reverse: false});
        $CampoTelefone.mask('(00) 00000-0000', {reverse: false});
        $CampoTurma.mask('0000-0', {reverse: false});
 });