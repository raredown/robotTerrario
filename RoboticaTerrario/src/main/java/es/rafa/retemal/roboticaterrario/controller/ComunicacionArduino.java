/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.controller;

import es.rafa.retemal.roboticaterrario.common.Constantes;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
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
@WebServlet(name = "ComunicacionArduino", urlPatterns = {"/ComunicacionArduino"})
public class ComunicacionArduino extends HttpServlet implements SerialPortEventListener {

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
        if (request.getParameter("escribirArduino")!=null) {
            output.write(request.getParameter("escribirArduino").getBytes());
            output.flush();
        }
        if (request.getParameter("luz") != null) {
            String variable = request.getParameter("luz");
            ServletContext ctx = request.getServletContext();
            System.out.println("Esto esta en el contexto"+ctx.getAttribute("temperaturaFria"));
            //encender
            if (variable.equals(Constantes.UNO)) {
                System.out.println("Encender Luz dia");
                output.write(Constantes.UNO.getBytes());
            } else {
                System.out.println("Apagar Luz dia");
                output.write("2".getBytes());
            }
            output.flush();
            response.sendRedirect("jsp/luz.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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

    @Override
    public void destroy() {
        if (serialPort != null) {
            serialPort.removeEventListener();
            serialPort.close();
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("Empecienza el servlet");
        //Para conectar a arduino
        System.setProperty("gnu.io.rxtx.SerialPorts", "COM3");

        CommPortIdentifier portId = null;

        try {
            Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
            //First, Find an instance of serial port as set in PORT_NAMES. 
            while (portEnum.hasMoreElements()) {
                CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
                System.out.println("port ID: " + currPortId);
                for (String portName : PORT_NAMES) {
                    System.out.println("trying: " + portName);
                    if (currPortId.getName().equals(portName)) {
                        portId = currPortId;
                        break;
                    }
                }
            }
        } catch (NoClassDefFoundError e) {
            e.printStackTrace();
        }

        if (portId == null) {
            System.out.println("No se encuentra el puerto.");
        } else {
            try {
                // open serial port, and use class name for the appName. 
                serialPort = (SerialPort) portId.open(this.getClass().getName(),
                        TIME_OUT);

                // set port parameters 
                serialPort.setSerialPortParams(DATA_RATE,
                        SerialPort.DATABITS_8,
                        SerialPort.STOPBITS_1,
                        SerialPort.PARITY_NONE);

                input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));

                output = serialPort.getOutputStream();

                // add event listeners 
                serialPort.addEventListener(this);
                serialPort.notifyOnDataAvailable(true);

                System.out.println("Puerto abierto.");
            } catch (Exception e) {
                e.printStackTrace();
                System.err.print("Error a intentar abri el puerto" + e);
            }
        }
    }

    @Override
    public void serialEvent(SerialPortEvent oEvent) {
        if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
            try {
                //Esta manera vale si no es un puerto virtualizado
                //String inputLine = input.readLine();
                //System.out.println("prueba desde arduino" + inputLine);
                int c;
                StringBuilder response = new StringBuilder();

                while (input.ready()) {
                    c = input.read();
                    response.append((char) c);
                }
                String result = response.toString();
                System.out.println(result);
                ManejadorDatos manejadorDatos = new ManejadorDatos();
                manejadorDatos.mandarDatos(result);
            } catch (Exception e) {
                e.printStackTrace();
                System.err.print("Error a intentar abri el puerto" + e);
            }
        }
    }

}
