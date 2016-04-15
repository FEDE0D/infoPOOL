<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="/views/page/head.jsp" %>
	</head>
	<body>
		<%@include file="/views/nav/navbar.jsp" %>
		
		<div class="jumbotron noselect">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4 col-md-push-4 text-center">
						<h1>INFOPool</h1>
						<img src="web/img/carpool_transporte.png" class="img-responsive img-circle center-block">
						<h2 style="margin-top: 0"><s:text name="index.center"></s:text></h2>
					</div>
					<div class="col-md-4 col-md-pull-4 text-justify">
						<p>
							<img src="web/img/gente.jpg" class="img-responsive img-thumbnail center-block" />
						</p>
						
						<p><s:text name="index.left"></s:text></p>
						<p>
							<img src="web/img/comovee_icon_250.png" class="img-responsive center-block" style="width: 100px" />
						</p>
					</div>
					<div class="col-md-4 text-justify">
						<p>
							<img src="web/img/mapa.png" class="img-responsive img-thumbnail center-block" />
						</p>
						<p><s:text name="index.right"></s:text></p>
						<p>
							<img src="web/img/carpooling.png" class="img-responsive center-block" style="width: 100px" />
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
		</div>
		
		<%@include file="/views/footer/footer.jsp" %>
		
	</body>
</html>