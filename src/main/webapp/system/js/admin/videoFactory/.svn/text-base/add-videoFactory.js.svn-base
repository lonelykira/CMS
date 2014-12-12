$(function() {
	// 保存
	$("#save-videofactory").submit(function() {
		var frontCoverUrl = $("#frontCoverUrl").val();
		var videoUrl = $("#videoUrl").val();
		var videoTitle = $("#videoTitle").val();
		var tag = $("#tag").val();
		var introduction = $("#introduction").val();
		
		if(videoTitle == '') {
			bootbox.alert("标题不能为空");
			return false;
		}
		
		if(tag == '') {
			bootbox.alert("标签不能为空");
			return false;
		}
		
		if(frontCoverUrl == '') {
			bootbox.alert("封面图片不能为空");
			return false;
		}
		
		if(videoUrl == '') {
			bootbox.alert("视频不能为空");
			return false;
		}
		
		if(introduction == '') {
			bootbox.alert("简介不能为空");
			return false;
		}
	});
});	

function getBack() {
	location.href="video-list.htm";
}