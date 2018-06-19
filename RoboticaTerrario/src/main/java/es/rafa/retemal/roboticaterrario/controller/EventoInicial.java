/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.controller;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;

/**
 *
 * @author rafa
 */
@WebListener
public class EventoInicial implements ServletContextListener {
    private ComunicacionArduino comunicacion;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /**
        comunicacion= new ComunicacionArduino();
        try {
            System.out.print("contextInitialized----> antes de init");
            comunicacion.init();
            System.out.print("contextInitialized----> despues de init");
        } catch (ServletException ex) {
            Logger.getLogger(EventoInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print("aplicacion web arrancada");
        * **/
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        comunicacion.destroy();
        System.out.print("contextDestroyed----> cerrando");
    }
    
}
