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
			<div class="col-12 text-center">
				<c:if test="${user != null }">
					<h1 class="display-1">Edit User</h1>
				</c:if>
				<c:if test="${user == null }">
					<h1 class="display-1">Add New User</h1>
				</c:if>
			</div>
			<div class="col-5 card">
				<div class="card-body">
					<c:if test="${user != null }">
						<form action="update" method="post">
					</c:if>
					<c:if test="${user == null }">
						<form action="insert" method="post">
					</c:if>
					
					<c:if test="${user != null }">
						<input type="hidden" name="id" value="<c:out value='${user.id}'/>" />
					</c:if>
					
					<div class="mb-3">
						<label for="name" class="form-label">User Name</label>
  						<input type="text" class="form-control" id="name" name="name" value="<c:out value='${user.name}'/>" required="required"/>
					</div>
					
					<div class="mb-3">
						<label for="email" class="form-label">User Email</label>
  						<input type="email" class="form-control" id="email" name="email" value="<c:out value='${user.email}'/>" required="required"/>
					</div>
					
					<div class="mb-3">
						<label for="country" class="form-label">User Country</label>
  						<input type="text" class="form-control" id="country" name="country" value="<c:out value='${user.country}'/>" />
					</div>
					
					<button type="submit" class="btn btn-success">Save</button>
				
					</form>
				</div>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>