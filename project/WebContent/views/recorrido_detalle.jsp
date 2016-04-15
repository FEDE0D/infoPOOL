<%@page import="com.opensymphony.xwork2.inject.Context"%>
<%@page import="com.tp.uml.Dia"%>
<%@page import="com.tp.uml.Recorrido"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="/views/page/head.jsp" %>
		<%@include file="/views/page/dirPicker.jsp" %>
		
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#btn_propuesta').click(function() {
			        if ($('#div_propuesta').is (':hidden')){
// 			            $('#div_propuesta').show();
			            $('#div_propuesta').fadeIn('slow');
			            $('#div_denuncia').hide();
			            $('#div_denuncia').fadeOut('slow');
			        }
			        else{
			            $('#div_propuesta').hide();
			            $('#div_propuesta').fadeOut('slow');
			        }
			    });
			});
			
			$(document).ready(function() {
			    $('#btn_denuncia').click(function() {
			        if ($('#div_denuncia').is (':hidden')){
// 			            $('#div_propuesta').show();
			            $('#div_denuncia').fadeIn('slow');
			            $('#div_propuesta').hide();
			            $('#div_propuesta').fadeOut('slow');
			        }
			        else{
			            $('#div_denuncia').hide();
			            $('#div_denuncia').fadeOut('slow');
			        }
			    });
			});
		</script>
		
		<script type="text/javascript">
			function mapLoaded(){
				startMap(MAP_MODE.RECORRIDO_DETALLE);
			}
		</script>
		
	</head>
	<body>
		<%@include file="/views/nav/navbar.jsp" %>
	
		<div class="container-fluid">
			<div class="panel panel-primary center-block" style="max-width: 600px;">
				<div class="panel-heading"><s:text name="trip.read.panel.title"></s:text> (<a href="vPerfil.action?uid=<s:property value="recorridoDetalle.creador.id"/>" style="color: white;"><s:property value="recorridoDetalle.creador.username"/> </a>)</div>
				<div class="panel-body">
				
					<% 
					Recorrido recorrido = (Recorrido)ActionContext.getContext().getValueStack().findValue("recorridoDetalle");
					if (recorrido.getEvento() != null){%>
					<s:url id="verEventoURL" action="vEvento_Detalle">
						<s:param name="eventoId" value="%{recorridoDetalle.evento.id}"></s:param>
					</s:url>
					<label><s:text name="trip.read.panel.event"></s:text>: <s:a href="%{verEventoURL}"><s:property value="recorridoDetalle.evento.nombre"/></s:a> </label>
					<br>
					<hr>
					<%
					}
					%>
					
					
					<% if (recorrido.getPeriodicidad().get(0).getFecha() != null){// DIA PUNTUAL %>
					
						<table class="table">
							<tr>
								<td>
									<label><strong><s:text name="trip.read.panel.date"></s:text></strong></label> <input class="form-control" name="fecha_puntual" type="date" readonly="readonly" value="<s:property value="recorridoDetalle.periodicidad[0].fechaBrowser"/>"/>
								</td>
								<td>
									<label><strong><s:text name="trip.read.panel.dtime"></s:text></strong></label> <input class="form-control" name="hora_ida_puntual" type="time" readonly="readonly" value="<s:property value="recorridoDetalle.periodicidad[0].hora_idaBrowser"/>">
								</td>
								<td>
									<label><strong><s:text name="trip.read.panel.atime"></s:text></strong></label> <input class="form-control" name="hora_vuelta_puntual" type="time" readonly="readonly" value="<s:property value="recorridoDetalle.periodicidad[0].hora_vueltaBrowser"/>"/>
								</td>
							</tr>
						
						</table>
					<% }else{// DIAS PERIODICOS %>
						<table class="table">
								<thead>
									<tr>
										<th><s:text name="trip.create.panel.day"></s:text></th>
										<th><s:text name="trip.create.panel.dtime"></s:text></th>
										<th><s:text name="trip.create.panel.atime"></s:text></th>
									</tr>
								</thead>
								<tbody>
								<s:iterator value="recorridoDetalle.periodicidad" status="status" >
									<tr>
										<td><s:property value="dia"/></td>
										<td><input class="form-control" type="time" readonly="readonly" value="<s:property value="hora_idaBrowser"/>"/></td>
										<td><input class="form-control" type="time" readonly="readonly"  value="<s:property value="hora_vueltaBrowser"/>"/></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					<% } %>
					
					<hr>
					
					<label><strong><s:text name="trip.read.panel.seats"></s:text>:</strong></label>
					<label><s:property value="%{recorridoDetalle.getAsientosDisponibles()}"/> <s:text name="trip.read.panel.seats.of"></s:text> <s:property value="recorridoDetalle.total_asientos"/></label>
					
					<hr>
					
					<label><strong><s:text name="trip.read.panel.trip"></s:text></strong></label><br />
					<label><strong><s:text name="trip.read.panel.from"></s:text></strong></label> <input class="form-control" id="dire_desde" type="text" readonly="readonly" value="<s:property value="recorridoDetalle.direccion_desde"/>"/> <br />
					<label><strong><s:text name="trip.read.panel.to"></s:text></strong></label> <input class="form-control" id="dire_hasta" type="text" readonly="readonly" value="<s:property value="recorridoDetalle.direccion_hasta"/>"/> <br />
					<s:hidden id="desdePosition" name="desdePosition" value="%{recorridoDetalle.desdePosition}" />
					<s:hidden id="hastaPosition" name="hastaPosition" value="%{recorridoDetalle.hastaPosition}" />
					<s:hidden id="eventoPosition" name="eventoPosition" value="%{recorridoDetalle.evento.mapPosition}" />
					<s:hidden id="eventoDireccion" name="eventoDireccion" value="%{recorridoDetalle.evento.direccion}" />
					<br>
					<div id="_map" style="height: 400px"></div>
					
					<hr>
					<%
// 						Usuario USER2 = (Usuario) session.getAttribute("user");
						Recorrido reco = DAOFactory.getRecorrido().getById(Long.valueOf(request.getParameter("id")));
						Usuario recoOwner = reco.getCreador();
						List<Usuario> participantes = reco.getParticipantes();
						boolean participa = false;
						if (USER != null){
							for (Usuario p : participantes) if (p.getUsername().equals(USER.getUsername())) participa = true;
							if (USER.getId() != recoOwner.getId() && !participa){ 
						%>
							<s:if test="%{recorridoDetalle.getAsientosDisponibles() != 0}"> 
								<button class="btn btn-primary" type="button" id="btn_propuesta">Propuesta</button>
							</s:if>
						<%
							}else if (participa){
						%>
							<button class="btn btn-primary pull-left" type="button" id="btn_up" onclick="votar(1)" ><span class="glyphicon glyphicon-thumbs-up"></span></button>
							<button class="btn btn-primary pull-left" type="button" id="btn_down" onclick="votar(-1)"><span class="glyphicon glyphicon-thumbs-down"></span></button>
							<button class="btn btn-danger pull-right" type="button" id="btn_denuncia">Denunciar</button>
							<script>
								function votar(v){
									$.ajax({
									    type : "GET",
									    url  : "<s:url action='aRecorrido_Voto'/>",
									    dataType : 'text',
									    data : {'v': v, 'rid': <s:text name="recorridoDetalle.id">recorridoDetalle.id</s:text>},
									    success : function(result){
											if (result == "0"){
												alert("Su calificación fue registrada correctamente")
											}else if (result == "1"){
												alert("Usted ya calificó este recorrido")
											}else{
												alert("Hubo un error al procesar el pedido")
											}
									    }
									});         
								}
							</script>
						<%	} %>
						<% } %>
					
					<div id="div_propuesta" style='display:none;'>
						
						<hr>
						<s:form action="aPropuesta_Alta" method="post" theme="simple" >
							<s:label><strong>Mensaje:</strong></s:label>
							<s:hidden name="recorrido_id" value="%{recorridoDetalle.id}"/>
							<s:textarea label="Mensaje" name="mensaje" rows="5" cssClass="form-control" placeholder="Escriba un mensaje para el creador del recorrido :D"/>
							<s:submit cssClass="btn btn-primary" value="Enviar"></s:submit>
						</s:form>
					</div>
					
					<div id="div_denuncia" style='display:none;'>
						
						<hr>
						<s:form action="aDenuncia_Alta" method="post" theme="simple" >
							<s:label><strong>Denuncia:</strong></s:label>
							<s:hidden name="recorrido_id" value="%{recorridoDetalle.id}"/>
							<s:textarea label="Dununcia" name="motivo" rows="5" cssClass="form-control" placeholder="Escriba el motivo de su denuncia :S"/>
							<s:submit cssClass="btn btn-primary" value="Enviar"></s:submit>
						</s:form>
					</div>
					
<!-- 					COMENTARIOS -->
					<br>
<!-- 					<hr> -->
<!-- 					<br> -->
<!-- 					<div> -->
						
<!-- 						<form action="recorridoX.html" method="post"> -->
		
<%-- 						<label><strong>Comentarios:</strong></label> --%>
<!--                         <div class="form-group"> -->
<!--                             <div class="alert alert-info" role="alert"> -->
<!--                                 <a href="usuarioX.html" class="alert-link">Fedex:</a> -->
<!--                                 <p>Maneja bien y es buen pibe.</p> -->
<!--                             </div> -->
<!--                         </div> -->
                        
<!--                         <div class="form-group"> -->
<!--                             <div class="alert alert-success" role="alert"> -->
<!--                                 <a href="usuarioX.html" class="alert-link">visitante:</a> -->
<!--                                 <p>Maneja mal y es mal pibe.</p> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="form-group"> -->
<!--                             <div class="alert alert-info" role="alert"> -->
<!--                                 <a href="usuarioX.html" class="alert-link">Tito:</a> -->
<!--                                 <p>Gracias Fede.</p> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="form-group"> -->
<!--                             <label>Comentar:</label> -->
<!--                             <textarea name="respuesta" placeholder="Ingresa aqui su comentario" required="required" class="form-control"></textarea> -->
<!--                         </div> -->


<!--                         <div class="form-group"> -->
<!--                             <button class="btn btn-primary" type="submit">Enviar</button> -->
<!--                         </div> -->

<!--                     </form> -->
<!-- 					</div> -->
					
					
				</div>
      		</div>
   		</div>
		<%@include file="/views/footer/footer.jsp" %>
		
	</body>
</html>
