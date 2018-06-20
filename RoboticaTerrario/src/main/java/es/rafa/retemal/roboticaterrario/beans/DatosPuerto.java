/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.beans;

import gnu.io.SerialPort;
import java.io.BufferedReader;
import java.io.OutputStream;
import java.io.Serializable;

/**
 *
 * @author X45558RE
 */
public class DatosPuerto implements Serializable{

   
    
    private static final String[] PORT_NAMES
            = {
                "/dev/tty.usbserial-A9007UX1", // Mac OS X 
                "/dev/ttyACM0", // Raspberry Pi 
                "/dev/ttyUSB0", // Linux 
                "COM3", // Windows 
            };
    
    private SerialPort serialPort;
    /**
     * A BufferedReader which will be fed by a InputStreamReader converting the
     * bytes into characters making the displayed results codepage independent
     */
    private BufferedReader input;

    /**
     * The output stream to the port
     */
    private OutputStream output;

    /**
     * Milliseconds to block while waiting for port open
     */
    private static final int TIME_OUT = 2000;

    /**
     * Default bits per second for COM port.
     */
    private static final int DATA_RATE = 9600;
    
    
     public SerialPort getSerialPort() {
        return serialPort;
    }

    public void setSerialPort(SerialPort serialPort) {
        this.serialPort = serialPort;
    }

    public BufferedReader getInput() {
        return input;
    }

    public void setInput(BufferedReader input) {
        this.input = input;
    }

    public OutputStream getOutput() {
        return output;
    }

    public void setOutput(OutputStream output) {
        this.output = output;
    }

    
}
