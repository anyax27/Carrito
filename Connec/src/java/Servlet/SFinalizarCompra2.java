/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Consultas;
import Controlador.Detalleventa;
import Controlador.Producto;
//import Controlador.Usuario;
import Controlador.Venta;
import java.io.IOException;
import java.util.Date;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yax y Eda uwu
 */
public class SFinalizarCompra2 extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession objsesion=request.getSession(true);
        Date dia=new Date();
        Vector<Detalleventa> vectorDetalles=(Vector<Detalleventa>)objsesion.getAttribute("detalleVenta");;
        Vector<Producto> stockProducto=(Vector<Producto>)objsesion.getAttribute("stockProducto");
        Producto prod=new Producto();
        double totalPagar=0;
        for(Detalleventa dv : vectorDetalles){
            totalPagar+=dv.getDetVenta_SubTotal();
        }
        
        Consultas usuario = new Consultas();
        Venta venta=new Venta();
        //venta.getUsuario_codigo(usuario.autentication(correo_cliente, contra_cliente));
        venta.setVenta_fecha(dia.toString());
        venta.setVenta_totalpagar(totalPagar);
        boolean registrarVenta=venta.registrarVenta(venta, vectorDetalles);
        boolean actualizarVenta=prod.actualizarStocks(stockProducto);
        if(registrarVenta != actualizarVenta){
            response.sendRedirect("Inicio_2.jsp");
        }else{
            response.sendRedirect("Mal.jsp");
        }
    } 
    
    
    
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
