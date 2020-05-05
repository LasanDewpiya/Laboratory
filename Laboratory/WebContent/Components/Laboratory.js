$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateLabForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	var type = ($("#hidLabIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "LaboratoryAPI",
		type : type,
		data : $("#LabForm").serialize(),
		dataType : "text",
		complete : function(response, status) {
			console.log(response)
			onLabSaveComplete(response.responseText, status);
		}
	});
});

function onLabSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divLabGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidLabIDSave").val("");
	$("#Lab_Id")[0].reset();
}



// CLIENT-MODEL================================================================
function validateLabForm() {
	// Type
	if ($("#type").val().trim() == "") {
		return " Please Insert the Type";
	}

	// Lab Date
	if ($("#LabDate").val().trim() == "") {
		return "Please Insert the Lab date";
	}
	// Description
	if ($("#Desacription").val().trim() == "") {
		return "Please Insert the Description";
	}
	// Hospital ID
	if ($("#hospitalId").val().trim() == "") {
		return "Please insert the Hospital Id";
	}

	// Patient ID
	if ($("#patientId").val().trim() == "") {
		return "Please insert the Patient Id.";
	}
	
	return true;
}

// UPDATE==========================================
	$(document).on("click", ".btnUpdate", function(event)
			{
				$("#hidLabIDSave").val($(this).closest("tr").find('#hidLabIDSave').val());
				$("#type").val($(this).closest("tr").find('td:eq(0)').text());
				$("#LabDate").val($(this).closest("tr").find('td:eq(1)').text());
				$("#Desacription").val($(this).closest("tr").find('td:eq(2)').text());
				$("#hospitalNmae").val($(this).closest("tr").find('td:eq(3)').text());
				$("#patientname").val($(this).closest("tr").find('td:eq(4)').text());
				
			});
	
/*	//Remove
	$(document).on("click", ".btnRemove", function(event)
			{
		
		$.ajax({
			url : "DoctorAPI",
			type : type,
			data : $("#doctorFome").serialize(),
			dataType : "text",
			complete : function(response, status) {
				console.log(response)
				onDoctorDeleteComplete(response.responseText, status);
			}
		
		});
	});

	
		function onDoctorDeleteComplete(response, status)
		{
			if (status == "success")
		{
				var resultSet = JSON.parse(response);
				if (resultSet.status.trim() == "success")
		{
				$("#alertSuccess").text("Successfully deleted.");
				$("#alertSuccess").show();
				$("#hidDoctorIDSave").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
				$("#alertError").text(resultSet.data);
				$("#alertError").show();
		}
		}
		else if (status == "error")
		{
			$("#alertError").text("Error while deleting.");
			$("#alertError").show();
		} 
		else
		{
			$("#alertError").text("Unknown error while deleting..");
			$("#alertError").show();
		}
}*/