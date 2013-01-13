<!DOCTYPE html>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="sun.util.calendar.Gregorian"%>
<%@page import="org.educabrasil.beans.Orcamento"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.educabrasil.beans.Despesa"%>
<%@page import="java.util.List"%>
<%@page import="org.educabrasil.beans.Municipio"%>
<html>
<head>
	<title>EducaBrasil.org</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="./css/bootstrap.css" rel="stylesheet">
	<link href="./css/bootstrap-responsive.css" rel="stylesheet">
	<link href="./css/jquery-ui-1.9.2.custom.css" rel="stylesheet">
	<script src="./js/bootstrap.js"></script>
	<script src="./js/bootstrap-affix.js"></script>
	<script src="./js/bootstrap-button.js"></script>
	<script src="./js/bootstrap-collapse.js"></script>
	<script src="./js/bootstrap-modal.js"></script>
	<script src="./js/bootstrap-scrollspy.js"></script>
	<script src="./js/bootstrap-tooltip.js"></script>
	<script src="./js/bootstrap-typeahead.js"></script>
	<script src="./js/bootstrap-alert.js"></script>
	<script src="./js/bootstrap-carousel.js"></script>
	<script src="./js/bootstrap-dropdown.js"></script>
	<script src="./js/bootstrap-popover.js"></script>
	<script src="./js/bootstrap-tab.js"></script>
	<script src="./js/bootstrap-transition.js"></script>
	<script src="./markerclusterer.js"></script>
	<script src="./js/jquery.js"></script>
	<script src="./jquery.simpleslide.plugin.js"></script>
	<script src="./jquery-ui-1.9.2.custom.js"></script>
	
	
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">

	body {
	        padding-top: 60px;
	}

	</style>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGGn1YKxJmyPa1v-NXtqfTVjK7SV5qkFg&sensor=true"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script src="./core.js"></script>
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="./">EducaBrasil</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="./">Inicio</a></li>
						<li class="active" ><a href="./informacoes" >Informações detalhadas</a></li>
						<li><a href="./sobre">Sobre</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>

	</div>

	<div class="container">

		<div class="row">
			<div class="span2">
				<div class="well sidebar-nav">
				        <ul class="nav nav-list">
				        	<li class="nav-header">Cidades</li>
				        
				        	<% 
				        		List<Municipio> municipios = (List<Municipio>)request.getAttribute("municipios");
				        		Municipio municipio = (Municipio)request.getAttribute("municipio");
				        		List<Orcamento> orcamentos = (List<Orcamento>)request.getAttribute("orcamentos");
				        		List<Despesa> despesas = (List<Despesa>)request.getAttribute("despesas");
				        		
				        			for(Municipio municipioAtual : municipios){
			        		%>
			        			<li><a href="./informacoes?cod_mun=<%=municipioAtual.getId() %>"><%=municipioAtual.getNome() %></a></li>
			        		<%
				        			}
			        		%>
				        </ul>
				</div>
			</div>

			<div class="span10">
				<h1><%= municipio.getNome() %></h1>
				<% for(Orcamento orcamento : orcamentos){ %>
					<a class="btn" href="./informacoes?cod_mun=<%=municipio.getId()%>&ano=<%=orcamento.getAno()%>"><%=orcamento.getAno() %></a>
				<% } %>
				
				<section>
					<table class="table table-striped">

						<thead>
							<tr>
								<th>Nome</th>
								<th>Decrição</th>
								<th>Valor</th>

							</tr>
						</thead>
						<tbody>
							<%
								DecimalFormat df = new DecimalFormat("R$ ###,###,###.00"); 
								NumberFormat nf = NumberFormat.getInstance();
								for (Despesa despesa : despesas) {
							%>
							<tr>
								<td><%=despesa.getNome()%></td>
								<td><%=despesa.getDescricao()%></td>
								<td><%=df.format(despesa.getValor()) %></td>
							<% } %>
							
						</tbody>
					</table>
				</section>
			</div>
		</div>
		<hr>
		<footer>
			<%
				GregorianCalendar gc = new GregorianCalendar();
				gc.setTimeInMillis(System.currentTimeMillis());
				int ano = gc.get(GregorianCalendar.YEAR);
			%>
    		<p>EducaBrasil.org - <%= ano %></p>
    	</footer>
	</div>
	<!-- /container -->

</body>
</html>