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
<body onload="loadSelect()">
	<div class="alert alert-success d-none" role="alert" id="response"></div>
	<h2>Edit Participants Details</h2>
		
		<input id="bid-hidden" name="bid-hidden" type="text" disabled hidden=true value="<%= request.getParameter("bid") %>">
		
		<input id="pid" name="pid" type="text" disabled hidden=true value="<%= request.getParameter("pid") %>">
		<label>FName</label>
		<input id="fname" type="text" name="fname" value="<%= request.getParameter("fname") %>"><br/>
		<label>Age</label>
		<input id="age" type="number" name="age" value="<%= request.getParameter("age") %>"><br/>
		<label>PhNumber</label>
		<input id="phonenumber" type="text" name="phonenumber" value="<%= request.getParameter("phonenumber") %>"><br/>
		
		<label>Batch</label>
		<select id="bid" name="bid">
			<core:forEach var="bid" items="${sessionScope.batches}">
				<option value="<core:out value="${bid.getBid()}"></core:out>"> <core:out value="${bid.getTypeofbatch()}"></core:out> 
				- 
				<core:out value="${bid.getTime()}"></core:out></option>
			</core:forEach>
		</select>
		<br/>
		<button class="btn btn-success" type="button" onclick="sendPutMethod()">Update Batch</button>
		<a class="btn btn-secondary" href="index.jsp">Back</a>
	
	<script>
	
	function loadSelect() {
		
		bidHidden = document.getElementById("bid-hidden");
		bid = document.getElementById("bid");
		bid.value = bidHidden.value;
	}
	
	function sendPutMethod(){
		
		pid = document.getElementById("pid").value;
		fname = document.getElementById("fname").value;
		age = document.getElementById("age").value;
		phonenumber = document.getElementById("phonenumber").value;
		bid = document.getElementById("bid").value;
		
		body = {
				  "pid": pid,
				  "fname": fname,
				  "age": age,
				  "phonenumber": phonenumber,
				  "bid": bid
			  };
		const options = {
				  method: 'PUT',
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
		    console.log('Resource updated successfully:', data);
		  })
		  .catch(error => {
		    console.error('There was a problem with your fetch operation:', error);
		  });

	}
	</script>
</body>
</html>