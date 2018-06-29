<%-- 
    Document   : video
    Created on : 22-jun-2018, 14:00:13
    Author     : X45558RE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/globalcss.css">
        <script src="../js/jquery.js"></script>

        <script src="../js/bootstrap.js"></script>
    </head>
    <body class="gradient2">
        <jsp:include page="../jsp/includes/navegador.jsp" />
        <div class="row">
            <div class="col-lg-6 col-centered">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="480" height="385">
                    <param name="movie" value="http://10.7.48.57:86/nchplayer.swf?host=10.7.48.57:1935&scope=BroadCam&streamName=live&bandwidth=1&src=1&autostart=true&redirect=&textOnOver=">
                    <param name="allowfullscreen" value="true">
                    <param name="quality" value="high">
                    <embed src="http://10.7.48.57:86/nchplayer.swf?host=10.7.48.57:1935&scope=BroadCam&streamName=live&bandwidth=1&src=1&autostart=true&redirect=&textOnOver=" width="480" height="385" allowfullscreen="true" quality="high" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer"/>
                </object>
            </div>
        </div>

    </body>
</html>
