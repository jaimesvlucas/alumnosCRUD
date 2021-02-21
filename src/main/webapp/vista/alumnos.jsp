<%-- 
    Document   : alumnos
    Created on : 21 feb. 2021, 11:57:03
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        ArrayList<Alumnos> grupo = new ArrayList<Alumnos>();
        String grupoSeleccionado = (String)request.getAttribute("grupo");
        if(grupoSeleccionado.equals("2daw_a")){
            grupo = (ArrayList<Alumnos>) request.getAttribute("daw_a2");
        }else if(grupoSeleccionado.equals("2daw_b")){
            grupo = (ArrayList<Alumnos>) request.getAttribute("daw_b2");
        }else;
        ArrayList<String> grupos = (ArrayList<String>) request.getAttribute("grupos");
        String texto="";
        %>
        <div class="container">
            <div class="row">
                <div class="col-mb">
                    <h2>Grupo Seleccionadao <%=grupoSeleccionado%> </h2>
                    <form method="get" action="ServletAlumnos">
                        <label>Grupo: </label><select class="form-control" name="grupo">
                            <%for(String s: grupos){
                                if(grupoSeleccionado.equals(s)){
                                    texto="selected";%>
                                    <option selected="selected" value="<%=s%>"><%=s%></option>
                                <%}else{%>
                                    <option value="<%=s%>"><%=s%></option>
                            <%}}%>
                        </select><br>
                        <input class="brn btn-primary" type="submit" value="Seleccionar">
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-mb">
                    <form action="ServletAlumnos" method="post">
                        <label>Grupo seleccionado</label><input type="text" readonly name="grupo" value="<%=grupoSeleccionado%>" class="form-control">
                        <table class="table">
                            <tr>
                                <th></th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                            </tr>
                                <%for(Alumnos a: grupo){%>
                            <tr>
                                <td><%= a.getNombre() %></td>
                                <td><%= a.getApellidos() %></td>
                                <td><%= a.getCorreo() %></td>
                                <td><input type="checkbox" name="<%= a.getId() %>"></td>
                            </tr>
                            <%}%>
                        </table> 
                        <input class="brn btn-primary" type="submit" value="Enviar">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
