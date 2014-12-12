function treeClick(node) {
	var parentId = $(node).attr("parentId");
	var value = $(node).val();
	var checked = $(node).is(":checked");
	if(parentId != '') { //子节点
		var parentNode = $("#menuTree").find("input[value='"+parentId+"']");
		if(checked) {
			parentNode.attr("checked", true);
		} else {
			var length = $("#menuTree").find("input[type='checkbox'][parentId='"+parentId+"']:checked").length;
			if(length == 0) {
				parentNode.attr("checked", false);
			}
		} 
	} else { // 父节点
		var parentNode = $("#menuTree").find("input[type='checkbox'][parentId='"+value+"']");
		if(checked) {
			parentNode.each(function(i,e) {
				$(e).attr("checked", true);
			});
		} else {
			parentNode.each(function(i,e) {
				$(e).attr("checked", false);
			});
		}
	}
}

function getBack() {
	location.href="role-list.htm";
}

$(function() {
	$("#save-role").submit(function() {
		var checkeds = $("#menuTree").find("input[type='checkbox']:checked");
		if(checkeds.length != 0) {
			var permission = "";
			checkeds.each(function(i,e) {
				if(i != checkeds.length-1) {
					permission += $(e).val()+",";
				} else {
					permission += $(e).val();
				}
			});
			$("#permission").val(permission);
		}
		var role = $("#role").val();
		var permission = $("#permission").val();
		if(role == '') {
			bootbox.alert("角色名称不能为空");
			return false;
		}
		if(permission == '') {
			bootbox.alert("请选择权限");
			return false;
		}
	});
});	
