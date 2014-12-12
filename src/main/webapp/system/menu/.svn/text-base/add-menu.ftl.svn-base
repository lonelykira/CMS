<#assign menu="menu">
<#assign submenu="add_menu">
<#include "/system/head.ftl">
<script type="text/javascript" src="${basePath}/system/js/admin/menu/add-menu.js"></script>
<script type="text/javascript">
	$(function() {
		<#if state?exists && state=='success'>
			bootbox.alert("保存成功");
		</#if>
	});
</script>
<script>
</script>
<!--main content start-->
<form name="save-menu" id="save-menu" action="save-menu.htm" method="post">
	<input name="menuId" id="menuId" value="${rootmenu.menuId!''}">
	<input name="statu" id="statu" value="${rootmenu.statu!''}">
	<input name="createUser" id="createUser" value="${rootmenu.createUser!''}">
	<input name="createTime" id="createTime" value="${rootmenu.dateFormat(rootmenu.createTime, 'yyyy-MM-dd HH:mm:ss')}">
	<input name="updateUser" id="updateUser" value="${rootmenu.updateUser!''}">
	<input name="updateTime" id="updateTime" value="${rootmenu.dateFormat(rootmenu.updateTime, 'yyyy-MM-dd HH:mm:ss')}">
	<section id="main-content">
		<section class="wrapper">
			<!-- page start-->
			<div class="row">
				<div class="col-lg-7" align="center">
					<div class="span12" align="center">
						<#if rootmenu.menuId?exists>
							编辑菜单
						<#else>	
							添加菜单
						</#if>	
					</div>
					<div class="input-group input-group-sm">
				    	<span class="input-group-addon">&emsp;父菜单</span>
				       	<select name="parentId" class="form-control" style="width:150px;">
							<option value="">请选择</option>
							<#if parentmenus?exists && parentmenus?size &gt; 0>
								<#list parentmenus as item>
									<option value="${item.menuId}" <#if rootmenu.parentId?exists && rootmenu.parentId==item.menuId?string>selected="selected"</#if>>${item.name!''}</option>
								</#list>
							</#if>
						</select>
				    </div>
				    <br>
				    <div class="input-group input-group-sm">
				    	<span class="input-group-addon">菜单名称</span>
				       	<input type="text" class="form-control" id="name" name="name" value="${rootmenu.name!''}" placeholder="菜单名称">
				    </div>
				    <br>
				    <div class="input-group input-group-sm">
				    	<span class="input-group-addon">绑定菜单</span>
				       	<input type="text" class="form-control" id="bindmenu" name="bindmenu" value="${rootmenu.bindmenu!''}" placeholder="绑定菜单">
				    </div>
				    <br>
				    <div class="input-group input-group-sm">
				    	<span class="input-group-addon">&emsp;&emsp;链接</span>
				       	<input type="text" class="form-control" id="url" name="url" value="${rootmenu.url!''}" placeholder="链接">
				    </div>
				    <br>
				    <div class="input-group input-group-sm">
				    	<span class="input-group-addon">&emsp;&emsp;图标</span>
				       	<input type="text" class="form-control" id="icon" name="icon" value="${rootmenu.icon!''}" placeholder="icon">
				    </div>
				    <br>
				    <div class="input-group input-group-sm">
				    	<span class="input-group-addon">&emsp;&emsp;排序</span>
				       	<input type="text" class="form-control" id="sortNumber" name="sortNumber" value="${rootmenu.sortNumber!''}" placeholder="排序">
				    </div>
				    <br>
					<div class="form-group" align="center">
						<button class="btn btn-info" type="submit">保存</button>
						<button class="btn btn-info" type="button" onclick="getBack();">返回</button>
					</div>
					</div>
			</div>
			<!-- page end-->
		</section>
	</section>
</form>
<!--main content end-->
<#include "/system/foot.ftl">
