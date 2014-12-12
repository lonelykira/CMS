function editRole(roleId) {
	location.href="add-role.htm?roleId="+roleId;
}

function delRole(roleId) {
	bootbox.confirm("确定删除？", function(result) {
		if(result) {
			$.ajax( {
	            url : "del-role.json",
	            dataType : "json", 
	            type : "post", 
	            data : {"roleId":roleId},
	            success : function(data) { 
	                if(data.success) {
	                	bootbox.alert("删除成功", function() {
							window.location.reload();
						});             
	                } else {
	                	bootbox.alert("删除失败");
	                }
	            },
	            error : function(msg) { 
	                alert("error");
	            }
        	});
		}
	});
}