<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="/views/page/head.jsp" %>
		<%@include file="/views/page/dirPicker.jsp"%>
		<script type="text/javascript">
				
			function mapLoaded(){
				
				startMap(MAP_MODE.EVENTO_ALTA);
				
			}
				
		</script>
	</head>
	<body>
		<%@include file="/views/nav/navbar.jsp" %>
	
		<div class="container-fluid">
			<div class="panel panel-primary center-block"
				style="max-width: 600px;">
				<div class="panel-heading"><s:text name="event.create.panel.title"></s:text></div>
				<div class="panel-body">
					<s:actionerror/>
					<s:form action="aEvento_Modificacion" method="post" theme="simple">
						<div class="form-group">
							<s:label value="%{getText('event.create.panel.name')}:" />
							<s:textfield name="nombre" type="text"
								placeholder="%{getText('event.create.panel.name.placeholder')}" autocomplete="off"
								required="required" cssClass="form-control" value="%{evento.nombre}"/>
						</div>
						<div class="form-group">
							<s:label value="%{getText('event.create.panel.description')}:"/>
							<s:textarea name="descripcion"
								placeholder="Ingresa la descripccion del evento"
								required="required" cssClass="form-control"></s:textarea>
						</div>
						<div class="form-group">
							<s:label value="%{getText('event.create.panel.date')}:" />
							<s:textfield name="fecha" type="date" required="required" cssClass="form-control" />
						</div>
						<div class="form-group">
							<s:label value="%{getText('event.create.panel.time')}:" />
							<s:textfield name="hora" type="time" required="required" cssClass="form-control" />
						</div>
						<div class="form-group">
							<s:label value="%{getText('event.create.panel.adress')}:" />
							<s:textfield id="direccion" name="direccion" type="text" placeholder="%{getText('event.create.panel.adress.placeholder')}" required="required" cssClass="form-control" readonly="true" />
							<s:hidden id="mapPosition" name="mapPosition" type="text" required="required"  />
						</div>
						
						<div id="_map" style="height: 400px"></div>
						
						<div class="form-group">
							<s:submit cssClass="btn btn-primary" value="%{getText('event.create.panel.save')}"></s:submit>
						</div>
	
					</s:form>
				</div>
			</div>
		</div>
	
		<div class="container-fluid">
		</div>
		
		<%@include file="/views/footer/footer.jsp" %>
		
	</body>
</html>