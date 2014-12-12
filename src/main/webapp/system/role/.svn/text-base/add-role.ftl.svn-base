<#assign menu="role">
<#assign submenu="add_role">
<#include "/system/head.ftl">
<script type="text/javascript" src="${basePath}/system/js/admin/role/add-role.js"></script>
<!--main content start-->
<form name="save-role" id="save-role" action="save-role.htm" method="post">
	<input name="roleId" id="roleId" value="${role.roleId!''}">
	<input name="permission" id="permission" value="${role.permission!''}">
	<input name="createUser" id="createUser" value="${role.createUser!''}">
	<input name="createTime" id="createTime" value="${role.dateFormat(role.createTime, 'yyyy-MM-dd HH:mm:ss')}">
	<input name="updateUser" id="updateUser" value="${role.updateUser!''}">
	<input name="updateTime" id="updateTime" value="${role.dateFormat(role.updateTime, 'yyyy-MM-dd HH:mm:ss')}">
	<section id="main-content">
		<section class="wrapper">
			<!-- page start-->
			<div class="row">
				<div class="col-lg-7" align="center">
					<div class="span12" align="center">
						<#if role.roleId?exists>
							编辑角色
						<#else>	
							添加角色
						</#if>	
					</div>
				    <div class="input-group input-group-sm">
				    	<span class="input-group-addon">角色名称</span>
				       	<input type="text" class="form-control" id="role" name="role" value="${role.role!''}" placeholder="角色名称">
				    </div>
				    <br>
				    <section class="panel textarea.input-sm">
				    	权限
				    	<div class="panel-body text-left" id="menuTree">
					    	<#if menus?exists && menus?size &gt; 0>
					    		<#list menus as item>
					    			<br>
					    			<input type="checkbox" parentId="${item.parentId!''}" value="${item.menuId!''}" 
					    				onclick="treeClick(this);" <#if role.permission?exists && role.permission?index_of(item.menuId?string)!= -1>checked="checked"</#if>>${item.name!''}
					    			<#if item.childs?exists && item.childs?size &gt; 0>
					    				<#list item.childs as childmenu>
					    					<br>
					    					&emsp;&emsp;<input type="checkbox" parentId="${childmenu.parentId!''}" value="${childmenu.menuId!''}" 
					    									onclick="treeClick(this);" <#if role.permission?exists && role.permission?index_of(childmenu.menuId?string)!= -1>checked="checked"</#if>>${childmenu.name!''}
					    				</#list>
					    			</#if>
					    		</#list>
					    	</#if>
						</div>
					</section>	
				    <br>
					<div class="form-group" align="center">
						<button class="btn btn-info" id="submitBtn" type="submit">保存</button>
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
