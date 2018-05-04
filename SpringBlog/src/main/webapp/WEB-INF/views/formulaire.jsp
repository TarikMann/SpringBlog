<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp" >

<jsp:param value="Editer un article..." name="title" />
</jsp:include>

<body class="container">
	<h1>Ajouter un article</h1>
	<c:url value="/welcome.xx" var="welcomeUrl" />
	<p>
		<a class="btn btn-default btn-lg" href="${ welcomeUrl }"> <i
			class="icon-ok"></i> retour a la liste
		</a>
	</p>
	<form method="post">
		<center>
			<div class="form-group">
				<label class="col-md-4 control-label" for="title">Titre : </label>
				<div class="col-md-4">
					<input id="title" name="title" type="text" placeholder="Titre"
						class="form-control input-md">

				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label" for="description">description
					: </label>
				<div class="col-md-4">
					<textarea class="form-control" id="description" name="description"
						placeholder="Description"></textarea>
				</div>
			</div>

			<div class="form-group">

				<div class="col-md-4">
					<button class="btn btn-block btn-lg btn-success">Valider</button>

				</div>
			</div>
		</center>
	</form>

</body>
</html>