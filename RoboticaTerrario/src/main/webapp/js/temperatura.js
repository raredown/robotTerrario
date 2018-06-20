/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function traerTemperatura() {
    $.ajax({
        url: 'TemperaturaController',
        type: 'post',
        dataType: "json",
        success: function (response) {
            $('.temperaturaText').text(response.temperaturaFria+'º'+" || "+response.temperaturaCaliente+'º');
        }, error: function (error) {
           alert(error+'error');

        }
    });
   
}
 setInterval(traerTemperatura, 10000);
