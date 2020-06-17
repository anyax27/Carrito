package Controlador;

/**
 * 
 * @autor 
 * Archivo: Detalleventa.java
 * Creado: 6/5/2009 02:35:26 PM
 */
public class Detalleventa{

	private int venta_Codigo;
	private int detVenta_Item;
	private int idProducto;
	private int detVenta_Cantidad;
	private double detVenta_SubTotal;

	/** Crea un nueva instancia de la clase detalleventa */
	public Detalleventa(){

	}

    public int getVenta_Codigo() {
        return venta_Codigo;
    }

    public void setVenta_Codigo(int venta_Codigo) {
        this.venta_Codigo = venta_Codigo;
    }

    public int getDetVenta_Item() {
        return detVenta_Item;
    }

    public void setDetVenta_Item(int detVenta_Item) {
        this.detVenta_Item = detVenta_Item;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getDetVenta_Cantidad() {
        return detVenta_Cantidad;
    }

    public void setDetVenta_Cantidad(int detVenta_Cantidad) {
        this.detVenta_Cantidad = detVenta_Cantidad;
    }

    public double getDetVenta_SubTotal() {
        return detVenta_SubTotal;
    }

    public void setDetVenta_SubTotal(double detVenta_SubTotal) {
        this.detVenta_SubTotal = detVenta_SubTotal;
    }


}

