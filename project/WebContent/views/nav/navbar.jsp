<%@page import="com.tp.uml.Mensaje"%>
<%@page import="java.util.List"%>
<%@page import="com.tp.uml.Propuesta"%>
<%@page import="com.tp.daos.DAOFactory"%>
<%@page import="com.tp.uml.Usuario"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
Usuario USER = (Usuario) session.getAttribute("user");
if (USER == null){ %>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
			</button>
			<a class="navbar-brand" href="./">INFOPool</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li>
					<a id="_aEventos" href="vEvento_Listado.action" class="btn-lg"><span class="glyphicon glyphicon-calendar"></span> <s:text name="header.events"></s:text></a>
				</li>
				<li>
					<a id="_aRecorridos" href="vRecorrido_Listado.action" class="btn-lg"><span class="glyphicon glyphicon-road"></span> <s:text name="header.trips"></s:text></a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown active">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <s:text name="header.login"></s:text><span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu" style="padding: 8px; min-width: 200px;">
						<form id="_loginForm" action="Login.action" method="post">
							<li>
								<input name="username" type="text" placeholder="Usuario" class="form-control">
							</li>
							<li>
								<input name="password" type="password" placeholder="Contraseña" class="form-control"/>
							</li>
							<li></li>
							<li>
								<label>
									<input name="remember" type="checkbox"/>
									<span><s:text name="header.remember"></s:text></span>
								</label>
							</li>
							<li></li>
							<li>
								<button type="submit" class="btn btn-primary form-control" ><s:text name="header.signin"></s:text></button>
							</li>
						</form>
						<li class="divider"></li>
						<div class="text-center">
							<a href="Signup.action"><s:text name="header.signup"></s:text></a>
						</div>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<% } else if (USER.isAdministrador()){ %>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
			</button>
			<a class="navbar-brand" href="./">INFOPool</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li>
					<a id="_aEventos" href="vEvento_Listado.action" class="btn-lg"><span class="glyphicon glyphicon-calendar"></span> <s:text name="header.events"></s:text></a>
				</li>
				<li>
					<a id="_aRecorridos" href="vRecorrido_Listado.action" class="btn-lg"><span class="glyphicon glyphicon-road"></span> <s:text name="header.trips"></s:text></a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <% out.println(USER.getUsername()); %><span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu" style="padding: 8px; min-width: 200px;">
						<li><a href="vEvento_Alta.action" class="btn btn-default" title="ABM de eventos academicos"><span class="glyphicon glyphicon-edit"></span> <s:text name="header.admin.events.create"></s:text></a></li>
						<li><a href="#" class="btn btn-default" title="ABM de usuarios. ABM recorridos"><span class="glyphicon glyphicon-edit"></span> <s:text name="header.admin.users.manage"></s:text></a></li>
						<li><a href="vUserManager.action" class="btn btn-default" title="Listar denuncias. Link a Baja usuario (y recorridos)"><span class="glyphicon glyphicon-eye-open"></span> <s:text name="header.admin.reports"></s:text></a></li>
						
						<li class="divider"></li>
						<li>
							<button class="btn btn-danger form-control" onclick="go('Logout.action')"><s:text name="header.user.signout"></s:text></button>
						</li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<% } else if (!USER.isAdministrador()){ %>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
			</button>
			<a class="navbar-brand" href="./">INFOPool</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li>
					<a id="_aEventos" href="vEvento_Listado.action" class="btn-lg"><span class="glyphicon glyphicon-calendar"></span> <s:text name="header.events"></s:text></a>
				</li>
				<li>
					<a id="_aRecorridos" href="vRecorrido_Listado.action" class="btn-lg"><span class="glyphicon glyphicon-road"></span> <s:text name="header.trips"></s:text></a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<% 
						List<Mensaje> mensajes = USER.getMsg_recibidos();
						int msgnovistos = 0;
						for (Mensaje m : mensajes) if (!m.isVisto()) msgnovistos++;
					%>
					<%
// 						List<Mensaje> ms = DAOFactory.getMensaje().getAll("id");
// 						for (Mensaje m : ms)
// 							out.println("Hola "+m.getReceptor().getUsername()+" "+m.getMensaje()+", from "+m.getEmisor().getUsername()+"<br>");
					%>
					<a id="msg_dropdown_menu" class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="badge"><%= msgnovistos %></span> <s:text name="header.user.messages"></s:text></a>
					<ul class="dropdown-menu" role="menu" style="width: 400px; overflow-y: scroll;">
						<%
							for (Mensaje m : mensajes){%>
							
								<li>
									<div class="mensaje">
									
										<span style="font-style: italic;"><%=m.getEmisor().getUsername() %>: <%= m.getMensaje() %></span>
										
									</div>
								</li>
								<hr style="margin-top:4px; margin-bottom: 4px;">
							<%}
						%>
						<script>
							$("#msg_dropdown_menu").on('click', function(){
								$.post("MensajesVistos.action", function(data){
									console.log(data)
								});
							})
						</script>
					</ul>
				</li>
				<li class="dropdown">
					<%
						List<Propuesta> propuestas = USER.getPropuestasHechasAMi();
						int novistas = 0;
						for (Propuesta p : propuestas) if (!p.isVisto()) novistas++;
					%>
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<span class="badge"><%=novistas %></span> <s:text name="header.user.proposals"></s:text>
					</a>
					<ul class="dropdown-menu" role="menu" style="width: 400px; overflow-y: scroll;">
						<%
							for (Propuesta p : propuestas){%>
							
								<li>
									<div class="propuesta">
									
										<div>
											<span >
												<strong>Propuesta de: <a href="#"><%= p.getCandidato().getUsername() %></a> Para el <a href="vRecorrido_Detalle.action?id=<%= p.getRecorrido().getId() %>">recorrido</a>: <button class="btn btn-link" title="Ver en Mapa"><span class="glyphicon glyphicon-pushpin"></span></button></strong>
											</span>
											<br>
											<strong>"</strong>
											<span style="font-style: italic;"><%=p.getMensaje() %></span>
											<strong>"</strong>
										</div>
										<p></p>
										<div>
											<% if (!p.isVisto()){ %>
											<a href="aPropuesta_Aceptar.action?id=<%=p.getId() %>" >
												<button class="btn btn-sm btn-primary" style="font-size: 80%">Aceptar</button>
											</a>
											<a href="aPropuesta_Cancelar.action?id=<%=p.getId() %>" >
												<button class="btn btn-sm btn-danger" style="font-size: 80%">Cancelar</button>
											</a>
											<%} %>
										</div>
									</div>
								</li>
								
								<hr style="margin-top:4px; margin-bottom: 4px;">
							
							<%}
						
						%>
					</ul>
					<style type="text/css">
						.propuesta{
							background-color: rgb(224, 235, 236);
							padding: 4px;
							margin: 4px;
						}
					</style>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <% out.println(USER.getUsername()); %><span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu" style="padding: 8px; min-width: 200px;">
						<li><a href="#" class="btn btn-default" title=""><s:text name="header.user.trips.get"></s:text></a></li>
						<li><a href="vRecorrido_Alta.action" class="btn btn-default" title="Nuevo Recorrido"><s:text name="header.user.trips.create"></s:text></a></li>
						<li><a href="vPerfil.action?uid=<%=USER.getId() %>" class="btn btn-default"><span class="glyphicon glyphicon-cog"></span> <s:text name="header.user.profile"></s:text></a></li>
						<li class="divider"></li>
						<li>
							<button class="btn btn-danger form-control" onclick="go('Logout.action')"><s:text name="header.user.signout"></s:text></button>
						</li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<% }%>