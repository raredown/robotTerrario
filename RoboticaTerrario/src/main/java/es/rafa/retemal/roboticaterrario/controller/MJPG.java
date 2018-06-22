/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.rafa.retemal.roboticaterrario.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * A basic implementation of a MJPG streamer as a Java servlet. MJPG is commonly
 * used to deliver image information from networked cameras via an HTTP stream.
 * The set up of this class allws for dynamic image information that is created
 * in real time to be sent to any tool capable of reading MJPG including several
 * major internet browsers (Safari, Chrome, and Firefox).
 *
 * We exclude four necessary images, which can be places in the user's home
 * directory. We name our revolving images 'winter', 'spring', 'summer', and
 * 'fall'. Images can be of any type, but this class is set up to read JPG
 * images. Altering the image source type involves changing the ImageIO.write()
 * function call that returns the image as a byte array.
 *
 * The byte array could also be loaded live and not generated from a static
 * file.
 *
 * Feedback may be sent to josh dot dickson at wpi dot edu.
 *
 * @author Joshua Dickson
 * @version December 10, 2013
 */
@SuppressWarnings("serial")
@WebServlet("/Display")
public class MJPG extends HttpServlet {

    private final List<byte[]> imageByteList;
    private int currentIndex;

    /**
     * Constructor
     *
     * @see HttpServlet#HttpServlet()
     */
    public MJPG() {
        super();

        // set the index
        currentIndex = 0;

        // load images from the user's home directory into the list of image bytes
        String[] names = {"summer", "fall", "winter", "spring"};
        imageByteList = new ArrayList<byte[]>(0);

        for (String name : names) {
            try {
                File image = new File("C:\\img" + File.separator
                        + name + ".jpg");
                BufferedImage originalImage = ImageIO.read(image);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(originalImage, "jpg", baos);
                baos.flush();
                imageByteList.add(baos.toByteArray());
                baos.close();
            } catch (Exception ex) {
                System.err.println("There was a problem loading the images.");
            }
        }

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // set the proper content type for MJPG
        response.setContentType("multipart/x-mixed-replace; boundary=--BoundaryString");

        // get the output stream to write to
        OutputStream outputStream = response.getOutputStream();

        // loop over and send the images while the browser is present and listening, then return
        while (true) {
            try {
                // reset the current index if necessary or increment it
                if (currentIndex > 2) {
                    currentIndex = 0;
                } else {
                    currentIndex++;
                }

                // write the image and wrapper
                outputStream.write(("--BoundaryString\r\n"
                        + "Content-type: image/jpeg\r\n"
                        + "Content-Length: "
                        + imageByteList.get(currentIndex).length
                        + "\r\n\r\n").getBytes());
                outputStream.write(imageByteList.get(currentIndex));
                outputStream.write("\r\n\r\n".getBytes());
                outputStream.flush();

                // force sleep to not overwhelm the browser, simulate ~20 FPS
                TimeUnit.MILLISECONDS.sleep(50);
            } // If there is a problem with the connection (it likely closed), so return
            catch (Exception e) {
                return;
            }
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // direct post requests to the get method
        doGet(request, response);

    }

}
