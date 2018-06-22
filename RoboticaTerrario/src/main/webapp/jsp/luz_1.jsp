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
        <link rel="stylesheet" type="text/css" href="../css/luz/pruebas.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/luz.js"></script>
        <script src="../js/bootstrap.js"></script>



    </head>
    <body class="gradient2">
        <jsp:include page="../jsp/includes/navegador.jsp" />
        <div class="container-fluid contenedorPrincipal" >
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-success" onclick="onLuzNormal()">Encender</button>
                    <button type="button" class="btn btn-danger" onclick="offLuzNormal()">Apagar</button>  
                    <div id="luzNormalOn" style="display: none">
                        <h2>Encedida Luz</h2>
                    </div>
                    <div id="luzNormalOff" style="display: none">
                        <h2>Apagada Luz</h2>
                    </div>
                </div>
                <div class="col">
                    <h2>Encedida Infrarojo</h2>
                    <h2>Apagada Infrarojo</h2>
                    <button type="button" class="btn btn-success">Encender</button>
                    <button type="button" class="btn btn-danger">Apagar</button>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
