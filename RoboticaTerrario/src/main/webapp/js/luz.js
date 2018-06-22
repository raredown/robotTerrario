/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function traerEstadoLuz() {
    var parametros = {
        "action": 'estadoLuz'
    };
    $.ajax({
        data: parametros,
        url: '../LucesController',
        type: 'post',
        dataType: "json",
        success: function (response) {
            if (response.luzInfraroja == 'ON') {
                $("#luzInfrarojaOff").css("display", "none");
                $("#luzInfrarojaOn").css("display", "block");
            } else {
                $("#luzInfrarojaOn").css("display", "none");
                $("#luzInfrarojaOff").css("display", "block");
            }
            if (response.luzNormal == 'ON') {
                $("#luzNormalOff").css("display", "none");
                $("#luzNormalOn").css("display", "block");
            } else {
                $("#luzNormalOn").css("display", "none");
                $("#luzNormalOff").css("display", "block");
            }

        }, error: function (error) {
            alert(error + 'error');

        }
    });

}
setInterval(traerEstadoLuz, 10000);

function offLuzNormal() {

    var parametros = {
        "action": 'luzNormalOff'
    };
    $.ajax({
        data: parametros,
        url: '../LucesController',
        type: 'post',
        success: function (response) {
            $("#luzNormalOn").css("display", "none");
            $("#luzNormalOff").css("display", "block");

        }, error: function (error) {
            alert(error + 'error');

        }
    });

}
function onLuzNormal() {

    var parametros = {
        "action": 'luzNormalOn'
    };
    $.ajax({
        data: parametros,
        url: '../LucesController',
        type: 'post',
        success: function (response) {
            $("#luzNormalOff").css("display", "none");
            $("#luzNormalOn").css("display", "block");

        }, error: function (error) {
            alert(error + 'error');

        }
    });

}
function offLuzInfraroja() {

    var parametros = {
        "action": 'luzInfrarojaOff'
    };
    $.ajax({
        data: parametros,
        url: '../LucesController',
        type: 'post',
        success: function (response) {
            $("#luzInfrarojaOn").css("display", "none");
            $("#luzInfrarojaOff").css("display", "block");

        }, error: function (error) {
            alert(error + 'error');

        }
    });

}
function onLuzInfraroja() {

    var parametros = {
        "action": 'luzInfrarojaOn'
    };
    $.ajax({
        data: parametros,
        url: '../LucesController',
        type: 'post',
        success: function (response) {
            $("#luzInfrarojaOff").css("display", "none");
            $("#luzInfrarojaOn").css("display", "block");

        }, error: function (error) {
            alert(error + 'error');

        }
    });

}