function editVideo(videoFactoryId) {
	location.href="add-video.htm?videoFactoryId="+videoFactoryId;
}

function delVideo(videoFactoryId) {
	bootbox.confirm("确定删除？", function(result) {
		if(result) {
			$.ajax( {
	            url : "del-videoFactory.json",
	            dataType : "json", 
	            type : "post", 
	            data : {"videoFactoryId":videoFactoryId},
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