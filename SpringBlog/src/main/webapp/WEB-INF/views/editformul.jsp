<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp">

	<jsp:param value="Modifier un article ..." name="title" />
</jsp:include>

<body class="container">
	<h1>Modifier un article</h1>
	<c:url value="/welcome.xx" var="welcomeUrl" />
	<p>
		<a class="btn btn-default btn-lg" href="${ welcomeUrl }"> <i
			class="icon-ok"></i> retour a la liste
		</a>
	</p>
	
	<c:url value="/modify.html" var="editUrl" />
	
	<form:form modelAttribute="editArticle" method="post"
		action="${editUrl}">

		<form:hidden path="id" />

		<div class="form-group">
			<label for="title">Titre :</label>
			<form:input id="title" path="title" cssClass="form-control" />
		</div>

		<div class="form-group">
			<label for="description">Description :</label>
			<form:textarea id="description" path="description"
				cssClass="form-control"></form:textarea>

		</div>
		<div class="form-group">
			<form:button>Modifier</form:button>
		</div>

	</form:form>


</body>
</html>