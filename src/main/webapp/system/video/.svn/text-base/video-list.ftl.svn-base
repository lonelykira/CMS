<#assign menu="video">
<#assign submenu="video_list">
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
<script type="text/javascript" src="${basePath}/system/js/admin/videoFactory/video-list.js"></script>
	<!--main content start-->
<form id="video-list" name="video-list" action="video-list.htm" method="post">
	<section id="main-content">
		<section class="wrapper">
            <section class="panel">
            	<header class="panel-heading">
                	视频列表
                </header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
                            <table class="table table-striped table-advance table-hover">
                            	<thead>
	                            	<tr>
	            						<th align="center" style="text-align:center;" width="60px">序号</th>
	            						<th align="center" style="text-align:center;" width="150px">标题</th>
	            						<th align="center" style="text-align:center;" width="200px">图片url</th>
	            						<th align="center" style="text-align:center;" width="200px">视频url</th>
	            						<th align="center" style="text-align:center;" width="150px">简介</th>
	            						<th align="center" style="text-align:center;" width="150px">创建时间</th>
	            						<th align="center" style="text-align:center;" width="120px">操作</th>
	          						</tr>
          						</thead>
                            	<tbody role="alert" aria-live="polite" aria-relevant="all">
                            		<#if pageVo?exists && pageVo.list?size &gt; 0>
	                            		<#list pageVo.list as item>
	                            		<tr class="gradeA odd">
	                                    	<td align="center" style="text-align:center;">${item_index+1}</td>
	                                    	<td align="center" style="text-align:center;">${item.videoTitle!''}</td>
	                                    	<td align="center" style="text-align:left;">${item.frontCoverUrl!''}</td>
	                                    	<td align="center" style="text-align:left;">${item.videoUrl!''}</td>
	                                    	<td align="center" style="text-align:left;">${item.introduction!''}</td>
	                                    	<td align="center" style="text-align:center;">${item.dateFormat(item.createTime, 'yyyy-MM-dd HH:mm:ss')!''}</td>
	                                    	<td align="center" style="text-align:center;">
	                                    		<button class="btn btn-info" type="button" onclick="editVideo('${item.videoFactoryId!''}');">编辑</button>
												<button class="btn btn-info" type="button" onclick="delVideo('${item.videoFactoryId!''}');">删除</button>
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
