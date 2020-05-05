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


//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
		{
			$("#hidLabIDSave").val($(this).closest("tr").find('#hidLabIDSave').val());
			$("#type").val($(this).closest("tr").find('td:eq(1)').text());
			$("#LabDate").val($(this).closest("tr").find('td:eq(2)').text());
			$("#Desacription").val($(this).closest("tr").find('td:eq(3)').text());
			$("#hospitalNmae").val($(this).closest("tr").find('td:eq(4)').text());
			$("#patientname").val($(this).closest("tr").find('td:eq(5)').text());
			
		});
//Remove
$(document).on("click", ".btnRemove", function(event)
		{
		 	$.ajax(
		{
			url : "LaboratoryAPI",
			type : "DELETE",
			data : "Lab_Id=" + $(this).val(),
			dataType : "text",
			complete : function(response, status)
			{
				onLabDeleteComplete(response.responseText, status);
			}
		 });
		});


	function onLabDeleteComplete(response, status)
	{
		if (status == "success")
	{
			var resultSet = JSON.parse(response);
			if (resultSet.status.trim() == "success")
	{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divLabGrid").html(resultSet.data);
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
}