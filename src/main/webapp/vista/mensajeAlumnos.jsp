<%-- 
    Document   : mensajeAlumnos
    Created on : 21 feb. 2021, 11:58:06
    Author     : User
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Alumnos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector:'textarea'});</script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String grupoSeleccionado = (String)request.getAttribute("grupo");
        ArrayList<Alumnos> seleccionados = (ArrayList<Alumnos>) request.getAttribute("seleccionados");
        %>
        <div class="container">
            <div class="row">
                <div class="col-mb">
                    <h3>Grupo Seleccionado <%=grupoSeleccionado%></h3>
                    <form action="ServletAlumnos" method="post">
                        <table class="table">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                            </tr>
                                <%for(Alumnos a: seleccionados){%>
                            <tr>
                                <td><%= a.getNombre() %></td>
                                <td><%= a.getApellidos() %></td>
                                <td><%= a.getCorreo() %></td>
                            </tr>
                            <%}%>
                        </table> 
                        <textarea class="form-control" name="mensaje"></textarea><br>
                        <input class="brn btn-primary" type="submit" value="Enviar">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
