function editMenu(menuId) {
	location.href="add-menu.htm?menuId="+menuId;
}

function delMenu(menuId) {
	bootbox.confirm("确定删除？", function(result) {
		if(result) {
			$.ajax( {
	            url : "del-menu.json",
	            dataType : "json", 
	            type : "post", 
	            data : {"menuId":menuId},
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