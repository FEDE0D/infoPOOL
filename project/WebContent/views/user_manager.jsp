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
				<s:text name="admin.manager.title"></s:text>
			</h1>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title"><s:text name="admin.manager.panel.title"></s:text></h1>
			</div>
			<div class="panel-body tableContent">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<th><button class="btn btn-sm btn-danger"
								title="Ordenar por Usuario">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="admin.manager.panel.username-t"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Usuario">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="admin.manager.panel.username-f"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Motivo">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="admin.manager.panel.reason"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="admin.manager.panel.trip"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Fecha">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="admin.manager.panel.date"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Hora">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="admin.manager.panel.time"></s:text>
							</button></th>
						<th></th>
					</thead>
					<tbody>
						<s:iterator value="denuncias" status="stat" var="denuncia">
						
							<tr>
								<td>
									<a href="vPerfil.action?uid=<s:property value="recorrido.creador.id"/>"><s:property value="recorrido.creador.username"/></a>
									<s:if test="recorrido.creador.baja">
										<span style="color: red; font-weight: bold">(<s:text name="admin.manager.panel.blocked"></s:text>)</span>
									</s:if>
								</td>
								<td>
									<a href="vPerfil.action?uid=<s:property value="denunciante.id"/>"><s:property value="denunciante.username"/></a>
								</td>
								<td><s:property value="motivo"/></td>
								<td><a href="vRecorrido_Detalle.action?id=<s:property value="recorrido.id"/>"><s:text name="admin.manager.panel.trip"></s:text></a></td>
								<td><s:property value="fecha"/></td>
								<td><s:property value="hora"/></td>
								<td>
									<s:if test="!recorrido.creador.baja">
										<button class="btn btn-primary" onclick="blockUser(<s:property value="recorrido.creador.id"/>)"><span class="glyphicon glyphicon-remove-circle"></span> <s:text name="admin.manager.panel.block"></s:text></button>
									</s:if>
									<button class="btn btn-primary" onclick="goToTrips('<s:property value="recorrido.creador.username"/>')"><span class="glyphicon glyphicon-road"></span> <s:text name="admin.manager.panel.usertrips"></s:text></button>
								</td>
							</tr>
							<script type="text/javascript">
								function blockUser(id){
									if (confirm('<s:text name="admin.manager.panel.block.question"></s:text>')){
										document.location="aUserManagerDelete.action?id="+id;
									}
								}
								function goToTrips(username){
									document.location="vRecorrido_Listado.action?q="+username;
								}
							</script>
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