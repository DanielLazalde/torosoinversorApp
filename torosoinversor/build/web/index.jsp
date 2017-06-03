<%-- 
    Document   : main
    Created on : 07-Nov-2016, 10:54:12
    Author     : Lazalde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.4.custom.min.css"> 
        
        
        <link rel="stylesheet" type="text/css" href="../../css/Styles.css"/>

        <title>Ingreso</title>
    </head>
    <body>
        
          <style type="text/css">

          .TablaMensajeGeneralLv2{

            color:red; 
            font-family:verdana;
            font-size:15px;
            font-weight:bold;
            z-index: 1002;

            }
            
            .ui-dialog .ui-widget-header,.ui-widget-header
            {
                background: #42BE33;
                border: 1px solid;
            }
            
        #mostrarMensajeGeneral
            { 
                display: none;
                font-size: 10px;
            }       
            .row
            {
                padding: 0px;
                margin:0px;
            }
            .col-xs-1,.col-xs-12,.col-xs-9
            {
                padding: 0px;
                margin:5px;
            }
            .ui-autocomplete {
                z-index: 9999;
            }
            
            </style>
 
        <script language="Javascript">
            
              function mostrarMensajeGeneral()
                    {
                        var vardialogomsgneral = $("#mostrarMensajeGeneral").dialog({
                            width: 500,
                            height: 170,
                            title: "Mensaje",
                            modal: true,
                            buttons: {
                                 "Aceptar": function() {          
                                     $(vardialogomsgneral).dialog('close'); 
                                     //regresar();
                                     //$("#textboxId147").select();
                                    
                                }
                            }});
                    }

            $(document).ready(function() {
                $('#parContrasenha').keydown(function(e) {

                    key = e.keyCode ? e.keyCode : e.which;
                    //alert("Pulsaste la tecla con cÃ³digo: " + key);
                    if (key == 13) {
                        $("#frmIngresar").trigger("click");
                        return false;
                    }
                });
            });
            var varConexion, varRcvReq;

            function crearXMLHttpRequest() {
                var xmlHttp = null;
                if (window.ActiveXObject)
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                else if (window.XMLHttpRequest)
                    xmlHttp = new XMLHttpRequest();
                return xmlHttp;
            }

            function recuperarDatos() {
                varConexion = crearXMLHttpRequest();
                varConexion.onreadystatechange = procesarEventos;

                var varCodigo = "", varContrasenha = "", varConsulta = "";

                varCodigo = document.getElementById('parCodigo').value;
                varContrasenha = document.getElementById("parContrasenha").value;

                varConsulta = "?parAccion=consulta&parCodigo=" + varCodigo + "&parContrasenha=" + varContrasenha;
                varConexion.open("POST", 'srvIniciarSesion' + varConsulta, false);
                varConexion.send(null);
            }

            function procesarEventos() {
                if (varConexion.readyState === 4) {
                    var hayUsuario = varConexion.responseText;
                    if (hayUsuario.toUpperCase().trim() === "TRUE")
                        //window.location = "main.jsp";
                        parent.location.href = "/torosoinversor/main.jsp";
                    else
                    {
                        parent.location.href = "/torosoinversor/";
                        
                        //$('#mensajeGeneral').html("<span style='color:red;'>Inicio de sesión fallido. Dirección de correo o electrónico o contraseña incorrectos.</span>");
                        //mostrarMensajeGeneral();
                        alert("Inicio de sesión fallido. Dirección de correo o electrónico o contraseña incorrectos.");
                    }
                }
            }
            function registrarUsuario()
             {
                parent.location.href = "/torosoinversor/registrar.jsp";
            }
        </script>
        
        <div  id="mostrarMensajeGeneral">
                        
                        <table class="TablaMensajeGeneralLv2" align="center" border="0">
                                <tr>
                                        <td align="center">
                                            <div id="mensajeGeneral"> ?????? </div>
                                         <br><br> 
                                        </td>
                                </tr>
                        </table>
        </div>
        
        <div class="panel panel-primary" style="border-color: #42BE33; width: 300px;margin:0 auto;">
            <div class="panel-body text-left" >
                <img src="toroso.jpg" width="270" height="250" alt="empresa"/>

                <div class="col" >                    
                    <label class="control-label" for="inputCodigo">Usuario</label>
                    <input class="form-control" type="text" id="parCodigo" name="parCodigo" placeholder="Usuario" >
                    <label class="control-label" for="inputContrasenha">Contraseña</label>
                    <input class="form-control" type="password" id="parContrasenha" name="parContrasenha" placeholder="Contraseña" >
                    <br>
                    <button class="form-control" id="frmIngresar" onclick="recuperarDatos();" type="button">Ingresar</button>
                    <br>
                    <button class="form-control" id="btnRegistrar" onclick="registrarUsuario();" type="button">Registrar</button>

                </div>
            </div>

        </div>
    </body>
</html>

