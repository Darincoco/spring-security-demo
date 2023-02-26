<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Luv2code Company Home Page</title>
</head>
<body>

	<h2>Luv2code Company Home Page</h2>
	<hr>
	
	<p>
	Welcome to the luv2code company home page!
	</p>
	
	<hr>
	
	<!-- display the user and the role -->
	<p>
	
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
	
	</p>
	
	<hr>
	<security:authorize access="hasRole('MANAGER')">
	
	<!-- add a link point to /leaders, this is for managers -->
	<p>
		<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
		(Only for Manager peeps)
	
	</p>
	
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
	
	<!-- add a link to /systems, this is for admin -->
	<p>
		<a href="${pageContext.request.contextPath}/systems">IT System Meeting</a> 
		(Only for Admin peeps)

	</p>
	
	</security:authorize>
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
	
		<input type="submit" value="logout">
	
	</form:form>
	
</body>
</html>