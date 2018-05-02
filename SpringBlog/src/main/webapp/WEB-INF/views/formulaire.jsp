<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp" />
<body>
	<h1>Ajouter un article</h1>
	<form method="post">

	<div class="container">
	<div class="row">
	<div class="col-6">
			<label for="title">Titre    : </label>
			 <input type="text" id="title"	name="title" />
		</div>
		
		<div class="col-6">
			<label for="description">description : </label>
			<textarea id="description" name="description"></textarea>

			
		</div>
			<div class="col-12">
			<button>Valider</button>
		</div>
	</div>
	
	
	
	
	
	</div>
		
		
	</form>

</body>
</html>