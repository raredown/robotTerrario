/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.controller;

import com.google.gson.Gson;
import es.rafa.retemal.roboticaterrario.beans.Luces;
import es.rafa.retemal.roboticaterrario.beans.Temperaturas;
import es.rafa.retemal.roboticaterrario.common.Constantes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author X45558RE
 */
@WebServlet(name = "LucesController", urlPatterns = {"/LucesController"})
public class LucesController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LucesController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LucesController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("luzDia") != null) {
            ServletContext ctx = request.getServletContext();
            String luz = request.getParameter("luzDia");
            System.out.println("Metiendo esta Luz dia en el contexto: " + luz);
            ctx.setAttribute("luzNormal", luz);
        } else if (request.getParameter("luzInfraroja") != null) {
            ServletContext ctx = request.getServletContext();
            String luz = request.getParameter("luzInfraroja");
            System.out.println("Metiendo esta luzInfraroja en el contexto: " + luz);
            ctx.setAttribute("luzInfraroja", luz);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("action") != null) {
            ServletContext ctx = request.getServletContext();
            if (request.getParameter("action").equals("estadoLuz")) {
                Luces luces = new Luces();

                Gson gson = new Gson();
                if (ctx.getAttribute("luzNormal") != null) {
                    luces.setLuzNormal((String) ctx.getAttribute("luzNormal"));
                } else {
                    luces.setLuzNormal("OFF");
                }
                if (ctx.getAttribute("luzInfraroja") != null) {
                    luces.setLuzInfraroja((String) ctx.getAttribute("luzInfraroja"));
                } else {
                    luces.setLuzInfraroja("OFF");
                }
                String representacionJSON = gson.toJson(luces);
                response.getWriter().write(representacionJSON);
            } else if (request.getParameter("action").equals("luzNormalOff")) {
                request.setAttribute("escribirArduino", 2);
                ctx.setAttribute("luzNormal", "OFF");
            } else if (request.getParameter("action").equals("luzNormalOn")) {
                request.setAttribute("escribirArduino", 1);
                ctx.setAttribute("luzNormal", "ON");
            } else if (request.getParameter("action").equals("luzInfrarojaOff")) {
                request.setAttribute("escribirArduino", 4);
                ctx.setAttribute("luzInfraroja", "OFF");
            } else if (request.getParameter("action").equals("luzInfrarojaOn")) {
                request.setAttribute("escribirArduino", 3);
                ctx.setAttribute("luzInfraroja", "ON");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
