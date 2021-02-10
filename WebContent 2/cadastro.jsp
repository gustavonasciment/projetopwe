<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@page import="multitool.RandomCode"%>
<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.css"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<title>Cadastre-se</title>

		<style>
			table, form{
				width: 90%;
				margin-left: 20%;
			}
			
			h3 {
				height: 60px;
			}
			
			form {
				text-align: justify;
			}
		</style>

	</head>
	
	<body>
		<form action="cadastrar.jsp" method="POST" class="form-horizontal">
			<h3>Cadastre-se:</h3>
			
			<div class="form-group">
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" class="form-control" placeholder="Email">
			</div>
			
			<div class="form-group">
				<label for="nome">Nome:</label>
				<input type="text" id="nome" name="nome" class="form-control" placeholder="Nome">
			</div>
			
			<div class="form-group">
				<label for="cpf">Cpf:</label>
				<input type="number" id="cpf" name="cpf" class="form-control" placeholder="Cpf">
			</div>
			
			<input type="hidden" name="acao" value="1">
			<button type="button" id="btnCadastrar" class="btn btn-primary" onclick="this.form.submit();">Cadastrar</button>
		</form>
		
	</body>
</html>