<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="/views/page/head.jsp" %>
	</head>
	<body>
		<%@include file="/views/nav/navbar.jsp" %>
	
		<div class="container-fluid">
			<div class="panel panel-primary center-block" style="max-width: 600px;">
				<div class="panel-heading"><s:text name="signup.panel.title"></s:text> </div>
				<div class="panel-body">
					<div class="form-group">
						<s:label value="%{getText('signup.panel.user')}: "/>
						<s:textfield name="usuario.username" cssClass="form-control" placeholder="%{getText('signup.panel.user.placeholder')}" autocomplete="off" required="required"></s:textfield>
					</div>
					<div class="form-group">
						<s:label value="%{getText('signup.panel.email')}: "/>
						<s:textfield name="usuario.email" cssClass="form-control" placeholder="%{getText('signup.panel.email.placeholder')}" autocomplete="off" required="required" ></s:textfield>
					</div>
					<div class="form-group">
						<s:label value="%{getText('signup.panel.names')}: "/>
						<s:textfield name="usuario.nombre" cssClass="form-control" placeholder="%{getText('signup.panel.names.placeholder')}" autocomplete="off"></s:textfield>
					</div>
					<div class="form-group">
						<s:label value="%{getText('signup.panel.lastname')}: "/>
						<s:textfield name="usuario.apellido" cssClass="form-control" type="text" placeholder="%{getText('signup.panel.lastname.placeholder')}" autocomplete="off"></s:textfield>
					</div>
					<div class="form-group">
						<s:label value="%{getText('signup.panel.picture')}: "/>
						<s:file name="usuario.foto_path" accept="image/*"></s:file>
					</div>
					
					
					<p class="text-center">
						<s:if test="usuario.calificacion >= 0">
							<button class="btn btn-primary"> <span class="glyphicon glyphicon-stats"></span> <s:text name="ususario.calificacion">usuario.calificacion</s:text></button>
						</s:if>
						<s:else>
							<button class="btn btn-danger"> <span class="glyphicon glyphicon-stats"></span> <s:text name="ususario.calificacion">usuario.calificacion</s:text></button>
						</s:else>
					</p>
				</div>
			</div>
			<p>
			<div class="panel panel-primary center-block" style="max-width: 800px;">
				<div class="panel-heading"><s:text name="user.messages"></s:text> </div>
				<div class="panel-body" style="max-height: 600px; overflow:auto;">
					<table class="table table-resizable">
						<tbody>
							<s:iterator value="conversacion" status="stat" var="mensaje">
								<tr>
									<td>
										<s:if test="%{#session.user.username.equals(emisor.username)}">
											<button class="btn btn-primary pull-right">
												<s:property value="mensaje"/>
												<br>
												<small><s:property value="fecha" />, <s:property value="hora" /></small>
											</button>
										</s:if>
										<s:else>
											<button class="btn btn-warning pull-left">
												<s:property value="mensaje"/>
												<br>
												<small><s:property value="fecha" />, <s:property value="hora" /></small>
											</button>
										</s:else>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<div class="panel-footer">
					<hr>
					<s:form action="aMensaje_Alta" theme="simple" >
						<s:label><strong>Mensaje:</strong></s:label>
						<s:hidden name="emisor" value="%{#session.user.id}"/>
						<s:hidden name="receptor" value="%{usuario.id}"/>
						<s:textarea label="Mensaje" name="contenido" rows="5" cssClass="form-control" placeholder="Escriba un mensaje"/>
						<s:submit cssClass="btn btn-primary" value="Enviar"></s:submit>
					</s:form>
				</div>
			</div>
			
		</div>
	</body>
</html>