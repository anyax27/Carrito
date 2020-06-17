
package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Usuarios {
        private int id_usuarios;
	private String nombre_cliente;
	private String apellido_cliente;
        private String correo_cliente;
        private String contra_cliente;
        
        
	public Usuarios(){

	}

    public Vector<Usuarios> listaUsuarios(){
        Vector<Usuarios> lp=new Vector<Usuarios>();
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn = Conexion.getConexion();
            String sql="SELECT * FROM clientes";
            pr=cn.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Usuarios usu = new Usuarios();
                usu.setId_usuarios(rs.getInt("id_usuarios"));
                usu.setNombre_cliente(rs.getString("nombre_cliente"));
                usu.setApellido_cliente(rs.getString("apellido_cliente"));
                usu.setCorreo_cliente(rs.getString("correo_cliente"));
                usu.setContra_cliente(rs.getString("contra_cliente"));
                lp.add(usu);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            lp=null;
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return lp;
    }


    public int getId_usuarios() {
        return id_usuarios;
    }

    public void setId_usuarios(int id_usuarios) {
        this.id_usuarios = id_usuarios;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public String getApellido_cliente() {
        return apellido_cliente;
    }

    public void setApellido_cliente(String apellido_cliente) {
        this.apellido_cliente = apellido_cliente;
    }

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }

    public String getContra_cliente() {
        return contra_cliente;
    }

    public void setContra_cliente(String contra_cliente) {
        this.contra_cliente = contra_cliente;
    }
}
