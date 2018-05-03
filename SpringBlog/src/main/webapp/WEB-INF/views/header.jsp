<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${param.title}</title>


<c:url value="/js" var="jsUrl" />
<script src="${jsUrl}/jquery-3.3.1.min.js"></script>
<script src="${jsUrl}/bootstrap.min.js}"></script>
<c:url value="/css/bootstrap.min.css" var="bootstrapCssUrl" />
<link rel="stylesheet" href="${bootstrapCssUrl}" />


</head>
<body>
	<c:url value="/welcome.xx" var="welcomeUrl" />
	<c:url value="/formulaire.zzz" var="createUrl" />
	<c:url value="/search.zzz" var="searchUrl" />

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${welcomeUrl}">Best Of Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="${welcomeUrl}">Listes des articles <span class="sr-only"></span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${createUrl}">Ajouter
						articles</a></li>
				<li class="nav-item"><a class="nav-link" href="${searchUrl}">Rechercher
						des articles</a></li>

			</ul>
		</div>
	</nav>
</body>
</html>