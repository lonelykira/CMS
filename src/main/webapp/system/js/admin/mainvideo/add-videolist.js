// 重新排序
function resetSort() {
	var trs = $("#videosTbody").find("tr");
	if(trs.length > 1) {
		trs.each(function(i, e) {
			$(e).find("td").eq(0).text(i+1);
		});
	}
}

// 删除一行
function delRow(node) {
	$(node).parent().parent().remove();
	resetSort();
}

// 更新状态
function updateStatus(node, status) {
	var tr = $(node).parent().parent();
	var td = tr.find("td").eq(5); // 状态隐藏域
	td.find("input[type='hidden']").eq(0).val(status);
	var temp = "";
	if(status == '0') {
		td.find("p").eq(0).text("停用");
		$(node).text("启用");
		temp = "1";
	} else {
		td.find("p").eq(0).text("启用");
		$(node).text("停用");
		temp = "0";
	}
	$(node).attr("onclick", "updateStatus(this,"+temp+")");
}

function saveVideo() {
	var trs = $("#videosTbody").find("tr");
	if(trs.length > 1) {
		var flag = true;
		trs.each(function(i, e) {
			var input = $(e).find("td").eq(1).find("input[type='text']").eq(0);
			if(input.val() == "") {
				bootbox.alert("标题不能为空");
				input.focus();
				flag = false;
				return false;
			}
		});
		if(flag) {
			var videos=[];
			var mid = $("#mid").val();
			trs.each(function(i, e) {
				var title = $(e).find("td").eq(1).find("input[type='text']").eq(0).val();
				var videourl = $(e).find("td").eq(2).find("input[type='hidden']").eq(0).val();
				var imageurl = $(e).find("td").eq(3).find("input[type='hidden']").eq(0).val();
				var introduction = $(e).find("td").eq(4).find("text").eq(0).text();
				var status = $(e).find("td").eq(5).find("input[type='hidden']").eq(0).val();
				var video = {
						"mid"			:		mid,
						"title"			:		title,
						"videourl"		:		videourl,
						"imageurl"		:		imageurl,
						"introduction"	:		introduction,
						"status"		:		status
				};
				videos.push(video);
			});
			var videosJson = "[" + videos + "]";
			$("#videosJson").val(videosJson);
		}
	} else {
		bootbox.alert("请添加视频");
		return;
	}
}
$(function() {
	$("#save-videolist").submit(function() {
		var trs = $("#videosTbody").find("tr");
		if(trs.length > 0) {
			var flag = true;
			trs.each(function(i, e) {
				var input = $(e).find("td").eq(1).find("input[type='text']").eq(0);
				if(input.val() == "") {
					bootbox.alert("标题不能为空");
					input.focus();
					flag = false;
					return false;
				}
			});
			if(flag) {
				var videos=[];
				var mid = $("#mid").val();
				trs.each(function(i, e) {
					var title = $(e).find("td").eq(1).find("input[type='text']").eq(0).val();
					var videourl = $(e).find("td").eq(2).find("input[type='hidden']").eq(0).val();
					var imageurl = $(e).find("td").eq(3).find("input[type='hidden']").eq(0).val();
					var introduction = $(e).find("td").eq(4).find("textarea").eq(0).val();
					var status = $(e).find("td").eq(5).find("input[type='hidden']").eq(0).val();
					var video = {
							"mid"			:		mid,
							"title"			:		title,
							"videourl"		:		videourl,
							"imageurl"		:		imageurl,
							"introduction"	:		introduction,
							"status"		:		status
					};
					videos.push(video);
				});
				var videosJson = JSON.stringify(videos);
				$("#videosJson").val(videosJson);
			} else {
				return false;
			}
		} else {
			bootbox.alert("请添加视频");
			return false;
		}
	});
});	