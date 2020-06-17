/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author users
 */
public class SCerrarSesion extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        out.println("<html>\n" +
"    <head>\n" +
"        <title>Cerrar Sesion</title>\n" +
"        <meta http-equiv='refresh' content='3; url=http://localhost:8080/Connec/cerrarsesion.jsp'>    \n" +
"        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/Style.css\">\n" +
"    </head>\n" +
"<body style=\"background-color:#F2BEA0\">\n" +
"    <header>\n" +
"        <div class=\"wrapper\" style=\"font-family: Bahnschrift Condensed\">\n" +
"            <br>\n" +
"            <div class=\"logo\" style=\"font-family:Bookman Old Style\" style=\"font-size:\"><b><i>Pictures</i></b> \n" +
"                        </div>\n" +
"			<nav>\n" +
"				\n" +
"			</nav>\n" +
"		</div>\n" +
"        <br>\n" +
"    </header>\n" +
"    <br>\n" +
"    \n" +
"     \n" +
"    <div class=\"in\"  >\n" +
"            <br>\n" +
"            <br>\n" +
"            <br>\n" +
"            <font class=\"titulo\" >\n" +
"            <i>ADIOS UnU</i>\n" +
"            </font>\n" +
"            <br>\n" +
"            <br>\n" +
"             \n" +
"            <font style=\"font-family: Bahnschrift Condensed\" size=\"5\"  >\n" +
"                Gracias por sus compras\n" +
"                Cerrando sesión...\n" +
"             </font>\n" +
"             <br>\n" +
"             <br>\n" +
"              \n" +
"             <br>\n" +
"             <br>\n" +
"    </div>\n" +
" \n" +
"</body>\n" +
"</html>");
        
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

}
