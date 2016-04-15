<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="/views/page/head.jsp" %>
		<%@include file="/views/page/dirPicker.jsp"%>
		<script type="text/javascript">
				
			function mapLoaded(){
				
				startMap(MAP_MODE.EVENTO_DETALLE);
				
			}
				
		</script>
	</head>
	<body>
		<%@include file="/views/nav/navbar.jsp" %>
	
		<div class="container-fluid">

			<div class="panel panel-primary center-block"
				style="max-width: 600px;">
				<div class="panel-heading text-center"><strong><s:property value="evento.nombre"/></strong></strong></div>
				<div class="panel-body">
					
					<div class="form-group">
						<label><strong><s:text name="event.read.panel.name"></s:text>: </strong></label> <s:property value="evento.nombre"/>
					</div>
					<div class="form-group">
						<label><strong><s:text name="event.read.panel.description"></s:text>:</strong></label> <s:property value="evento.descripcion"/>
					</div>
					<div class="form-group">
						<label><strong><s:text name="event.read.panel.date"></s:text>:</strong></label> <s:property value="evento.fecha"/>
					</div>
					<div class="form-group">
						<label><strong><s:text name="event.read.panel.time"></s:text>:</strong></label> <s:property value="evento.hora"/>
					</div>
					<div class="form-group">
						<label><strong><s:text name="event.read.panel.adress"></s:text>:</strong></label> <s:property value="evento.direccion"/>
					</div>
					<s:hidden id="mapPosition" name="mapPosition" value="%{evento.mapPosition}" />
					<div id="_map" style="height: 400px"></div>
					
				</div>
				<div class="panel-footer">
					<% if (USER == null){ %>
					<% }else if (USER.isAdministrador()){ %>
						<button class="btn btn-sm btn-primary" title="Modificar Evento"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
						<button class="btn btn-sm btn-primary" title="Eliminar Evento" onclick="confirm('Esta seguro de querer eliminar el evento <s:property value="evento.nombre" />?')"><span class="glyphicon glyphicon-remove-circle"></span> Eliminar</button>
					<% }else{ %>
						<s:url id="crearRecoURL" action="vRecorrido_Alta">
							<s:param name="eid" value="%{evento.id}"></s:param>
						</s:url>
						<s:a href="%{crearRecoURL}">
							<button class="btn btn-sm btn-primary" title="Crear un recorrido para este evento"><span class="glyphicon glyphicon-pencil"></span> Crear recorrido</button>
						</s:a>
					<% } %>
				</div>
			</div>

	</div>
		
		<%@include file="/views/footer/footer.jsp" %>
		
	</body>
</html>