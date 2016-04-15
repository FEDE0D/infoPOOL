<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/views/page/head.jsp" %>

<title>Insert title here</title>
</head>
<body>
	<%@include file="/views/nav/navbar.jsp"%>
	<%
		if (session.getAttribute("user") != null) {
			response.sendRedirect("index.jsp");//XXX
		}
	%>
	
	


	<div class="container-fluid">
		<div class="panel panel-primary center-block"
			style="max-width: 600px;">
			<div class="panel-heading"><s:text name="signup.panel.title"></s:text> </div>
			<div class="panel-body">
				<s:form action="Register" method="post">
					<div class="form-group">
						<s:label value="%{getText('signup.panel.user')}: "/>
						<s:textfield name="usuario.username" cssClass="form-control" placeholder="%{getText('signup.panel.user.placeholder')}" autocomplete="off" required="required"></s:textfield>
					</div>
					<div class="form-group">
						<s:label value="%{getText('signup.panel.password')}: "/>
						<s:password name="usuario.password" cssClass="form-control" placeholder="%{getText('signup.panel.password.placeholder')}" autocomplete="off" required="required"></s:password>
					</div>
					<div class="form-group">
						<s:label value="%{getText('signup.panel.password2')}: "/>
						<s:password name="password2" cssClass="form-control" placeholder="%{getText('signup.panel.password2.placeholder')}" autocomplete="off" required="required"></s:password>
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
					<s:submit value="%{getText('signup.panel.send')}" cssClass="btn btn-primary"></s:submit>
					</p>
				</s:form>
			</div>
		</div>
	</div>



	<%@include file="/views/footer/footer.jsp"%>
</body>
</html>
