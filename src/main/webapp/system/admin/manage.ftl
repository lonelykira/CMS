<#assign menu="system">
<#assign submenu="admin_list">
<#include "/system/head.ftl">		
<style type="text/css">
.pagination {
	border-radius: 4px;
	display: inline-block;
	margin: 0;
	padding-left: 0;
}
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<div class="row">
			<div class="col-lg-12">
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a href="http://localhost:8080/byvision/admin/folder/page.htm?folderId=0"><i
							class="icon-home"></i>管理员管理</a></li> 				</ul>
				<!--breadcrumbs end -->
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-4">
				<section class="panel">
					<header class="panel-heading"> 添加管理员 </header>
					<div class="panel-body">
						 <form id="add_admin_form" method="post" class="form-horizontal" autocomplete="off" action="${basePath}/admin/admin/addNew.json">
							<fieldset>
                                  <div class="input-group input-group-sm">
							    	<span class="input-group-addon">名称</span>
							       	<input type="text" class="form-control" name="adminName" id="adminName" placeholder="管理员名称">
							      </div><br>
                                  <div class="input-group input-group-sm">
							    	<span class="input-group-addon">邮箱</span>
							       	<input type="text" class="form-control" name="email" id="email" placeholder="管理员邮箱">
							      </div><br>
                                  <div class="input-group input-group-sm">
							    	<span class="input-group-addon">密码</span>
							       	<input type="text" class="form-control" name="password" id="password" placeholder="管理员密码">
							      </div><br>
                                  <div class="input-group input-group-sm">
								    	<span class="input-group-addon">角色</span>
								    	<input type="hidden" name="role" id="role">
								       	<select name="roleId" id="roleId" class="form-control" onchange="selChange();">
                                      		<option value="">请选择</option>
                                      	<#if roles?exists && roles?size &gt; 0>
	                                      	<#list roles as item>
	                                      		<option value="${item.roleId!''}">${item.role!''}</option>
	                                      	</#list>
                                      	</#if>
                                      </select>
								  </div><br>
                                  <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label"></label>
                                      <button class="btn btn-danger" type="submit">增加</button>
                                      <button class="btn btn-danger" type="reset">重置</button>
                                  </div>		
							</fieldset>
						</form>
					</div>
				</section>
			</div>
			<div class="col-lg-8">
				<section class="panel">
					<header class="panel-heading"> 所有管理员列表 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
		                        	<thead>
			                          	<tr>
				                            <th>管理员名称</th>
				                            <th>电子邮箱</th>
				                            <th>状态</th>
				                            <th>角色</th>
				                            <th>操作</th>
			                          	</tr>
		                            </thead>
		                            <tbody role="alert" aria-live="polite" aria-relevant="all">
		                            	<#list pageVo.list as e>
		                                	<tr class="gradeA odd">
			                                  	<td>${e.name}</td>
			                                  	<td>${e.email}</td>
			                                  	<td>${e.status}</td>
			                                  	<td>${e.role!''}</td>
			                                  	<td><button class="btn btn-danger" type="button" onclick="delUser('${e.adminId}');">删除</button></td>
		                                  	</tr>
		                                </#list>
		                            </tbody>
		                         </table>
                              	 <div style="height: 30px;">
                              	 	<div class="pagination">${pageVo.pageNumHtml}</div>
                              	 </div>
                           </div>
						</div>
					</div>
				</section>
			</div>
			<!-- page end-->
	</section>
</section>
		<!--main content end-->
<script type="text/javascript">
	$(function() {
		$('#add_admin_form').ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					bootbox.alert(data.msg);
					return;
				}
			}
		});
	});
</script>
<script type="text/javascript">
	function delUser(adminId) {
		bootbox.confirm("确定删除？", function(result) {
			if(result) {
				$.ajax( {
		            url : "${basePath}/admin/admin/delete.json",
		            dataType : "json", 
		            type : "post", 
		            data : {"adminId":adminId},
		            success : function(data) { 
		                if(data.result) {
		                	bootbox.alert("删除成功", function() {
								window.location.reload();
							});             
		                } else {
		                	bootbox.alert(data.errors);
		                }
		            },
		            error : function(msg) { 
		                alert("error");
		            }
	        	});
			}
		});
	}	
	
	function selChange() {
		var role = $("#roleId").find("option:selected").text().trim();
		$("#role").val(role);
	}
</script>
<#include "/system/foot.ftl">
