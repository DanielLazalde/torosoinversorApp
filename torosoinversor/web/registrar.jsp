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

<%@include file="/WEB-INF/jspf/imports.jspf" %> 
        <title>Ingreso</title>
    </head>
    <body>
        
          <style type="text/css">

          .TablaMensajeGeneralLv2{

            color:green; 
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
            
            
            function regresar(){
                        parent.location.href = "/torosoinversor/";
            }
            function registrarUsuario()
            {
                var UsuCodigo = $('#inputCodigo').val();
                var UsuClave = $('#inputClave').val();
                var UsuNombre = $('#inputNombre').val();
                var UsuApellidoPaterno = $('#inputApellidoPaterno').val();
                var UsuApellidoMaterno = $('#inputApellidoMaterno').val();
                //var UsuNroDocumento = $('#inputNroDocumento').val();
                var UsuOcupacion = $('#inputOcupacion').val();
                var UsuCorreo = $('#inputCorreo').val();
                
                $.post('srvUsuarios', {
                    parAccion: 'createUsuTorOso',
                    UsuCodigo: UsuCodigo,
                    UsuClave: UsuClave,
                    UsuNombre: UsuNombre,
                    UsuApellidoPaterno: UsuApellidoPaterno,
                    UsuApellidoMaterno: UsuApellidoMaterno,
                    UsuOcupacion: UsuOcupacion,
                    UsuCorreo: UsuCorreo
                }, function(responseText) {
                    if (responseText.trim() === '1') {
                        //alert('Usuario Registrado con Exito');
                        
                        $('#mensajeGeneral').html("<span style='color:green;'>Usuario Registrado con Exito</span>");

                        mostrarMensajeGeneral();
                        //parent.location.href = "/torosoinversor/";
                    }
                    else{
                        alert('Hubo un error al Registrar');
                    }
                });
            }
            
            function handleClick(event)
                {
                  registrarUsuario();
                  event.preventDefault(); // disable normal form submit behavior
                  return false; // prevent further bubbling of event
                }
                
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
                                     regresar();
                                     //$("#textboxId147").select();
                                    
                                }
                            }});
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
        
        <form method="post" id="form1" action="JavaScript:handleClick()">

        <div class="panel panel-primary" style="border-color: #42BE33; width: 300px;margin:0 auto;">
            <div class="panel-body text-left" >
                <div class="col" >                    
                    <label class="control-label" for="inputCodigo">Usuario</label>
                    <!--<input class="form-control" type="text" id="inputCodigo" required>-->
                    <input class="form-control" id="inputCodigo" type="text" name="strUsuario" value="" size="10" maxlength="10" required placeholder="Nombre de usuario de acceso" />

                    <label class="control-label" for="inputClave">Contraseña</label>
                    <!--<input class="form-control"  id="inputClave" required>-->
                    
                    <input name="strPassword" type="password" class="form-control" id="inputClave" size="25" maxlength="20" required title="
                    Requisitos mínimos: 
                    6 caracteres, una mayúscula y una minúscula.
                    Puede usar caracteres especiales (*/.}{¿'=, etc..).
                    No use espacios en blanco." pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w\S{6,}" placeholder="Contraseña" onChange="ValidarContrasena()">

                    
                    <label class="control-label" for="inputNombre">Nombres</label>
                    <!--<input class="form-control"  id="inputNombre" required>-->
                    <input class="form-control" id="inputNombre" type="text" name="strNombre" value="" size="40" maxlength="20" required placeholder="Nombres" />

                    <label class="control-label" for="inputApellidoPaterno">Ape.Paterno</label>
                    <!--<input class="form-control"  id="inputApellidoPaterno" required>-->
                    <input name="strApellido1" type="text" class="form-control" id="inputApellidoPaterno" size="40" maxlength="20" placeholder="Apellido" required title="Ingrese su primer apellido" pattern="[A-Za-z]+" >

                    <label class="control-label" for="inputApellidoMaterno">Ape.Materno</label>
                    <!--<input class="form-control"  id="inputApellidoMaterno" required>-->
                    
                    <input name="strApellido2" type="text" class="form-control" id="inputApellidoMaterno" size="40" maxlength="20" placeholder="Apellido" required title="Ingrese su segundo apellido" pattern="[A-Za-z]+" >

                    <label class="control-label" for="inputNroDocumento">Correo electronico;</label>
                    <!--<input class="form-control"  id="inputNroDocumento" required>-->
                    <input class="form-control" id="inputCorreo" type="email" name="strEmail" value="" size="40" maxlength="40" required placeholder="ejemplo@zk.com.co">
                    
                    <label class="control-label" for="inputNroDocumento">Ocupación</label>
                    <input class="form-control" id="inputOcupacion" type="text" name="strNombre" value="" size="40" maxlength="20" required placeholder="Ejemplo: Abogado" />

                    <br>
                    <!--<button class="form-control" onclick="registrarUsuario();" type="button">Registrar</button>-->
                    <input class="form-control" type="submit" value="Registrar" >
                    <br>
                    <button class="form-control" onclick="regresar();" type="button">Regresar</button>

                </div>
            </div>

        </div>
    </body>
</html>
