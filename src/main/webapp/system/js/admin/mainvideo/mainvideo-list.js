function editMainVideo(mid) {
	location.href="add-mainvideo.htm?mid="+mid;
}

function delMainVideo(mid) {
	bootbox.confirm("确定删除？", function(result) {
		if(result) {
			$.ajax( {
	            url : "del-mainvideo.json",
	            dataType : "json", 
	            type : "post", 
	            data : {"mid":mid},
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

function updateStatus(mid, status) {
	var info = '';
	if(status == '-1') {
		info = '启用';
	} else {
		info = '停用';
	}
	bootbox.confirm("确定"+info+"？", function(result) {
		if(result) {
			$.ajax( {
	            url : "update-status.json",
	            dataType : "json", 
	            type : "post", 
	            data : {"mid":mid, "status":status},
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