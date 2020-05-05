<%@page import="model.Laboratory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Laboratory</title>
<script src="Components/jquery-3.5.0.min.js"></script>
<link href="Views/css/bootstrap.min.css" rel="stylesheet">
<link href="Views/css/style.css" rel="stylesheet">
<script src="Components/Laboratory.js"></script>
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Laboratory Details</h1>
				<form id="LabForm" name="labForm">
					
					Type: <input id="type" name="Lab_type" type="text"
						class="form-control form-control-sm"> <br> 
						
					Labdate:<input id="LabDate" name="Lab_date" type="date"
						class="form-control form-control-sm"> <br>
					
				
					Description: <input id="Desacription" name="Des" type="text"
						class="form-control form-control-sm"> <br> 
						
					HospitalID: <input id="hospitalId" name="HospitalId" type="text"
						class="form-control form-control-sm"> <br> 
						
					PatientID: <input id="patientId" name="PatientId" type="text"
						class="form-control form-control-sm"> <br> 
						
			
						
				
						 <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidLabIDSave" name="hidLabIDSave" value="">
						
				</form>
				
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
			<br>
				<div id="divLabGrid">
					 <%
					 Laboratory LabObj = new Laboratory();
 					 out.print(LabObj.ViewLabDetails());
 					  %>
					</div>


			</div>
		</div>
	</div>
</body>
</html>