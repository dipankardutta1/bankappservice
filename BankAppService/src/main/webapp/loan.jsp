<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>






<style type="text/css">

$(document).ready(function(){
 
 
 	 $( "#loanSanctionDate" ).datepicker(
 	 	{ dateFormat: 'dd/mm/yy' }
 	 );
 
 
});

</style>



<style type="text/css">

#container{

	padding: 25px;

}
.


</style>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>


<div id="container">

	<div class="panel panel-primary">
	  <div class="panel-heading">
	    <h3 class="panel-title">Loan Entry</h3>
	  </div>
	  <div class="panel-body">
	  
	  	
	  	
	  	<s:form action="processLoan" method="post" modelAttribute="loanDto">
	  	
	  		<s:hidden path="id" id="id"/>
	  	
		  <div class="form-group">
		    <label for="loanAmount">Loan Amount:</label>
		    
		    <s:input path="loanAmount" cssClass="form-control" id="loanAmount" />
		    
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="loanSanctionDate">Loan Sanction Date:</label>
		    <s:input path="loanSanctionDate" cssClass="form-control" id="loanSanctionDate" readonly="true" />
		  </div>
		 
		 <div class="form-group">
		    <label for="loanReason">Loan Reason:</label>
		     <s:input path="loanReason" cssClass="form-control" id="loanReason" />
		  </div>
		  <button type="submit" class="btn btn-default">Submit</button>
		  
		</s:form>
	  
	  </div>
	</div>


	<div class="panel panel-primary">
	  <div class="panel-heading">
	    <h3 class="panel-title">Loan Details</h3>
	  </div>
	  <div class="panel-body">
	  
	  	<table class="table">
	  		<thead>
	  			<tr>
	  				<th>ID</th>
	  				<th>Loan Amount</th>
	  				<th>Loan Sanction Date</th>
	  				<th>Loan Reason</th>
	  				<th>Action</th>
	  			</tr>
	  		</thead>
	  		
	  		<tbody>
	  			
	  			
	  			<c:forEach items="${loans}" var="row" varStatus="status">
	  				
	  				<tr>
	  					<td> ${status.count}  </td>
	  					<td> ${row.loanAmount} </td>
	  					<td> ${row.loanSanctionDate} </td>
	  					<td> ${row.loanReason} </td> 
	  					<td> <a href="editLoan?id=${row.id}">Edit</a> / <a href="deleteLoan?id=${row.id}">Delete</a>  </td>
	  				</tr>
	  			
	  			</c:forEach>
	  		
	  		
	  		
	  			
	  		</tbody>
	  		
	  		
	  	</table>
	  
	  
	  
	    
	  </div>
	</div>

</div>


</body>
</html>