<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp">

	<jsp:param value="rechercher un article..." name="title" />
</jsp:include>

<body class="container">
	<h1>Entrer une chaine a rechercher dans le titre des articles</h1>
	<c:url value="/welcome.xx" var="welcomeUrl" />
	<p>
		<a class="btn btn-default btn-lg" href="${ welcomeUrl }"> <i
			class="icon-ok"></i> retour a la liste
		</a>
	</p>
	<form method="post">
		<center>
			<div class="form-group">
				<label class="col-md-4 control-label" for="search">Rechercher
					: </label>
				<div class="col-md-4">
					<input id="search" name="search" type="text" placeholder="Titre"
						class="form-control input-md">
				</div>
				<div class="col-md-4">
					<button class="btn btn-block btn-lg btn-success">Rechercher</button>
				</div>
			</div>
		</center>
	</form>

	<c:if test="${not empty resultList}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>article</th>
					<th>description</th>
				</tr>
			</thead>
			<c:forEach items="${ resultList }" var="article">
				<tbody>
					<tr>
						<td>${article.id}</td>
						<td>${article.title}</td>
						<td>${article.description}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</c:if>



</body>
</html>