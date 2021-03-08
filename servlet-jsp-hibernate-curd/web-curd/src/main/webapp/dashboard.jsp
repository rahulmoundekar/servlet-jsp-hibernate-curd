<%@page import="com.app.entity.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=ISO-8859-1"%>
<%@page language="java" trimDirectiveWhitespaces="true"%>

<%@page errorPage="error.jsp"%>
<%@page isErrorPage="true"%>
<%@ include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
<title>Employee Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<form class="form-horizontal" action="register" method="post">
	<fieldset>



		<a:if test="${ not empty success}">
			<div class="alert alert-success" style="width: 369px; margin: auto;">
				<strong>Success!</strong> ${success}
			</div>
			
		</a:if>


		<a:if test="${not empty error }">
			<div class="alert alert-danger" style="width: 369px; margin: auto;">
				<strong>Danger!</strong> ${error}
			</div>
		</a:if>

		<br />
		<!-- Form Name -->
		<legend>Employee Management</legend>
		<%
			Employee employee = (Employee) request.getAttribute("employee");
		%>
		<!-- Text input-->
		<%
			if (employee != null) {
		%>
		<input type="hidden" value="<%=employee.getId()%>" name="id">
		<div class="form-group">
			<label class="col-md-4 control-label" for="name">Enter Name</label>
			<div class="col-md-4">

				<input id="name" name="name" type="text" placeholder="Enter Name"
					class="form-control input-md" required=""
					value="<%=employee.getName()%>">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="mobile">Enter
				Mobile Number</label>
			<div class="col-md-4">
				<input id="mobile" name="mobile" type="text"
					placeholder="Enter Mobile Number" class="form-control input-md"
					required="" value="<%=employee.getMobile()%>">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="salary">Enter
				Salary</label>
			<div class="col-md-4">
				<input id="salary" name="salary" value="<%=employee.getSalary()%>"
					type="text" placeholder="Enter Salary"
					class="form-control input-md" required="">

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for=""></label>
			<div class="col-md-4">
				<button type="submit" class="btn btn-success">Update</button>
			</div>
		</div>
		<%
			} else {
		%>
		<input type="hidden" value="" name="id">
		<div class="form-group">
			<label class="col-md-4 control-label" for="name">Enter Name</label>
			<div class="col-md-4">

				<input id="name" name="name" type="text" placeholder="Enter Name"
					class="form-control input-md" required="">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="mobile">Enter
				Mobile Number</label>
			<div class="col-md-4">
				<input id="mobile" name="mobile" type="text"
					placeholder="Enter Mobile Number" class="form-control input-md"
					required="">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="salary">Enter
				Salary</label>
			<div class="col-md-4">
				<input id="salary" name="salary" type="text"
					placeholder="Enter Salary" class="form-control input-md"
					required="">

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for=""></label>
			<div class="col-md-4">
				<button type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-pencil"></span>Save
				</button>
			</div>
		</div>
		<%
			}
		%>
		
		<a:choose>
			<a:when test="${not empty success}">
					<h1>Hello</h1>
			</a:when>
			<a:otherwise>
					<h1>Bye!</h1>
			</a:otherwise>
		</a:choose>
		
		

	</fieldset>
</form>

<div class="container">
	<h2>Hover Rows</h2>
	<p>The .table-hover class enables a hover state on table rows:</p>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>MOBILE</th>
				<th>SALARY</th>
				<th>ACTIONS</th>
			</tr>
		</thead>
		<tbody>

			<a:forEach items="${employees}" var="employee">
				<tr>
					<a:set value="${employee.name}" var="n"></a:set>
					<td><a:out value="${employee.id}" /></td>
					<td>${fn:toUpperCase(n)}</td>
					<td>${employee.mobile}</td>
					<td>${employee.salary}</td>


					<td><a href='<a:url value="modify?id=${employee.id}"></a:url>'><span
							class="glyphicon glyphicon-pencil"></span></a> | <a href="delete?id="><span
							class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
			</a:forEach>

		</tbody>
	</table>
</div>

<%@ include file="footer.jsp"%>
