<%@page import="com.tp.uml.Recorrido"%>
<%@page import="com.tp.uml.Evento"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/views/page/head.jsp"%>
</head>
<body>
	<%@include file="/views/nav/navbar.jsp"%>






	<div class="container-fluid">

		<div class="pager">
			<h1>
				<s:text name="event.list.title"></s:text><br /> <small><s:text name="event.list.subtitle"></s:text></small>
			</h1>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title"><s:text name="event.list.panel.title"></s:text></h1>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3">
						<div class="input-group">
							<input name="search_query" type="search" class="form-control" />
							<span class="input-group-btn">
								<button class="btn btn-default">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
					<div class="col-md-9">
						<div class="pull-right">
							<button class="btn btn-link disabled" title="Ir al Principio">
								<span class="glyphicon glyphicon-circle-arrow-up"></span>
							</button>
							<button class="btn btn-link" title="Ir al Final">
								<span class="glyphicon glyphicon-circle-arrow-down"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body tableContent">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Nombre">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="event.list.panel.name"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Fecha">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="event.list.panel.date"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Hora">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="event.list.panel.time"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Recorridos">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="event.list.panel.trips"></s:text>
							</button></th>
						<th></th>
					</thead>
					<tbody>
						<s:iterator value="eventos" status="stat" var="evento">
							<tr>
								<td><s:url id="editURL" action="vEvento_Detalle">
										<s:param name="eventoId" value="%{id}"></s:param>
									</s:url> <s:a href="%{editURL}">
										<s:property value="nombre" />
									</s:a></td>
								<td><s:property value="fecha" /></td>
								<td><s:property value="hora" /></td>
								<td>
									<span class="badge"><s:property value="recorridos.size" /></span>
								</td>
								<td>
									<s:url id="iEvento" action="vEvento_Detalle">
										<s:param name="eventoId" value="%{id}"></s:param>
									</s:url>
									<s:a href="%{iEvento}">
										<button class="btn btn-sm btn-primary" title="Ver evento">
											<span class="glyphicon glyphicon-info-sign"></span>
										</button>
									</s:a>
								</td>
								<%
									
									if ((USER != null)&&(USER.isAdministrador())){ %>
								<td>
								<s:url id="mEvento" action="vEvento_Modificacion">
										<s:param name="eventoId" value="%{id}"></s:param>
									</s:url>
									<s:a href="%{mEvento}">
										<button class="btn btn-sm btn-primary" title="Modificar Evento">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</s:a>
								</td>
								<td><button class="btn btn-sm btn-primary"
										title="Eliminar Evento"
										onclick="confirm('Esta seguro de querer eliminar el evento <s:property value="nombre" />?')">
										<span class="glyphicon glyphicon-remove-circle"></span>
									</button></td>


							<% } %>

							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col-md-12">
						<div class="pull-right">
							<button class="btn btn-link" title="Ir al Principio">
								<span class="glyphicon glyphicon-circle-arrow-up"></span>
							</button>
							<button class="btn btn-link disabled" title="Ir al Final">
								<span class="glyphicon glyphicon-circle-arrow-down"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>








	<div class="container-fluid"></div>

	<%@include file="/views/footer/footer.jsp"%>

</body>
</html>