<%-- 
    Document   : index
    Created on : 18-jun-2018, 17:28:31
    Author     : X45558RE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/temperatura.js"></script>



        <link rel="stylesheet" type="text/css" href="css/menuHome/menuHome.css">
        <script src="js/menuHome/menuHome.js"></script>


    </head>
    <body class="gradient2">
        <jsp:include page="jsp/includes/navegador.jsp" />

        <div class="container-fluid contenedorPrincipal" >
            <div class="row">
                <div class="col">
                    <h1 class="text-center tituloPrincipal">TOCA PARA ABRIR EL MENU CORRESPONDIENTE</h1>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div id="huevo">
                        <p class="titulo">Temperatura</p>
                        <br>
                        <p class='temperaturaText'>0º || 0º</p>
                    </div>
                </div>
                <div class="col">
                    <div id="huevo" onclick="window.location.href = 'jsp/video.jsp'">
                        <p class="titulo">Video</p>
                    </div>
                </div>
                <div class="col">
                    <div id="huevo" onclick="window.location.href = 'jsp/luz.jsp'">
                        <p class="titulo">Luz</p>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
