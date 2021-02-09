<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@page import="multitools.RandomCode"%>
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
		<title>Cadastro</title>
		<style>
		.div-form{
			width: 100%;
			height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
			background-color: #e2e2e2;
			
		}
		form{
			display: flex;
			justify-content: center;
			flex-direction: column;
		}
		.campo{
			margin: 0.5rem 0;
			padding: 0.5rem;
		    box-shadow: 18px;;
			outline: 0;
			width: 100%;
		}
		.button{
			margin: 0.5rem 0;
			padding: 0.5rem;
		    box-shadow: 15px;
			outline: 0;
			background-color: #4CAF50; 
			width: 100%;
			align-self: center;
			cursor: pointer;
		}
	
		h1{
			align-self: center;
		}
		.link{
			margin-bottom: 2rem;
			align-self: left;
			text-decoration: none;
			color: #4CAF50; 
		}
	</style>
	</head>
	
	<body>
	
		<%
			String acao				= request.getParameter("acao");
			 
			if (acao != null) {
				int idUsuario			= 0;
				String email			= request.getParameter("email");
				String senha 			= new Usuario(email).newPassword();
				int idNivelUsuario		= 1;
				String nome				= request.getParameter("nome");
				String cpf				= request.getParameter("cpf");
				String endereco			= "";
				String bairro			= "";
				String cidade			= "";
				String uf				= "";
				String cep				= "";
				String telefone			= "";
				String foto				= "";
				String ativo			= "N";
				Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo);

				
				usuario.save();
					
				String smtpHost = "smtp.gmail.com"; 
				String smtpPort = "587"; 
				String username = "gadgetsbluestone@gmail.com";
				String password = "gustavo1";
				String auth     = "tls";  
				SendMail sendMail =  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
					
				String mailFrom 	= "gadgetsbluestone@gmail.com"; 
				String mailTo 		= email; 
				String mailSubject 	= "Cadastro"; 
				String mailBody 	= "Obrigado por criar uma conta no  nosso site, com o email: " + email + " e senha " + senha + "para completar o cadastro e alterar a sua senha entre com seu email e senha no nosso site"; 
				sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
					
				response.getWriter().write("Usuário cadastrado com sucesso! e foi enviado para o email "+ mailTo + " a senha gerada automaticamente!");

			
			}
			
		%>
		<div class="div-form">
			<form action="Cadastro.jsp" method="POST">
				<h1>Cadastre-se</h1>
				
					<label for="email">Email:</label>
					<input type="email" id="email" name="email" class="campo" required placeholder="Email">
				
					<label for="nome">Nome:</label>
					<input type="text" id="nome" name="nome" class="campo" required placeholder="Nome">
				
					<label for="cpf">Cpf:</label>
					<input type="text" id="cpf" name="cpf" class="campo" required placeholder="Cpf">
				
				<input type="hidden" name="acao" value="1">
				<button type="button" id="btnCadastrar" class="btn btn-primary" onclick="this.form.submit();">Cadastrar</button>
			</form>
		</div>
		
		
	</body>
</html>