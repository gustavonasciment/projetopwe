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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
  <%
		int userLogin = 0; 
		
		userLogin = (int) session.getAttribute("userlogin");
		if ( ! (userLogin > 0 )){
			response.sendRedirect("teste01.html");
		}
		Usuario usuario_carrega = new Usuario(userLogin);
		ResultSet dados = usuario_carrega.selectBy(  "idUsuario", ""+userLogin );
		dados.next();
		
		String idUsuario		= ""+userLogin;
		String email			= dados.getString("email");
		int idNivelUsuario		= 1;
		String nome				= dados.getString("nome");
		String cpf				= dados.getString("cpf");
			
			String acao					= request.getParameter("acao");
			
			if (acao != null) {
				String senha 			= request.getParameter("senha");
				String endereco			= request.getParameter("endereco");
				String bairro			= request.getParameter("bairro");
				String cidade			= request.getParameter("cidade");
				String uf				= request.getParameter("uf");
				String cep				= request.getParameter("cep");
				String telefone			= request.getParameter("telefone");
				String foto				= "Foto";
				String ativo			= "N";
				Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo);
				usuario.save();
			}
	%>  
</body>
<script type="text/javascript">

    $(document).ready( 
        function() {
            window.location.href="Dashboard.jsp";
            alert("Dados alterados com sucesso!");
        } 
    );

</script>
</html>