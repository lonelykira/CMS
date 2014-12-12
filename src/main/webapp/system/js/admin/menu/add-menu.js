function getBack() {
	location.href="menu-list.htm";
}

$(function() {
	$("#save-menu").submit(function() {
		var name = $("#name").val();
		var bindmenu = $("#bindmenu").val();
		var url = $("#url").val();
		var sortNumber = $("#sortNumber").val();
		if(name == '') {
			bootbox.alert("菜单名称不能为空");
			return false;
		}
		if(bindmenu == '') {
			bootbox.alert("绑定菜单不能为空");
			return false;
		}
		if(url == '') {
			bootbox.alert("链接不能为空");
			return false;
		}
		if(sortNumber == '') {
			bootbox.alert("排序不能为空");
			return false;
		}
	});
});	
