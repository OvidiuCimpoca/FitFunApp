<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Fun Fit</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<h2>Add Participants Details</h2>
	<form action="ParticipantsController" method="post">
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">FName</span>
		  </div>
		  <input type="text" name="fname" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Age</span>
		  </div>
		  <input type="number" name="age" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">PhNumber</span>
		  </div>
		  <input type="text" name="phonenumber" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="bid">Batch</label>
		  </div>
		  <select name="bid" class="custom-select">
		    <core:forEach var="bid" items="${sessionScope.batches}">
				<option value="<core:out value="${bid.getBid()}"></core:out>"> <core:out value="${bid.getTypeofbatch()}"></core:out> 
				- 
				<core:out value="${bid.getTime()}"></core:out></option>
			</core:forEach>
		  </select>
		</div>
		<input class="btn btn-success" type="submit" value="Add Participants"/>
		<input class="btn btn-primary" type="reset" value="Reset"/>
		<a class="btn btn-secondary" href="index.jsp">Back</a>
	</form>
	
	<script>
	
	</script>
</body>
</html>