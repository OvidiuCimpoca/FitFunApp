<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Fun Fit</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="alert alert-success d-none" role="alert" id="response"></div>
	<h2>Participants Details</h2>
	<table border="1" class="table">
	<tr>
		<th>Participants Id</th>
		<th>First Name</th>
		<th>Age</th>
		<th>PhNumber </th>
		<th>Batch Id</th>
		<th>Action</th>
	</tr>
	<core:forEach var="participant" items="${sessionScope.participants}">
		<tr id="row-${participant.getPid()}">
		<td><core:out value="${participant.getPid()}"></core:out> </td>
		<td><core:out value="${participant.getFname()}"></core:out> </td>
		<td><core:out value="${participant.getAge()}"></core:out> </td>
		<td><core:out value="${participant.getPhonenumber()}"></core:out> </td>
		<td><core:out value="${participant.getBid()}"></core:out> </td>
		<td>
			<a class="btn btn-secondary" href="editParticipants.jsp?pid=${participant.getPid()}&fname=${participant.getFname()}&age=${participant.getAge()}&phonenumber=${participant.getPhonenumber()}&bid=${participant.getBid()}">Edit</a> | 
			<a class="btn btn-danger" href="#" onClick="sendDelet(${participant.getPid()})">Delete</a> </td>
		</tr>
	</core:forEach>
	</table>
	<br/>
	<a class="btn btn-secondary" href="index.jsp">Back</a>
	<script>
	function sendDelet(pid){
		  if (confirm("You are about to delete a record!") == true) {
			body = {
					  "pid": pid
				  };
			const options = {
					  method: 'DELETE',
					  headers: {
					    'Content-Type': 'application/json'
					  },
					  body: JSON.stringify(body)
			};
			
			fetch("ParticipantsController", options)
			  .then(response => {
			    if (!response.ok) {
			      throw new Error('Network response was not ok');
			    }
			    response.text().then(function(result) {
			    	var response = document.getElementById("response");
			    	response.innerHTML = "<span>" + result + "</span>";
			    	response.classList.remove("d-none");
			    });
			    return response;
			  })
			  .then(data => {
			    console.log('Resource delete was successfully:', data);
			    updateDom(pid);
			  })
			  .catch(error => {
			    console.error('There was a problem with your fetch operation:', error);
			  });
		  }

	}
	
	function updateDom(id){
		const row = document.getElementById("row-"+id);
		row.remove();
	}
	</script>
</body>
</html>