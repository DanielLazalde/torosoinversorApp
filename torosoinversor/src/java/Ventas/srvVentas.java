package Ventas;

import Ventas.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

//@WebServlet(name = "srvExamenes", urlPatterns = {"/srvExamenes"})
public class srvVentas extends HttpServlet {

    private HttpServletRequest varRequest = null;
    private HttpServletResponse varResponse = null;
    private PrintWriter varOut = null;
    private HttpSession varSession = null;
    private clsVentas varVentas = null;

    public srvVentas() throws IOException, NamingException {
        varVentas = new clsVentas();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("tpxt/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            varRequest = request;
            varResponse = response;
            varSession = request.getSession();
            varOut = varResponse.getWriter();
            if (varRequest.getParameter("parAccion").equals("list")) {
                metLista();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("listarticulosagregados")) {
                metListaArticulos();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("listabonosmensuales")) {
                metListaAbonosMensuales();
            }
             else
               if (varRequest.getParameter("parAccion").equals("obtenerdatosventa")) {
                metObtenerDatosVenta();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("delete")) {
                metEliminar();
            }  else if (varRequest.getParameter("parAccion").equals("metArticulosAutocomplete")) {
                metArticulosAutocomplete();
            }
            else if (varRequest.getParameter("parAccion").equals("generarfolioventa")) {
                generarFolioVenta();
            }
             else if (varRequest.getParameter("parAccion").equals("metClientesAutocomplete")) {
                metClientesAutocomplete();
            }
              else if (varRequest.getParameter("parAccion").equals("createdetalleventa")) {
                metCrearDetalleVenta();                
            }
            else if (varRequest.getParameter("parAccion").equals("guardarVentaFinal")) {
                metGuardarVentaFinal();                
            }
            else
            if (varRequest.getParameter("parAccion").equals("deleteventa")) {
                metEliminarVenta(request, response);
            } 
            else
            if (varRequest.getParameter("parAccion").equals("consultarsymbolsnuevos")) {
                metListaSymbolsNuevos();
            } 
             else
            if (varRequest.getParameter("parAccion").equals("listOportunidades")) {
                metListaOportunidades();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("listGananciasToro")) {
                metListaGananciasToro();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("listGananciasOso")) {
                metListaGananciasOso();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("listPerdidasToro")) {
                metListaPerdidasToro();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("listPerdidasOso")) {
                metListaPerdidasOso();
            } 
            else
            if (varRequest.getParameter("parAccion").equals("ejecutarjartorosoinversor")) {
                            JSONObject varJsonObjectResultado = new JSONObject();

                        try{
                            //Runtime.getRuntime().exec("java -jar /opt/shared/cron/cronjar/torosoinversor.jar");
                            metVerificarJar(request, response);
                        
                            //Consultar los mensajes Toro y Oso
                            
                            varJsonObjectResultado.put("Result", "OK");
                            varOut.print(varJsonObjectResultado);
                                            //response.sendRedirect("/LaVendimia/Administracion/Ventas/");


                        }
                        catch(Exception e){

                        }

            }
            
            
//            else if (varRequest.getParameter("parAccion").equals("empresas")) metGetEmpresas();

        } finally {
            varOut.close();
        }
    }
    
    public void generarFolioVenta() throws SQLException {
        String sIduCliente = varRequest.getParameter("idu_cliente");
        System.out.print(sIduCliente);
        
        try{
            Runtime.getRuntime().exec("java -jar C:\\Users\\Daniel\\Documents\\NetBeansProjects\\JavaApplication1\\dist\\JavaApplication1.jar");
        }
        catch(Exception e){
            
        }
        varOut.println(varVentas.generarFolioVenta(sIduCliente));
    }
    
    public void metClientesAutocomplete() throws SQLException {
        String criterio = varRequest.getParameter("term");
        System.out.print(criterio);
        varOut.println(varVentas.metClientesAutocomplete(criterio));
    }
    
    public void metArticulosAutocomplete() throws SQLException {
        String criterio = varRequest.getParameter("term");
        System.out.print(criterio);
        varOut.println(varVentas.metArticulosAutocomplete(criterio));
    }
   
    private void metLista() throws SQLException {
        JSONObject varJObjectLista = varVentas.metGetLista();
        varOut.print(varJObjectLista);
    }
    
    private void metListaArticulos() throws SQLException {
         String sIduVenta = varRequest.getParameter("idu_venta");
        JSONObject varJObjectLista = varVentas.metGetListaArticulosVenta(sIduVenta);
        varOut.print(varJObjectLista);
    }
    
    private void metListaAbonosMensuales() throws SQLException {
         String sIduVenta = varRequest.getParameter("idu_venta");
        JSONObject varJObjectLista = varVentas.metListaAbonosMensuales(sIduVenta);
        varOut.print(varJObjectLista);
    }
    
    
    
    private void metObtenerDatosVenta() throws SQLException {
         String sIduVenta = varRequest.getParameter("idu_venta");
         
        varVentas.metEjecutarCalculosDeVenta(sIduVenta);
        JSONObject varJObjectLista = varVentas.metObtenerDatosVenta(sIduVenta);
        varOut.print(varJObjectLista);
    }
    
    
    
    
     private void metCrearDetalleVenta() throws SQLException {
        System.out.println("llego");
        String idu_venta = varRequest.getParameter("idu_venta");
        String idu_cliente = varRequest.getParameter("idu_cliente");
        String idu_articulo = varRequest.getParameter("idu_articulo");
        String num_cantidad = varRequest.getParameter("num_cantidad");        

        String rsp = varVentas.metGuardarEnBdDetalleVenta(idu_venta, idu_cliente, idu_articulo, num_cantidad);
        
        varOut.print(rsp);
    }
     
     private void metGuardarVentaFinal() throws SQLException {
        System.out.println("llego");
        String idu_venta = varRequest.getParameter("idu_venta");
        String num_plazo = varRequest.getParameter("num_plazo");            

        String rsp = varVentas.metGuardarVentaFinal(idu_venta, num_plazo);
        
        varOut.print(rsp);
    }


    private void metEliminar() throws SQLException {
        String idu_venta = varRequest.getParameter("idu_venta").trim();
        String idu_detalle = varRequest.getParameter("idu_detalle").trim();
        
        System.out.println("idu VENTA --> " + idu_venta);
        System.out.println("idu idu_detalle --> " + idu_detalle);
        JSONObject varJObjectLista = varVentas.metQuitar(idu_venta, idu_detalle);
        
        varVentas.metEjecutarCalculosDeVenta(idu_venta);
        varOut.print(varJObjectLista);
    }
    
    private void metEliminarVenta(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String idu_venta = varRequest.getParameter("idu_venta").trim();
        //String idu_detalle = varRequest.getParameter("idu_detalle").trim();
        JSONObject varJObjectLista = varVentas.metQuitarVenta(idu_venta);
        varOut.print(varJObjectLista);
        try {
            response.sendRedirect("/torosoinversor/Administracion/Ventas/");
        } catch (IOException ex) {
            Logger.getLogger(srvVentas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

/* SYMBOLS */
    
    private void metListaSymbolsNuevos() throws SQLException {
         String sIduVenta = varRequest.getParameter("idu_venta");
        JSONObject varJObjectLista = varVentas.metListaSymbosNuevos(sIduVenta);
        varOut.print(varJObjectLista);
    }
    
   private void metListaOportunidades() throws SQLException {
        JSONObject varJObjectLista = varVentas.metGetListaOportunidades();
        varOut.print(varJObjectLista);
    }
   
   private void metListaGananciasToro() throws SQLException {
        JSONObject varJObjectLista = varVentas.metGetListaGananciasToro();
        varOut.print(varJObjectLista);
    }
   
   private void metListaGananciasOso() throws SQLException {
        JSONObject varJObjectLista = varVentas.metGetListaGananciasOso();
        varOut.print(varJObjectLista);
    }
   
    private void metListaPerdidasOso() throws SQLException {
        JSONObject varJObjectLista = varVentas.metGetListaPerdidasOso();
        varOut.print(varJObjectLista);
    }
    
     private void metListaPerdidasToro() throws SQLException {
        JSONObject varJObjectLista = varVentas.metGetListaPerdidasToro();
        varOut.print(varJObjectLista);
    }
   
   
    private void metVerificarJar(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String idu_venta = "00001";//varRequest.getParameter("idu_venta").trim();
        //String idu_detalle = varRequest.getParameter("idu_detalle").trim();
        int resultado = varVentas.metVerificarJar();
        System.out.println("Entro a ejecutar TOROSO");
        if (resultado == 0) {
            try{
                  Runtime.getRuntime().exec("java -jar /opt/shared/cron/cronjar/EjecutarTorOso.jar");
                  System.out.println("Entro a ejecutar TOROSO - JAR");

              }
              catch(Exception e){

              }
        }

//varOut.print(varJObjectLista);
        try {
            response.sendRedirect("/torosoinversor/Administracion/Ventas/");
        } catch (IOException ex) {
            Logger.getLogger(srvVentas.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(srvVentas.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(srvVentas.class.getName()).log(Level.SEVERE, null, ex);
        }
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
