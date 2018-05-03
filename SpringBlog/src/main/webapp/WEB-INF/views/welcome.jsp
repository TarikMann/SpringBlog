<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp">
	<jsp:param value="Liste des articles" name="title" />

</jsp:include>

<body class="container">
	<center>
		</br>
		<h1>Liste des articles :</h1>
		</br>
	</center>
	<div class="row">

		<c:url value="/images" var="imgUrl" />
		<c:url value="/delete" var="deleteUrl" />
		<c:url value="/displayEdit" var="editUrl" />
		<c:forEach items="${ articles }" var="article">
			<div class="col-sm-12 col-md-12" text-center>
				<div class="span3" style="background: #e6ffe6; border: 1px">
					<div class="well row" title="${ article.id }">
						<div class="col-2">
							<center>
								<p></p>

								<img alt="afficher" src="${imgUrl}/afficher.png" width="25%">

								<a href="${editUrl}/${article.id}"> <img alt="Modifier"
									src="${imgUrl}/edit.png">
								</a> <a href="${deleteUrl}/${article.id}"> <img alt="Supprimer"
									src="${imgUrl}/delete.png">
								</a>
							</center>
						</div>
						<div class="col-10">
							<h2 class="text-muted">${ article.title }</h2>
							<p>
								<spring:escapeBody>${article.description}</spring:escapeBody>
							</p>
						</div>

					</div>
				</div>
				</br>
			</div>
			<p></p>
		</c:forEach>
	</div>
	<c:url value="/search.zzz" var="searchUrl" />
	<a href="${searchUrl}">Rechercher des articles</a>
	</div>
</body>
</html>