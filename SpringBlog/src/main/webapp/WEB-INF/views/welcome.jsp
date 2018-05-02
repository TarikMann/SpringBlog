<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listes des articles</title>
</head>
<body  class="container">
	<h1>Liste des articles</h1>
	<c:forEach items="${ articles }" var="article">
		<div title="${ article.id }">
			<h2>${ article.title }</h2>
			<p>${ article.description }</p>
		</div>
	</c:forEach>
		<c:url value="/formulaire.zzz" var="createUrl"/>
	<a href="${ createUrl }"> Creation d'article</a>
</body>
</html>