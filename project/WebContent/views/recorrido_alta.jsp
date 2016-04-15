<%@page import="com.tp.uml.Evento"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/views/page/head.jsp"%>
<%@include file="/views/page/dirPicker.jsp"%>
	<script type="text/javascript">
		function selectTipoOnChange() {
	
			var select = $("#tipoSelect");
			var puntual = $("#div_puntual");
			var periodico = $("#div_periodico");
	
			var index = $("#tipoSelect").val();
			if (index == 1) {
				puntual.show();
				periodico.hide();
			}
			if (index == 2) {
				periodico.show();
				puntual.hide();
			}
	
		}
		
		function mapLoaded() {
			
			startMap(MAP_MODE.RECORRIDO_ALTA);
	
		}
		
		$(document).ready(function(){
			selectTipoOnChange();
		});
	
		// 		function puntualTimeChange(){	
		// 			var time1 = $("#hora_ida_puntual");
	
		// 		}
	
	// 	$().ready(
	// 			function() {
					
	// 				$("#hora_ida_puntual").focusout(function() {
	// // 					alert($("#hora_ida_puntual").val());
	// // 														$("#hora_vuelta_puntual").slider({
	// // 															"min" : "10:00"
	// // 														});
	
	// 														 $('#hora_vuelta_puntual').timepicker({
	// 														        minTime: $("#hora_ida_puntual").val()
	// 														    });
	
	
	
	// 														});
	// 			});
				
	</script>
</head>
<body>
	<%@include file="/views/nav/navbar.jsp"%>
	<%
		Evento e = (Evento) ActionContext.getContext().getValueStack().findValue("recoEvento");
	%>
	<div class="container-fluid">
		<div class="panel panel-primary center-block"
			style="max-width: 600px;">
			<div class="panel-heading"><s:text name="trip.create.panel.title"></s:text></div>
			<div class="panel-body">
				<% if (e != null) { %>
					<s:url id="verEventoURL" action="vEvento_Detalle">
						<s:param name="eventoId" value="%{recoEvento.id}"></s:param>
					</s:url>
					<label>Recorrido para el evento: <s:a href="%{verEventoURL}">
							<s:property value="recoEvento.nombre" />
						</s:a>
					</label>
				<% } %>

				<s:form action="aRecorrido_Alta" method="post" theme="simple">
					<s:hidden name="eid" value="%{recoEvento.id}" />
					<div class="form-group">
						<s:if test="recoEvento == null">
							<s:label value="%{getText('trip.create.panel.question')}" />
							<s:select id="tipoSelect" label="" headerKey="-1" cssClass="form-control" list="#{'1':getText('trip.create.panel.single'), '2':getText('trip.create.panel.periodic')}" name="tipo_recorrido" value="1" onchange="selectTipoOnChange()" />
						</s:if>
						<s:else>
							<s:select id="tipoSelect" label="" headerKey="-1" cssClass="form-control" list="#{'1':getText('trip.create.panel.single')}" name="tipo_recorrido" value="1" onchange="selectTipoOnChange()" cssStyle="display:none;"/>
						</s:else>						
						
						<br>
						<!--   TIPO PUNTUAL -->
						<div id="div_puntual">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<th><s:text name="trip.create.panel.day"></s:text></th>
									<th><s:text name="trip.create.panel.dtime"></s:text></th>
									<th><s:text name="trip.create.panel.atime"></s:text></th>
								</thead>
								<tbody>
									<tr>
										<s:if test="recoEvento != null">
											<td><s:textfield name="fecha_puntual" type="date" required="required" cssClass="form-control" value="%{recoEvento.fecha}" readonly="true" /></td>
											<td><s:textfield id="hora_ida_puntual" name="hora_ida_puntual" type="time" required="required" cssClass="form-control" max="%{recoEvento.hora}" /></td>
											<td><s:textfield name="hora_vuelta_puntual" type="time" required="required" cssClass="form-control" min="%{recoEvento.hora}"/></td>
										</s:if>
										<s:else>
											<td><s:textfield name="fecha_puntual" type="date" required="required" cssClass="form-control" /></td>
											<td><s:textfield id="hora_ida_puntual" name="hora_ida_puntual" type="time" required="required" cssClass="form-control" /></td>
											<td><s:textfield name="hora_vuelta_puntual" type="time" required="required" cssClass="form-control" /></td>
										</s:else>
									</tr>
								</tbody>
							</table>
								
						</div>

						<!--   TIPO PERIODICO -->
						<div id="div_periodico">
							<div class="panel-body tableContent">
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<th></th>
										<th><s:text name="trip.create.panel.day"></s:text></th>
										<th><s:text name="trip.create.panel.dtime"></s:text></th>
										<th><s:text name="trip.create.panel.atime"></s:text></th>
									</thead>
									<tbody>
										<tr>
											<td><s:checkbox name="check_lunes" fieldValue="true"
													label="Lunes" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.monday')}" /></td>
											<td><s:textfield name="hi_lunes" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_lunes" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
										<tr>
											<td><s:checkbox name="check_martes" fieldValue="true"
													label="Martes" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.tuesday')}" /></td>
											<td><s:textfield name="hi_martes" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_martes" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
										<tr>
											<td><s:checkbox name="check_miercoles" fieldValue="true"
													label="Miercoles" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.wednesday')}" /></td>
											<td><s:textfield name="hi_miercoles" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_miercoles" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
										<tr>
											<td><s:checkbox name="check_jueves" fieldValue="true"
													label="Jueves" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.thursday')}" /></td>
											<td><s:textfield name="hi_jueves" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_jueves" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
										<tr>
											<td><s:checkbox name="check_viernes" fieldValue="true"
													label="Viernes" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.friday')}" /></td>
											<td><s:textfield name="hi_viernes" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_viernes" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
										<tr>
											<td><s:checkbox name="check_sabado_" fieldValue="true"
													label="Sabado" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.caturday')}" /></td>
											<td><s:textfield name="hi_sabado" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_sabado" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
										<tr>
											<td><s:checkbox name="check_domingo" fieldValue="true"
													label="Domingo" theme="simple" /></td>
											<td><s:label value="%{getText('trip.create.panel.sunday')}" /></td>
											<td><s:textfield name="hi_domingo" type="time"
													cssClass="form-control" theme="simple" /></td>
											<td><s:textfield name="hv_domingo" type="time"
													cssClass="form-control" theme="simple" /></td>
										</tr>
								</table>
							</div>
						</div>
					</div>


					<div class="form-group">
						<s:label value="%{getText('trip.create.panel.seats')}" />
						<s:textfield name="total_asientos" type="number" min="1"
							required="required" value="1" cssClass="form-control" />
					</div>



					<br>

					<div class="form-group">
						<s:label value="%{getText('trip.create.panel.trip')}:" />
						<s:label value="%{getText('trip.create.panel.from')}:" />
						<s:textfield id="dire_desde" name="direccion_desde" type="text" required="required" cssClass="form-control" />
						<s:hidden id="desdePosition" name="desdePosition" value="" required="required" />
						<s:label value="%{getText('trip.create.panel.to')}:" />
						<s:textfield id="dire_hasta" name="direccion_hasta" type="text" required="required" cssClass="form-control" />
						<s:hidden id="hastaPosition" name="hastaPosition" value="" required="required" />
						<s:hidden id="eventoPosition" name="eventoPosition" value="%{recoEvento.mapPosition}" />
						<s:hidden id="eventoDireccion" name="eventoDireccion" value="%{recoEvento.direccion}" />
						<br>
						<div id="_map" style="height: 400px"></div>
					</div>

					<div class="form-group">
						<button class="btn btn-primary" type="submit"><s:text name="trip.create.panel.save"></s:text> </button>
					</div>

				</s:form>

			</div>
		</div>
	</div>

	<div class="container-fluid"></div>

	<%@include file="/views/footer/footer.jsp"%>

</body>
</html>