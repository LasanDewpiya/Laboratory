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
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Doctor Details</h1>
				<form id="D_Id" name="doctorId">
					
					Type: <input id="type" name="type" type="text"
						class="form-control form-control-sm"> <br> 
						
					Labdate:<input id="date" name="date" type="text"
						class="form-control form-control-sm"> <br>
					
				
					Description: <input id="des" name="des" type="text"
						class="form-control form-control-sm"> <br> 
						
					HospitalID: <input id="hid" name="hid" type="text"
						class="form-control form-control-sm"> <br> 
						
					PatientID: <input id="pid" name="pid" type="text"
						class="form-control form-control-sm"> <br> 
						
			
						
				
						 <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidItemIDSave" name="hidItemIDSave" value="">
						
				</form>
				
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
			<br>
				<div id="divItemsGrid">
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