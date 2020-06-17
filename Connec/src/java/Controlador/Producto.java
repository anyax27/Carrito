package Controlador;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

/**
 * 
 * @autor 
 * Archivo: Producto.java
 * Creado: 6/5/2009 02:35:26 PM
 */
public class Producto{

	private int idProducto;
	private String Nombres;
        //private InputStream Foto;
	private String Descripcion;
	private int Precio;
        private int Stock;
	/** Crea un nueva instancia de la clase producto */
	public Producto(){

	}

    /**
     * Metodo utilizado para obtener todos los productos
     * @return Retorna una lista con todos los productos
     */
    public Vector<Producto> listaProductos(){//Con magia de sirenas :D
        Vector<Producto> lp=new Vector<Producto>();
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn = Conexion.getConexion();
            String sql="SELECT * FROM producto";
            pr=cn.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Producto prod = new Producto();
                prod.setIdProducto(rs.getInt("idProducto"));
                prod.setNombres(rs.getString("Nombres"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setPrecio(rs.getInt("Precio"));
                prod.setStock(rs.getInt("Stock"));
                lp.add(prod);
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

    /**
     * Metodo utilizado para buscar un producto por codigo
     * @param codigoProducto Representa el codigo del producto que vamos a buscar
     * @return Retorna un producto buscado por el codigo
     */
  public Producto buscarProducto(int codigoProducto){
        Producto prod=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM Producto WHERE idProducto=?";
            pr=cn.prepareStatement(sql);
            pr.setInt(1, codigoProducto);
            rs=pr.executeQuery();
            while(rs.next()){
                prod=new Producto();
                prod.setIdProducto(rs.getInt("idProducto"));
                prod.setNombres(rs.getString("Nombres"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setPrecio(rs.getInt("Precio"));
                prod.setStock(rs.getInt("Stock"));
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            prod=null;
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return prod;
    } 

    /**
     * Metodo utilizado para actualizar el stock de los productos
     * @param vp Vector de productos que se va actualizar el stock
     * @return Retorna un valor booleano para saber si se actulizo los stocks
     */
    public boolean actualizarStocks(Vector<Producto> vp){
        boolean actualizo=false;
        Connection cn=null;
        PreparedStatement pr=null;
        try{
            cn=Conexion.getConexion();
            for(Producto prod : vp){
                String sql="UPDATE Producto SET ";
                sql+=" Stock=? ";
                sql+=" WHERE idProducto=?";
                pr=cn.prepareStatement(sql);
                pr.setInt(1, prod.getStock());
                pr.setInt(2, prod.getIdProducto());
                if(pr.executeUpdate()==1){
                    actualizo=true;
                }else{
                    actualizo=false;
                    break;
                }
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            actualizo=false;
        }finally{
            try{
                pr.close();
                cn.close();
            }catch(SQLException ex){

            }
        }
        return actualizo;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getPrecio() {
        return Precio;
    }

    public void setPrecio(int Precio) {
        this.Precio = Precio;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

	 

}

