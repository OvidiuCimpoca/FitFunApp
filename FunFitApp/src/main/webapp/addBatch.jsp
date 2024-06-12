<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Fun Fit</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<h2>Add Batch Details</h2>
	<form action="BatchController" method="post">
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="typeofbatch">TypeOfBatch</label>
		  </div>
		  <select name="typeofbatch" class="custom-select">
			<option value="">--Select Batch--</option>
			<option value="Morning">Morning</option>
			<option value="Evening">Evening</option>
		  </select>
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="time">Time</label>
		  </div>
		  <select name="time" class="custom-select">
			<option value="">--Time--</option>
			<%
			for(int i=1,j=2;i<=12 && j<13;i++,j++){
				%>
				<option value="<%=i%>-<%=j %>"><%=i%>-<%=j%></option>
				<% 
			}
			%>
		  </select>
		</div>
		<input class="btn btn-success" type="submit" value="Add Batch"/>
		<input class="btn btn-primary" type="reset" value="Reset"/>
		<a class="btn btn-secondary" href="index.jsp">Back</a>
	</form>
</body>
</html>