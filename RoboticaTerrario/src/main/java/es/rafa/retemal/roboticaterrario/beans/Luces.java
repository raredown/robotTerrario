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
public class Luces implements Serializable{
    
    private String luzNormal;
    private String luzInfraroja;

    public String getLuzNormal() {
        return luzNormal;
    }

    public void setLuzNormal(String luzNormal) {
        this.luzNormal = luzNormal;
    }

    public String getLuzInfraroja() {
        return luzInfraroja;
    }

    public void setLuzInfraroja(String luzInfraroja) {
        this.luzInfraroja = luzInfraroja;
    }
    
    
    
}
