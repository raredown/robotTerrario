<!--
********************************************************************************************************
 Attributes:
   Limit -> How many rows for page.
   Total -> How many objets for viewer.
   ActualLink -> Number of the actual link.
   DirecURL -> URL of the servlet.
   Parametres -> Parameters of the servlet. The last attribute is the number of link. Example:
                 ?Date=01/01/1999&Color=Blue&Link=
                 Parameters are: Date,Color and Link
********************************************************************************************************
-->

<%
         
          int limit=(new Integer(request.getParameter("Limit"))).intValue();
          int total=(new Integer(request.getParameter("Total"))).intValue();
          int actuallink=(new Integer(request.getParameter("ActualLink"))).intValue();
       	  String directurl=(String)request.getParameter("DirectURL");
      
          int maximoPermitido=10;  // Number maxim of links in a view

          int iniLink= (int)(((actuallink-1)/maximoPermitido)*maximoPermitido)+1;

          int posActual=(actuallink-1)*limit;

          int divi=(int)((total-1)/limit)-iniLink+1;

          int queden=total-(iniLink-1)*limit;
          int posterior=iniLink+maximoPermitido;
	  int anterior=iniLink-maximoPermitido;
       
          
%>
	<p align="center">


<%
          if(iniLink>maximoPermitido)
          {
            String llamadaServlet=directurl+anterior+")";
%>
             <a href=<%=llamadaServlet%> 
             	onMouseOver="window.status='Anterior';return true;" 
             	onMouseOut="window.status=' '" class="texto2"> Anterior </a> &nbsp;
<%
          }
          int i,j;
          for(i=0,j=iniLink;i<maximoPermitido&&i<=divi;i++,j++)
          {
            if(j==actuallink)
            { 
%>
	       <strong ><font class="texto5"><%=j%></font></strong> &nbsp;
<%          }
             else
            {
              String llamadaServlet=directurl+j+")";
%>
             <a href=<%=llamadaServlet%> 
             	onMouseOver="window.status='<%=j%>';return true;" 
             	onMouseOut="window.status=' '" class="texto2"> <%=j%> </a> &nbsp;
<%
	    }
          }

          if(queden>maximoPermitido*limit)
          {
            String llamadaServlet=directurl+posterior+")";
%>
             <a href=<%=llamadaServlet%> 
             	onMouseOver="window.status='Posterior';return true;" 
             	onMouseOut="window.status=' '" class="texto2"> Posterior </a> &nbsp;
<%
          }

%>
      &nbsp;&nbsp; <font class="texto2">Total: <%=total%> </font></p>
<!-- 
-->
