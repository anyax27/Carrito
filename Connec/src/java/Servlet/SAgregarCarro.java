package Servlet;

import Controlador.Detalleventa;
import Controlador.Producto;
import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class SAgregarCarro extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     try{
        
        Vector<Detalleventa> vectorDetalles=null;
        HttpSession objsesion=request.getSession();
        Vector<Producto> stockProducto=null;
        //Si se creo la sesion con el atributo de detalle de venta
         
        if(objsesion.getAttribute("detalleVenta")!=null){
            //Si existe una sesion con ese atributo, se obtiene los datos de esa sesion
            vectorDetalles=(Vector<Detalleventa>)objsesion.getAttribute("detalleVenta");
            stockProducto=(Vector<Producto>)objsesion.getAttribute("stockProducto");
        }else{
            //Si no existe esa sesion se crea el vector de detalles de venta
            vectorDetalles=new Vector<Detalleventa>();
            stockProducto=new Vector<Producto>();

        }    

        
        //Obtenemos los valores de la cajas de texto
        int codigo=Integer.parseInt(request.getParameter("txtCodigo").trim());
        int cantidad=Integer.parseInt(request.getParameter("txtCantidadPedir").trim());
        //System.out.println("hi");
        Producto prod=new Producto();
        prod=prod.buscarProducto(codigo);
        double subTotal=cantidad * prod.getPrecio();
        //Creo el elemento Detalle de Venta
        Detalleventa detalle=new Detalleventa();
        detalle.setDetVenta_Item(vectorDetalles.size()+1);
        detalle.setIdProducto(codigo);
        detalle.setDetVenta_SubTotal(subTotal);
        detalle.setDetVenta_Cantidad(cantidad);
        //Agrego el detalle de venta a mi vector de detalles
        vectorDetalles.add(detalle);
        objsesion.setAttribute("detalleVenta",vectorDetalles);
        //Agegro el stock actualizado del producto
        prod.setStock(prod.getStock()-cantidad);
        stockProducto.add(prod);
        objsesion.setAttribute("stockProducto", stockProducto);
        response.sendRedirect("Carrito.jsp");
     }catch(Exception e){
         System.err.println("Error: "+e);
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
