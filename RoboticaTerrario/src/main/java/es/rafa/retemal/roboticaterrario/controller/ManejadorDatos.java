/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author X45558RE
 */
public class ManejadorDatos {

    public void mandarDatos(String cadena) {
        String[] parts = cadena.split(":");
        switch (parts[0]) {
            case "temperaturaFria":
                escribirTemperatura(parts[1],parts[0]);
                break;
            case "temperaturaCaliente":
                escribirTemperatura(parts[1],parts[0]);
                break;

        }
        
    }

    private void escribirTemperatura(String temperatura,String parametro) {
        URL url;
        try {

            URL request_url = new URL("http://localhost:8080/RoboticaTerrario/TemperaturaController?"+parametro+"=".concat(temperatura));
            HttpURLConnection http_conn = (HttpURLConnection) request_url.openConnection();
            http_conn.setConnectTimeout(100000);
            http_conn.setReadTimeout(100000);
            http_conn.setInstanceFollowRedirects(true);
            http_conn.setDoOutput(true);

            System.out.println(String.valueOf(http_conn.getResponseCode()));
        } catch (MalformedURLException ex) {
            Logger.getLogger(ManejadorDatos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ManejadorDatos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
