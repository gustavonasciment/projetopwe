<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@page import="multitool.RandomCode"%>
<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto);
				usuario.save();
				
				String smtpHost = "smtp.gmail.com"; 
				String smtpPort = "587"; 
				String username = "hopelivefestival@gmail.com";
				String password = "230121H";
				String auth     = "tls";  
				SendMail sendMail =  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
					
				String mailFrom 	= "hopelivefestival@gmail.com"; 
				String mailTo 		= email; 
				String mailSubject 	= "Cadastro"; 
				String mailBody 	= "Você criou sua conta na Nossa loja, com o email: " + email + " e senha " + senha + "para finalizar seu cadastro e alterar sua senha faça login novamente"; 
				sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
			
			}
			
		%>
		
		 <h1> Usuario cadastrado com sucesso!!!</h1>
 <a href="teste01.html"> Voltar para a pagina de login </a>