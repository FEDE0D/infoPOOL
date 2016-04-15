<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/views/page/head.jsp"%>
	<%@include file="/views/page/dirPicker.jsp" %>

	<!-- DATA-TABLES -->
	<script type="text/javascript" src="web/lib/DataTables-1.10.3/media/js/jquery.dataTables.min.js"></script>
	<!-- <link type="text/css" rel="stylesheet" href="web/lib/DataTables-1.10.3/media/css/jquery.dataTables.min.css" /> -->

	<script>
		function getUrlParameter(sParam)
		{
		    var sPageURL = window.location.search.substring(1);
		    var sURLVariables = sPageURL.split('&');
		    for (var i = 0; i < sURLVariables.length; i++) 
		    {
		        var sParameterName = sURLVariables[i].split('=');
		        if (sParameterName[0] == sParam) 
		        {
		            return sParameterName[1];
		        }
		    }
		}
		$(document)
				.ready(
						function() {
							$.fn.dataTableExt.oStdClasses.sPageButton = "btn btn-link ";
							$.fn.dataTableExt.oStdClasses.sPaging = "text-right ";
							var table = $("#_table")
									.DataTable(
											{
												"dom" : 'tp',
												pagingType : "full_numbers",
												"oLanguage" : {
													"oPaginate" : {
														"sFirst" : "<span class='glyphicon glyphicon-step-backward'></span>",
														"sPrevious" : "<span class='glyphicon glyphicon-chevron-left'></span>",
														"sNext" : "<span class='glyphicon glyphicon-chevron-right'></span>",
														"sLast" : "<span class='glyphicon glyphicon-step-forward'></span>"
													}
												},
											});
							$("#_sq").keyup(function() {
								table.search($(this).val()).draw();
							});
						});
		$(document).ready(function(){
			var query = getUrlParameter("q");
			if (query){
				$("#_sq").val(query);
				$("#_sq").trigger("keyup");
			}
		});
	</script>

</head>
<body>
	<%@include file="/views/nav/navbar.jsp"%>


	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title"><s:text name="trip.list.panel.title"></s:text></h1>
			</div>
			<div class="panel-body">
				<a href="vRecorrido_Alta.action"><button class="btn btn-sm btn-primary pull-right" title="Crear un recorrido"><span class="glyphicon glyphicon-pencil"></span> <s:text name="trip.list.panel.create"></s:text></button></a>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3">
						<div class="input-group">
							<input id="_sq" name="search_query" type="text"
								class="form-control" /> <span class="input-group-btn">
								<button class="btn btn-default">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body tableContent">
				<table id="_table" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<th></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Recorrido">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="trip.list.panel.trip"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Dia">
								<span class="glyphicon glyphicon-sort-by-attributes"></span> <s:text name="trip.list.panel.date"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Horario">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="trip.list.panel.time"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Asientos">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="trip.list.panel.seats"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Evento">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="trip.list.panel.event"></s:text>
							</button></th>
						<th><button class="btn btn-sm btn-primary"
								title="Ordenar por Conductor">
								<span class="glyphicon glyphicon-sort-by-attributes"></span>
								<s:text name="trip.list.panel.driver"></s:text>
							</button></th>
						<th></th>
					</thead>
					<tbody>
<%-- 							<s:iterator value="recorridos"> --%>
<%-- 								<s:iterator value="periodicidad"> --%>
<!-- 									<tr> -->
<!-- 										<td> -->
<%-- 											<s:property value="fecha" /></strong> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
<%-- 								</s:iterator> --%>
<%-- 							</s:iterator> --%>
					
					
						<s:iterator value="recorridos" var="reco" status="stat">
							<tr>
								<td>
									<button class="btn btn-link" title="Ver en Mapa" data-toggle="modal" data-target="#map-modal" map-desde="<s:property value="desdePosition"/>" map-hasta="<s:property value="hastaPosition"/>" map-evento="<s:property value="evento.mapPosition"/>">
										<span class="glyphicon glyphicon-pushpin"></span>
									</button>
								</td>
								<td><span>Desde</span> <strong><s:property
										value="direccion_desde" /></strong> <br> <span>Hasta</span> <strong><s:property 
											value="direccion_hasta" /></strong></td> 

								<td>
										<s:if test="%{isPuntual()}"> <strong><s:property 
											value="periodicidad[0].fecha" /></strong>
										</s:if>
										<s:else>
											<s:iterator value="periodicidad" >
												<strong><s:property value="getDia()" /></strong>
												<br>
											</s:iterator>										
										</s:else>
								</td>

								<td>
									<s:iterator value="periodicidad" >
												Ida: <strong><s:property value="hora_idaBrowser" /></strong> - 
												Vuelta: <strong><s:property value="hora_vueltaBrowser" /></strong><br>
									</s:iterator>	
								</td>
								<td>
									<span class="badge"><s:property value="total_asientos" /></span> asientos
								</td>
								<td>
									<s:if test="%{tieneEvento()}"> 
										<s:url id="editURL" action="vEvento_Detalle">
										<s:param name="eventoId" value="%{evento.id}"></s:param>
										</s:url> <s:a href="%{editURL}">
											<s:property value="evento.nombre" />
										</s:a>
									</s:if>
									<s:else>
									    Sin Evento
									</s:else>
								</td>
								<td>
									<strong><a href="vPerfil.action?uid=<s:property value="creador.id"/>" ><s:property value="creador.username"/></a></strong>
								</td>
								<td>
									<a href="vRecorrido_Detalle.action?id=<s:property value="id"/>">
										<button class="btn btn-sm btn-primary" title="Ver recorrido">
											<span class="glyphicon glyphicon-info-sign"></span>
										</button>
								</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="map-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div id="_map" class="" style="height: 400px;" ></div>
				</div>
			</div>
			<script type="text/javascript">
				
				var center = posLaPlata;
			
				function mapLoaded(){
					startMap(MAP_MODE.RECORRIDO_LISTADO);
				}
			
				$('#map-modal').on('show.bs.modal', function (e) {
					var btn = $(e.relatedTarget);
					loadMiniMap(btn);
				});
				
				$('#map-modal').on('shown.bs.modal', function (e) {
					google.maps.event.trigger(map, 'resize');
					map.setZoom(mapZoom);
					map.setCenter(center);
				});
				
				
			</script>
		</div>
		
	</div>


	<%@include file="/views/footer/footer.jsp"%>

</body>
</html>