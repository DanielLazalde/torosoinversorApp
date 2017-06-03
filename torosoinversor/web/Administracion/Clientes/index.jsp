<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MANTENIMIENTO CLIENTES TOROSO</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="../../css/Styles.css"/>
        <link href="../../js/jtable.2.3.1/themes/lightcolor/blue/jtable.css" rel="stylesheet" type="text/css" />

        
<%@include file="/WEB-INF/jspf/imports.jspf" %> 
        <script type="text/javascript">
            
             $(document).ready(function() {

                //Prepare jTable
                $('#TablaClientesTorOso').jtable({
                    title: 'Inversores',
                    //toolbarsearch: true,
                    //pageSize: 10,
                    //toolbarsearch:true,
                    actions: {
                        listAction: '../../srvClientes?parAccion=listTorOso',
                        //createAction: '../../srvClientes?parAccion=createTorOso',
                        //updateAction: '../../srvClientes?parAccion=updateTorOso',
                        //deleteAction: '../../srvClientes?parAccion=deleteTorOso'
                    },
                    fields: {
                        usu_codigo : {
                            title: 'Usuario',
                            key: true,
                            create: false,
                            edit: false,
                            list: true
                        },
                        usu_nombre: {
                            title: 'Nombre',
                            create: true,
                            edit: true,
                            list: true,
                            type: 'text',
                            inputClass: 'validate[required]'
                           
                        },                        
                        usu_apellido_paterno: {
                            title: 'Apellido Paterno',
                            create: true,
                            edit: true,
                            list: true,
                            type: 'text',
                            inputClass: 'validate[required]'
                        },                                                
                        usu_apellido_materno: {
                            title: 'Apellido Materno:',
                            create: true,
                            edit: true,
                            list: true,
                            type: 'text',
                            inputClass: 'validate[required]'
                        },
                        usu_ocupacion:{
                            title: 'Ocupación',
                            create: true,
                            edit: true,
                            list: true,
                            type: 'text',
                            inputClass: 'validate[required]'
                        }
                    },
                    formCreated: function(event, data) {
 
                    }
                });
                $('#TablaClientesTorOso').jtable('load');
               
            });
            
            
                        
        </script>

        <style>
            .ui-dialog .ui-widget-header,.ui-widget-header
            {
                background: #42BE33;
                border: 1px solid;
            }
            
        </style>
        <script >
             function cambiarHeighIframe(nombreContenedor)
             {
                 alert(nombreContenedor);
                 var hc=$('#'+nombreContenedor).height();
                 alert(hc);
                 $('#idContenedor').height(hc);
             }
        </script>
    </head>
    <body>
        
         <%--                    String varOperacion = session.getAttribute("session_operacion").toString();
                --%>
        
    <!-- div transparente -->
    <div  style="position:absolute; top:0px; left:0px; z-index:11; background-color:#000; display:none; opacity:0;-moz-opacity:0;filter:alpha(opacity=0)" id="divTransparente"></div>
    <br>
    <div id="TablaClientesTorOso"></div>
    
    
   
                
    
    </body>
</html>
