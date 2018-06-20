/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.controller;

import com.google.gson.Gson;
import es.rafa.retemal.roboticaterrario.beans.Temperaturas;
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
@WebServlet(name = "TemperaturaController", urlPatterns = {"/TemperaturaController"})
public class TemperaturaController extends HttpServlet {

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
        if (request.getParameter("temperaturaFria") != null) {
            ServletContext ctx = request.getServletContext();
            String temperatura = request.getParameter("temperaturaFria");
            System.out.println("Metiendo esta temperaturaFria en el contexto: " + temperatura);
            ctx.setAttribute("temperaturaFria", temperatura);
        } else if (request.getParameter("temperaturaCaliente") != null) {
            ServletContext ctx = request.getServletContext();
            String temperatura = request.getParameter("temperaturaCaliente");
            System.out.println("Metiendo esta temperaturaCaliente en el contexto: " + temperatura);
            ctx.setAttribute("temperaturaCaliente", temperatura);
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
        Temperaturas temperaturas = new Temperaturas();
        ServletContext ctx = request.getServletContext();
        Gson gson = new Gson();
        if (ctx.getAttribute("temperaturaFria") != null) {
            temperaturas.setTemperaturaFria((String) ctx.getAttribute("temperaturaFria"));
        } else {
            temperaturas.setTemperaturaFria("0");
        }
        if (ctx.getAttribute("temperaturaCaliente") != null) {
            temperaturas.setTemperaturaCaliente((String) ctx.getAttribute("temperaturaCaliente"));
        } else {
            temperaturas.setTemperaturaCaliente("0");
        }
        String representacionJSON = gson.toJson(temperaturas);
        response.getWriter().write(representacionJSON);
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
