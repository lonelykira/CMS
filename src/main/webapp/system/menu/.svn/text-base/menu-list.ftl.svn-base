<#assign menu="menu">
<#assign submenu="menu_list">
<#include "/system/head.ftl">
<style type="text/css">
.pagination {
    border-radius: 4px;
    display: inline-block;
    margin: 0;
    padding-left: 0;
}
.breadcrumb > li + li:before {
    color: #CCCCCC;
    content: "| ";
    padding: 0 5px;
}
</style>
<script type="text/javascript" src="${basePath}/system/js/admin/menu/menu-list.js"></script>
<script type="text/javascript">
	$(function() {
		<#if state?exists && state=='success'>
			bootbox.alert("保存成功");
		</#if>
	});
</script>
	<!--main content start-->
<form id="menu-list" name="menu-list" action="menu-list.htm" method="post">
	<section id="main-content">
		<section class="wrapper">
            <section class="panel">
            	<header class="panel-heading">
                	菜单列表
                </header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
                            <table class="table table-striped table-advance table-hover">
                            	<thead>
	                            	<tr>
	            						<th align="center" style="text-align:center;" width="60px">序号</th>
	            						<th align="center" style="text-align:center;" width="60px">父菜单</th>
	            						<th align="center" style="text-align:center;" width="150px">名称</th>
	            						<th align="center" style="text-align:center;" width="100px">图标名称</th>
	            						<th align="center" style="text-align:center;" width="200px">url</th>
	            						<th align="center" style="text-align:center;" width="60px">顺序</th>
	            						<th align="center" style="text-align:center;" width="60px">状态</th>
	            						<th align="center" style="text-align:center;" width="150px">创建时间</th>
	            						<th align="center" style="text-align:center;" width="200px">操作</th>
	          						</tr>
          						</thead>
                            	<tbody role="alert" aria-live="polite" aria-relevant="all">
                            		<#if pageVo?exists && pageVo.list?size &gt; 0>
	                            		<#list pageVo.list as item>
	                            		<tr class="gradeA odd">
	                                    	<td align="center" style="text-align:center;">${item_index+1}</td>
	                                    	<td align="center" style="text-align:center;">${item.parentId!''}</td>
	                                    	<td align="center" style="text-align:center;">${item.name!''}</td>
	                                    	<td align="center" style="text-align:left;">${item.icon!''}</td>
	                                    	<td align="center" style="text-align:left;">${item.url!''}</td>
	                                    	<td align="center" style="text-align:center;">${item.sortNumber!''}</td>
	                                    	<td align="center" style="text-align:center;">
	                                    		<#if item.status?exists && item.status == 1>
	                                    			启动
	                                    		<#else>
	                                    			停用
	                                    		</#if>
	                                    	</td>
	                                    	<td align="center" style="text-align:center;">${item.dateFormat(item.createTime, 'yyyy-MM-dd HH:mm:ss')!''}</td>
	                                    	<td align="center" style="text-align:center;">
	                                    		<button class="btn btn-info" type="button" onclick="editMenu('${item.menuId!''}');">编辑</button>
												<button class="btn btn-info" type="button" onclick="delMenu('${item.menuId!''}');">删除</button>
	                                    	</td>
	                                	</tr>
	                                	</#list>
                                	<#else>
                                		<tbody>
		                                	<tr>
		                                		<td colspan="7" align="center" style="text-align:center;">
		                                			<span>暂无数据</span>
		                                		</td>
		                                	</tr>
	                                	</tbody>
	                                </#if>	
                               	</tbody>
                              </table>
                              <div style="height: 30px;">
                              	<div class="pagination">${pageVo.pageNumHtml}</div>
                              </div>
                           </div>
                        </div>
                  </div>
              </section>
              <!-- page end-->
          </section>
		</section>
</form>
		<!--main content end-->
<#include "/system/foot.ftl">
