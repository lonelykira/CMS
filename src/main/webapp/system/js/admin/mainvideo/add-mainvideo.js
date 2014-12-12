$(function() {
	// 保存
	$("#save-mainvideo").submit(function() {
		var title = $("#title").val();
		var imageurl = $("#imageurl").val();
		var type = $("#type").val();
		var year = $("#year").val();
		var language = $("#language").val();
		var introduction = $("#introduction").val();
		
		if(title == '') {
			bootbox.alert("标题不能为空");
			return false;
		}
		
		if(imageurl == '') {
			bootbox.alert("封面图片不能为空");
			return false;
		}
		
		if(type == '') {
			bootbox.alert("类型不能为空");
			return false;
		}
		
		
		if(year == '') {
			bootbox.alert("年份不能为空");
			return false;
		}
		
		if(language == '') {
			bootbox.alert("语言不能为空");
			return false;
		}
		
		if(introduction == '') {
			bootbox.alert("简介不能为空");
			return false;
		}
	});
});	

function getBack() {
	location.href="mainvideo-list.htm";
}