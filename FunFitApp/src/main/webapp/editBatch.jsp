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
	<div class="alert alert-success d-none" role="alert" id="response"></div>
	<h2>Edit Batch Details</h2>
		<input id="bid" name="bid" type="text" disabled hidden=true value="<%= request.getParameter("bid") %>">
		<label>TypeOfBatch</label>
		<select id="typeofbatch" name="typeofbatch">
			<option value="">--Select Batch--</option>
			<option <%= ((request.getParameter("typeofbatch").equals("morning"))? "selected":"") %> value="Morning">Morning</option>
			<option <%= ((request.getParameter("typeofbatch").equals("evening"))? "selected":"") %> value="Evening">Evening</option>
		</select>
		<br/>
		<label>Time</label>
		<select id="time" name="time">
		<option value="">--Time--</option>
		<%
		for(int i=1,j=2;i<=12 && j<13;i++,j++){
			%>
			<option <%= ((request.getParameter("time").equals(i + "-" + j))? "selected":"") %> value="<%=i%>-<%=j %>"><%=i%>-<%=j%></option>
			<% 
		}
		%>
		</select>
		<br/>
		<button class="btn btn-success" type="button" onclick="sendPutMethod()">Update Batch</button>
		<a class="btn btn-secondary" href="index.jsp">Back</a>
	
	<script>
	function sendPutMethod(){
		
		bid = document.getElementById("bid").value;
		typeofbatch = document.getElementById("typeofbatch").value;
		time = document.getElementById("time").value;
		
		body = {
				  "bid": bid,
				  "typeofbatch": typeofbatch,
				  "time": time
			  };
		const options = {
				  method: 'PUT',
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
		    console.log('Resource updated successfully:', data);
		  })
		  .catch(error => {
		    console.error('There was a problem with your fetch operation:', error);
		  });

	}
	</script>
</body>
</html>