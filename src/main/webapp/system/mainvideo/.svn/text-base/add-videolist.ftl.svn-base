<#assign menu="video">
<#assign submenu="add_video">
<#include "/system/head.ftl">
<link type="text/css" rel="stylesheet" href="${basePath}/system/js/videojs/video.css" >
<script type="text/javascript" src="${basePath}/system/js/videojs/video.dev.js"></script>
<script type="text/javascript" src="${basePath}/system/js/videojs/html5media.min.js"></script>
<script type="text/javascript" src="${basePath}/system/js/admin/mainvideo/add-videolist.js"></script>
<script>
</script>
<!--main content start-->
<form name="save-videolist" id="save-videolist" action="save-videolist.htm" method="post">
	<input type="hidden" id="mid" name="mid" value="${mainVideo.mid!''}">
	<input type="hidden" id="videosJson" name="videosJson" value="">
	<section id="main-content">
		<section class="wrapper">
			<!-- page start-->
			<div class="container-fluid">
				<div class="col-lg-12" align="center">
					<div class="span12" align="center">
						视频管理
					</div>
					<div class="row">
						<div class="col-lg-4 text-right">
							<img src="${basePath}/${mainVideo.imageurl!''}" width="180px" height="240px" alt="简介图片">
						</div>
						<div class="col-lg-6 text-left">
							<div class="col-lg-12" >
								<h3>${mainVideo.title!''}</h3>
							</div>
							<div class="col-lg-12" >
								年份：${mainVideo.year!''}
							</div>
							<div class="col-lg-12" >
								类型：${mainVideo.type!''}
							</div>
							<div class="col-lg-12" >
								简介：${mainVideo.introduction!''}
							</div>
						</div>
					</div>
				    <br>
				    <div class="row">
				    	<div class="col-lg-10">
							<section class="panel">
								<div class="panel-body" align="left">
			                      	<span>视频</span>
			                 	</div>
			                  	<div class="panel-body">
			                  	  	<button id="video_upload" class="btn btn-shadow btn-info" type="button">
			                  	  		<i class="icon-cloud-upload"></i>添加附件
			                  	  	</button>
			                  	</div>
				            </section>
			            </div>
		            </div>
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span12">
								<table class="table">
									<thead>
										<tr>
											<th>序号</th>
											<th>标题	</th>
											<th>视频	</th>
											<th>封面图片</th>
											<th>简介</th>
											<th>状态	</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="videosTbody">
										<#if videoList?exists && videoList?size &gt; 0>
											<#list videoList as item>
												<tr>
													<td>${item_index + 1}</td>
													<td><input type="text" value="${item.title!''}" style="width:80px;"></td>
													<td>
														<video class="video-js vjs-default-skin" controls preload="auto" width="160px" height="100px" poster="${item.imageurl!''}" data-setup="{}">
															<source src="${basePath}${item.videourl!''}" type="video/mp4" />
															<source src="${basePath}${item.videourl!''}" type="video/webm" />
															<source src="${basePath}${item.videourl!''}" type="video/ogg" />
													  	</video> 
													  	<input type="hidden" value="${item.videourl!''}">
													</td>
													<td>
														<img src="${basePath}${item.imageurl!''}" width="160px" height="100px" alt="缩略图">
														<input type="hidden" value="${item.imageurl!''}">
													</td>
													<td>
														<textarea rows="2" class="form-control" maxlength="300">${item.introduction!''}</textarea>
													</td>
													<td>
														<#if item.status?exists && item.status == '1'>
															<p>启用</p><input type="hidden" value="1">
														<#else>
															<p>停用</p><input type="hidden" value="0">
														</#if>
													</td>
													<td>
														<#if item.status?exists && item.status == '1'>
															<button class="btn btn-info" type="button" onclick="updateStatus(this,'0')">停用</button>&nbsp;
														<#else>
															<button class="btn btn-info" type="button" onclick="updateStatus(this,'1')">启用</button>&nbsp;
														</#if>
														<button class="btn btn-info" type="button" onclick="delRow(this);">删除</button>
													</td>
												<tr>	
											</#list>
										</#if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
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
<script type="text/javascript">
	$(function() {
		<#if state?exists && state=='success'>
			bootbox.alert("保存成功");
		</#if>
		
		//上传视频
		$('#video_upload').uploadify({
			'buttonText'  		: 	'请选择视频',
	        'swf'         		: 	'${basePath}/system/assets/uploadify/uploadify.swf',
	        'uploader'    		: 	'${basePath}/admin/attachment/save-video.json;jsessinid=${JSESSIONID}?sid=${JSESSIONID}',
	        'fileObjName'		: 	'file',
	        'fileTypeExts' 		: 	'*.mp4; *.swf; *.flv; *.avi',
	        'method'			:	'post',
	        'onQueueComplete' 	: 	function(file, data, response) {
	        		  
	        },
	        'onUploadSuccess'	:	function(file,data,response){
	        	var data = eval('('+data+')')
	            if(data.success) {
        			var tr = "<tr>";
        			tr += "<td>1</td>";
        			tr += "<td><input type=\"text\" style=\"width:80px;\"></td>";
        			tr += "<td><video class=\"video-js vjs-default-skin\" controls preload=\"auto\" width=\"160px\" height=\"100px\" poster=\"\" data-setup=\"{}\">";
					tr += "<source src=\"${basePath}/"+data.uploadPath+"\" type=\"video/mp4\" />";
					tr += "<source src=\"${basePath}/"+data.uploadPath+"\" type=\"video/webm\" />";
					tr += "<source src=\"${basePath}/"+data.uploadPath+"\" type=\"video/ogg\" />";
				  	tr += "</video> <input type=\"hidden\" value=\""+data.uploadPath+"\"></td>";
        			tr += "<td><img src=\"${basePath}/upload/picture/20141212/1418387736511.jpg\" width=\"160px\" height=\"100px\" alt=\"缩略图\"><input type=\"hidden\" value=\""+data.uploadPath+"\"></td>";
        			tr += "<td><textarea rows=\"2\" class=\"form-control\" maxlength=\"300\"></textarea></td>";
        			tr += "<td><p>启用</p><input type=\"hidden\" value=\"1\"></td>";
        			tr += "<td><button class=\"btn btn-info\" type=\"button\" onclick=\"updateStatus(this,'0')\">停用</button>&nbsp;<button class=\"btn btn-info\" type=\"button\" onclick=\"delRow(this);\">删除</button></td>";
        			tr += "</tr>";
					$("#videosTbody").append(tr);
					resetSort();
				}
	        },
	        'onError'          :   function(file) {
	        	bootbox.alert("上传失败");
	        }   
		});
	
	});
</script>
<#include "/system/foot.ftl">
