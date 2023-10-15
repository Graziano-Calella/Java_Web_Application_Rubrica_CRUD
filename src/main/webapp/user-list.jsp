<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>User Management Application</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<h1 class="display-1 text-center">List of Users</h1>
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>
				
				<table class="table table-striped">
					<thead>
				    	<tr>
					    	<th scope="col">ID</th>
					      	<th scope="col">Name</th>
					      	<th scope="col">Email</th>
					      	<th scope="col">Country</th>
					      	<th scope="col">Actions</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach var="user" items="${listUser}">
				  			<tr>				      
						    	<td><c:out value="${user.id}"/></td>
						      	<td><c:out value="${user.name}"/></td>
						      	<td><c:out value="${user.email}"/></td>
						      	<td><c:out value="${user.country}"/></td>
						      	<td>
						      		<a href="edit?id=<c:out value='${user.id}'/>">Edit</a>
						      		<a href="delete?id=<c:out value='${user.id}'/>">Delete</a>
						      	</td>
						    </tr>
				  		</c:forEach>				 
				  	</tbody>
				</table>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>