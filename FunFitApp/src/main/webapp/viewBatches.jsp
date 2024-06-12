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
	<h2>Batch Details</h2>
	<table border="1" class="table">
	<tr>
		<th>Batch Id</th>
		<th>Type Of Batch</th>
		<th>Time</th>
		<th>Action</th>
	</tr>
	<core:forEach var="batch" items="${sessionScope.batches}">
		<tr id="row-${batch.getBid()}">
		<td><core:out value="${batch.getBid()}"></core:out> </td>
		<td><core:out value="${batch.getTypeofbatch()}"></core:out> </td>
		<td><core:out value="${batch.getTime()}"></core:out> </td>
		<td>
			<a class="btn btn-secondary" href="editBatch.jsp?bid=${batch.getBid()}&typeofbatch=${batch.getTypeofbatch()}&time=${batch.getTime()}">Edit</a> | 
			<a class="btn btn-danger" href="#" onClick="sendDelet(${batch.getBid()})">Delete</a> </td>
		</tr>
	</core:forEach>
	</table>
	<br/>
	<a class="btn btn-secondary" href="index.jsp">Back</a>
	<script>
	function sendDelet(bid){
		  if (confirm("You are about to delete a record!") == true) {
			body = {
					  "bid": bid
				  };
			const options = {
					  method: 'DELETE',
					  headers: {
					    'Content-Type': 'application/json'
					  },
					  body: JSON.stringify(body)
			};
			
			fetch("BatchController", options)
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
			    updateDom(bid);
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