<#assign menu="video">
<#assign submenu="video_info">
<#include "/system/head.ftl">
<link type="text/css" rel="stylesheet" href="${basePath}/system/js/videojs/video.css" >
<script type="text/javascript" src="${basePath}/system/js/videojs/video.dev.js"></script>
<script type="text/javascript" src="${basePath}/system/js/videojs/html5media.min.js"></script>
<script type="text/javascript" src="${basePath}/system/js/admin/mainvideo/add-mainvideo.js"></script>
<script>
</script>
<!--main content start-->
<form name="save-mainvideo" id="save-mainvideo" action="save-mainvideo.htm" method="post">
	<input name="imageurl" id="imageurl" value="${mainVideo.imageurl!''}">
	<input name="mid" id="mid" value="${mainVideo.mid!''}">
	<input name="createUser" id="createUser" value="${mainVideo.createUser!''}">
	<input name="createTime" id="createTime" value="${mainVideo.dateFormat(mainVideo.createTime, 'yyyy-MM-dd HH:mm:ss')}">
	<input name="updateUser" id="updateUser" value="${mainVideo.updateUser!''}">
	<input name="updateTime" id="updateTime" value="${mainVideo.dateFormat(mainVideo.updateTime, 'yyyy-MM-dd HH:mm:ss')}">
	<section id="main-content">
		<section class="wrapper">
			<!-- page start-->
			<div class="row">
				<div class="col-lg-8" align="center">
					<div class="span12" align="center">
						视频管理
					</div>
					<div class="input-group">
				    	<span class="input-group-addon">标题</span>
				       	<input type="text" name="title" id="title" value="${mainVideo.title!''}" class="form-control" placeholder="标题">
				    </div>
				    <br>
				    <section class="span12 panel" style="height:250px;">
	                  	<div class="panel-body" align="left">
	                      	<span>封面</span>
	                      	<ul class="grid cs-style-3" id="frontImage">
	                      		<#if mainVideo.imageurl?exists && mainVideo.imageurl !=''>
	                      			<li><img src="${basePath}/${mainVideo.imageurl}" width="140px" height="80px" alt="url"></li>
	                      		</#if>
	                      	</ul>
	                 	</div>
	                  	<div class="panel-body">
	                  	  	<button id="picture_upload"  class="btn btn-shadow btn-info" type="button"><i class="icon-cloud-upload"></i>添加附件</button>
	                  	</div>
	             	</section>
	             	<div class="input-group">
				    	<span class="input-group-addon">类型</span>
				       	<input type="text" name="type" id="type" value="${mainVideo.type!''}" class="form-control" placeholder="类型">
				    </div>
				    <br>
	             	<div class="input-group">
				    	<span class="input-group-addon">年份</span>
				       	<input type="text" name="year" id="year" maxlength="4" value="${mainVideo.year!''}" class="form-control" placeholder="年份">
				    </div>
				    <br>
				    <div class="input-group">
				    	<span class="input-group-addon">语言</span>
				       	<input type="text" name="language" id="language" value="${mainVideo.language!''}" class="form-control" placeholder="语言">
				    </div>
				    <br>
					 <section class="panel">
					 	<div class="panel-body" align="left">
					 		<span>简介</span>
							<textarea rows="5" class="form-control" name="introduction" id="introduction" maxlength="300">${mainVideo.introduction!''}</textarea>
						</div>
					</section>
					<div class="form-group" align="center">
						<button class="btn btn-info" type="submit">继续添加视频</button>
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
	
		//上传图片
		$('#picture_upload').uploadify({
			'buttonText'  		: 	'请选择图片',
	        'swf'         		: 	'${basePath}/system/assets/uploadify/uploadify.swf',
	        'uploader'    		: 	'${basePath}/admin/attachment/save-picture.json;jsessinid=${JSESSIONID}?sid=${JSESSIONID}',
	        'fileObjName'		: 	'file',
	        'fileTypeExts' 		: 	'*.jpg; *.png; *.gif',
	        'method'			:	'post',
	        'onQueueComplete' 	: 	function(file, data, response) {
	    		
	        },
	        'onUploadSuccess'	:	function(file,data,response){
	        	var data = eval('('+data+')')
	            if(data.success) {
	    			bootbox.alert("上传成功", function() {
	    				$("#frontImage").find("li").each(function(i, e) {
	    					$(e).remove();
	    				});
	        			var li = "<li><img src=\"${basePath}/"+data.uploadPath+"\" width=\"140px\" height=\"80px\" alt=\"封面\"></li>"
						$("#frontImage").append(li);
						$("#imageurl").val(data.uploadPath);
					});   
				}
	        },
	        'onError'          :   function(file) {
	        	bootbox.alert("上传失败");
	        }    
		});
		
	});
</script>
<#include "/system/foot.ftl">
