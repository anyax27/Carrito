
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Consultas extends Conexion{
    public boolean autentication(String correo_cliente, String contra_cliente){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            String consulta = "select * from clientes where correo_cliente = ? "
                    + "and contra_cliente = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, correo_cliente);
            pst.setString(2, contra_cliente);
            rs = pst.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
        } catch(Exception e){
            System.err.println("Error " + e);
        } finally{
            try{
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close();
                if(rs != null) rs.close();
            } catch (Exception e){
                System.err.println("Error " + e);
            }
        }
        
        return false;
    }
    
    
    public boolean registrar(String nombre_cliente, String apellido_cliente, String correo_cliente, String contra_cliente){
        
        PreparedStatement pst = null;
        
        try{
            String consulta = "insert into clientes (nombre_cliente, apellido_cliente, correo_cliente, contra_cliente) values(?,?,?,?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, nombre_cliente);
            pst.setString(2, apellido_cliente);
            pst.setString(3, correo_cliente);
            pst.setString(4, contra_cliente);
            
            if(pst.executeUpdate() == 1){
                return true;
            }
        } catch (Exception ex){
            System.err.println("Error " + ex);
        } finally{
          try{
             if(getConexion() != null) getConexion().close();
             if(pst != null) pst.close();
          } catch (Exception e){
              System.err.println("Error " + e);
          }
        }
        
        return false;
    }
}
