/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.beans;

import java.io.Serializable;

/**
 *
 * @author X45558RE
 */
public class Temperaturas implements Serializable{
    String temperaturaCaliente;
    String temperaturaFria;

    public String getTemperaturaCaliente() {
        return temperaturaCaliente;
    }

    public void setTemperaturaCaliente(String temperaturaCaliente) {
        this.temperaturaCaliente = temperaturaCaliente;
    }

    public String getTemperaturaFria() {
        return temperaturaFria;
    }

    public void setTemperaturaFria(String temperaturaFria) {
        this.temperaturaFria = temperaturaFria;
    }
    
    
}
