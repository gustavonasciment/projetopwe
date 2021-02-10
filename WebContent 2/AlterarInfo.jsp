<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
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
		<title>Alteração de Dados</title>
		<style>
		.container{

			width: 100%;
			height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
			background-color:#e2e2e2;
			flex-direction: column;
	
		}
		form{

			display: flex;
			flex-direction: column;
			background-color: #fff;
			padding: 2rem;

		}
		.campo{
			
			margin-bottom: 0.5rem;
			display: flex;
			flex-direction: row;

		}
		input{

			margin-left: 0.5rem;
		    width: 100%;
		    box-shadow: 15px;
		    outline: 0;

		}
		.link{

			margin-bottom: 2rem;
			align-self: left;
			text-decoration: none;
			color: black;

		}
		.button{
			background-color: #4CAF50; 
			border: none;
			color: white;
			padding: 15px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
		}
		
		
	</style>
	
	</head>
	
	<%
		int userlogin = (int) session.getAttribute("userlogin");
		if (!(userlogin > 0)) {
			response.sendRedirect("index.html");
		}
		Usuario usuario_carrega = new Usuario(userlogin);
		ResultSet dados = usuario_carrega.selectBy("idUsuario", ""+userlogin );
		dados.next();
		
	%>
	
	<body>
		<div class="container">
			<a href="Dashboard.jsp" class="link">Voltar para o dashboard</a>
			<form action="salvar_mudanças.jsp" method="POST">
				<div class="campo">
					<label for="email">Email: </label>
					<input type="email" id="email" name="email" placeholder="<% out.println(dados.getString("email")); %> " disabled>
				</div>
				
				<div class="campo">
					<label for="senhaAtual">Senha: </label>
					<input type="password" id="senha" value="<% out.println(dados.getString("senha"));%>" name="senha" placeholder="Nova Senha">
				</div>
				
				<div class="campo">
					<label for="nome">Nome: </label>
					<input type="text" id="nome" name="nome" placeholder="<% out.println(dados.getString("nome")); %>">
				</div>
				
				<div class="campo">
					<label for="cpf">CPF: </label>
					<input type="text" id="cpf" name="cpf" placeholder=" <% out.println(dados.getString("cpf")); %>" disabled>
				</div>
				
				<div class="campo">
					<label for="endereco">Endereço: </label>
					<input type="text" id="endereco" value="<% out.println(dados.getString("endereco"));%>" name="endereco" placeholder="Endereço">
				</div>
				
				<div class="campo">
					<label for="bairro">Bairro: </label>
					<input type="text" id="bairro" value="<% out.println(dados.getString("bairro"));%>" name="bairro" placeholder="Bairro">
				</div>
				
				<div class="campo">
					<label for="cidade">Cidade: </label>
					<input type="text" id="cidade" value="<% out.println(dados.getString("cidade"));%>" name="cidade" placeholder="Cidade">
				</div>
				
				<div class="campo">
					<label for="uf">UF: </label>
					<select id="uf" name="uf" size="1">
					    <option value="<% out.println(dados.getString("uf"));%>" selected > <% out.println(dados.getString("uf"));%> </option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amapá</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Ceará</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Espírito Santo</option>
						<option value="GO">Goiás</option>
						<option value="MA">Maranhão</option>
						<option value="MT">Mato Grosso</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Pará</option>
						<option value="PB">Paraíba</option>
						<option value="PR">Paraná</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piauí</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rondônia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">São Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
					</select>
				</div>
				
				<div class="campo">
					<label for="cep">CEP: </label>
					<input type="text" id="cep" value="<% out.println(dados.getString("cep"));%>" name="cep" placeholder="CEP">
				</div>
				
				<div class="campo">
					<label for="telefone">Telefone: </label>
					<input type="text" id="telefone" value="<% out.println(dados.getString("telefone"));%>" name="telefone" placeholder="Telefone">
				</div>
				
				<input type="hidden" name="acao" value="1">
				<button type="button" id="btnAlterarDados" class="button" onclick="this.form.submit();">Alterar</button>
			</form>
		</div>
		
		
	</body>
</html>