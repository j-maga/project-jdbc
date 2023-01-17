<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>login</title>
</head>
<body style="background-color: #e3f2fd;">

<br><br>

<div class="container">
		<div class="card w-50 mx-auto my-4 border border-primary">
			<div class="card-header text-center py-3">Invalid Credentials</div>
			<div class="card-body">
				<form action="invalid-credentials" method="post">
					<br>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Back to Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>