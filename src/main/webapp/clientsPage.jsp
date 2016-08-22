<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

		function openModal()
		{
			$("#clientModal").modal()
		}

	$(document).ready(function(){
		$("#addClient").click(function(){
			var clientName = $("#clientName").val();
			var email = $("#email").val();
			var contactName = $("#contactName").val();
			var phone = $("#phone").val();
			var fax = $("#fax").val();
			var adLine1 = $("#adLine1").val();
			var adLine2 = $("#adLine2").val();
			var city = $("#city").val();
			var stateId = $("#state").val();
			var zip = $("#zip").val();
			var typeId = $("#type").val();
			
			$.ajax({
			// contentType application/json
			headers: {          
    			"Content-Type": "application/json"
    		},
			url: "http://localhost:9001/ims/insertClient.do",
			method: "POST",
			data: JSON.stringify({
				name : clientName, email : email, 
				pocName : contactName, phone : phone,
				fax : fax, line1 : adLine1, line2 : adLine2,
				id : stateId, city : city, zip: zip ,tId : typeId
			}),
			success: function(){
				alert("Added Client successfully!");
			}
		});
	});
	
});

</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Section</title>

	
	<!-- MODAL BOOTSTRAP -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<!-- BootStrap -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css">
	<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
	<!-- CSS Google Text -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet" type="text/css">
	
	<!-- Custom CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/index.css">

	
</head>
<body>

	<div class="container main .col-xs-12 .col-sm-6 .col-lg-8">

		<div class="container header .col-xs-12 .col-sm-6 .col-lg-8">
			<jsp:include page="/headerPage/header.jsp"></jsp:include>
		</div>
	
		<div class="container nav .col-xs-12 .col-sm-6 .col-lg-8">
			<jsp:include page="/navPage/nav.jsp"></jsp:include>
		</div>
		<br />
	
		<div class="container body .col-xs-12 .col-sm-6 .col-lg-8">
			<table id="personTable">
				<tr>
		    		<th>ID</th>
		    		<th>Name</th>
		    		<th>Email</th>
		    		<th>Address</th>
		    		<th>Type</th>
		    		<th>Option</th>
		  		</tr>
		 		 <c:forEach var="c" items="${clients}">
		  		<tr>
		  			<td><c:out value="${c.id}"></c:out></td>
		  			<td><c:out value="${c.name}"></c:out></td>
		  			<td><c:out value="${c.email}"></c:out></td>
		  			<td><c:out value="${c.address.city}, ${c.address.state.name}"></c:out></td>
		  			<td>
		  				<c:if test="${c.clientType.id == 1}"><c:out value="Supplier"></c:out></c:if>
		  				<c:if test="${c.clientType.id == 2}"><c:out value="Retailer"></c:out></c:if>
		  			</td>
		  			<td><input type="button" value="Edit!"></td> <!-- Need to make this...Ajax-y... -->
		  		</tr>
		  		</c:forEach>
			</table>
		</div>
		<br/>
		
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#clientModal">Add Client</button>
		<br />	
		<br />
			<div class="container footer .col-xs-12 .col-sm-6 .col-lg-8">
				<jsp:include page="/footerPage/footer.jsp"></jsp:include>
			</div>
		<br />
		</div>
		<br />
		
			
	
	
	<!-- Modal -->
	<div id="clientModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Add a Client</h4>
	      </div>
	      <div class="modal-body">
	      <table id="modal-table">
	        <tr>
	        	<td>Client:</td>
	        	<td><input id="clientName" type="text" class="form-control"></td>
	        	
	        </tr>
	        <tr>
	        	<td>Email:</td>
	        	<td><input id="email" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>Contact Name:</td>
	        	<td><input id="contactName" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>Phone:</td>
	        	<td><input id="phone" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>Fax:</td>
	        	<td><input id="fax" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>Address Line 1:</td>
	        	<td><input id="adLine1" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>Address Line 2:</td>
	        	<td><input id="adLine2" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>City:</td>
	        	<td><input type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>State:</td>
	        	<td>
	        		<select name="state" id="state" class="form-control">
	        			<option selected disabled>Select a State</option>
	        			<c:forEach var="s" items="${states}">
	        			<option id="${s.id}" value="${s.id}"><c:out value="${s.name}"></c:out></option>
	        			</c:forEach>
	        		</select>
	        	</td>
	        </tr>
	        <tr>
	        	<td>Zip:</td>
	        	<td><input id="zip" type="text" class="form-control"></td>
	        </tr>
	        <tr>
	        	<td>Type:</td>
	        	<td>
					<select name="type" id="type" class="form-control">
						<option selected disabled>Select Client Type</option>
						<c:forEach var="t" items="${clientTypes}">
						<option value="${t.id}"><c:out value="${t.clientList}"></c:out></option>
						</c:forEach>
					</select>
				</td>
	        </tr>
	        </table>
	      </div>
	    <div class="modal-footer">
        <button id="addClient" type="button" class="btn btn-primary" data-dismiss="modal">Add</button>
      	</div>
	    </div>
	  </div>
	</div>
</body>
</html>