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

		<%
			String success = (String) request.getAttribute("success");
			String error = (String) request.getAttribute("error");
		%>

		<%
			if (success != null) {
		%>

		<div class="alert alert-success" style="width: 369px; margin: auto;">
			<strong>Success!</strong>
			<%=success%>
		</div>

		<%
			}
		%>

		<%
			if (error != null) {
		%>
		<div class="alert alert-danger" style="width: 369px; margin: auto;">
			<strong>Danger!</strong>
			<%=error%>
		</div>

		<%
			}
		%>

	<br/>
		<!-- Form Name -->
		<legend>Employee Management</legend>

		<!-- Text input-->
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
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</div>

	</fieldset>
</form>
