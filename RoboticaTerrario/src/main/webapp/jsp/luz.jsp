<%-- 
    Document   : luz
    Created on : 19-jun-2018, 22:23:50
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/globalcss.css">
        <link rel="stylesheet" type="text/css" href="../css/luz/luz.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/luz.js"></script>
        <script src="../js/bootstrap.js"></script>



    </head>
    <body class="gradient2">
        <jsp:include page="../jsp/includes/navegador.jsp" />
        <div class="container-fluid contenedorPrincipal" >
            <div class="row">
                <div class="col contedorLuces">
                    <div id="luzNormalOff" style="display: block">
                        <img src="../imagenes/apagada.png" alt="luz normal off" class="responsiveImagen">
                    </div>
                    <div id="luzNormalOn" style="display: none">
                        <img src="../imagenes/normal.png" alt="luz normal off" class="responsiveImagen">
                    </div>
                    <br>
                    <button type="button" class="btn btn-success" onclick="onLuzNormal()">Encender</button>
                    <button type="button" class="btn btn-danger" onclick="offLuzNormal()">Apagar</button>  


                </div>
                <div class="col contedorLuces">
                    <div id="luzInfrarojaOff" style="display: block">
                        <img src="../imagenes/apagada.png" alt="luz Infraroja off" class="responsiveImagen">
                    </div>
                    <div id="luzInfrarojaOn" style="display: none">
                        <img src="../imagenes/infraroja.png" alt="luz Infraroja off" class="responsiveImagen">
                    </div>
                    <br>
                    <button type="button" class="btn btn-success" onclick="onLuzInfraroja()">Encender</button>
                    <button type="button" class="btn btn-danger" onclick="offLuzInfraroja()">Apagar</button>  
                </div>

            </div>
        </div>
    </div>
</body>
</html>
