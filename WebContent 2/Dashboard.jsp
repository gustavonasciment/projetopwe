<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Dashboard</title>

	<style>
		.container{
			padding: 1rem;
		}
		.user{
			display: flex;
			flex-direction: row;
			justify-content: space-between;
		}
		.link{
			margin-bottom: 2rem;
			align-self: left;
			text-decoration: none;
			color: #4CAF50;
			outline: 0;
		}
	</style>
	
</head>
<body>
<%
			int userlogin = (int) session.getAttribute("userlogin");
			if (!(userlogin > 0)) {
				response.sendRedirect("Login.jsp");
			}
			
			Usuario usuario_carrega = new Usuario(userlogin);
			ResultSet dados = usuario_carrega.selectBy(  "idUsuario", ""+userlogin );
		
			dados.next();
			String idUsuario		= ""+userlogin;
			String email			= dados.getString("email");
			int idNivelUsuario		= 1;
			String nome				= dados.getString("nome");
			%>
	<div class="container">
		<div class="user">
			<h3>Ol�, <%out.println(nome);%></h3>
			<form id="frmClear">
				<button type="button" id="logout" class="link" value="0">Sair</button>
			</form> 
		</div>
		<a href="AlterarInfo.jsp" class="link">Alterar informa��es ></a>
	</div>
</body>
<script>
$(document).ready(
        function() {
            $("#logout").click(
                function() {
                    var formData = $("#frmClear").serialize();
                    $.post( "testeForm.jsp", formData, function( data, status  ) {
                        window.location.href = "Login.jsp";
                    }, "json");
                }
            );
        }
    );
</script>
</html>