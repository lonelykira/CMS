<#assign menu="video">
<#assign submenu="add_video">
<#include "/system/head.ftl">
<link type="text/css" rel="stylesheet" href="${basePath}/system/js/videojs/video.css" >
<script type="text/javascript" src="${basePath}/system/js/videojs/video.dev.js"></script>
<script type="text/javascript" src="${basePath}/system/js/videojs/html5media.min.js"></script>
<script type="text/javascript" src="${basePath}/system/js/admin/videoFactory/add-videoFactory.js"></script>
<script>
</script>
<!--main content start-->
<form name="save-videofactory" id="save-videofactory" action="save-videoFactory.htm" method="post">
	<input name="videoFactoryId" id="videoFactoryId" value="${videoFactory.videoFactoryId!''}">
	<input name="frontCoverUrl" id="frontCoverUrl" value="${videoFactory.frontCoverUrl!''}">
	<input name="videoUrl" id="videoUrl" value="${videoFactory.videoUrl!''}">
	<input name="createUser" id="createUser" value="${videoFactory.createUser!''}">
	<input name="createTime" id="createTime" value="${videoFactory.dateFormat(videoFactory.createTime, 'yyyy-MM-dd HH:mm:ss')}">
	<input name="updateUser" id="updateUser" value="${videoFactory.updateUser!''}">
	<input name="updateTime" id="updateTime" value="${videoFactory.dateFormat(videoFactory.updateTime, 'yyyy-MM-dd HH:mm:ss')}">
	<section id="main-content">
		<section class="wrapper">
			<!-- page start-->
			<div class="row">
				<div class="col-lg-7" align="center">
					<div class="span12" align="center">
						视频管理
					</div>
					<div class="input-group">
				    	<span class="input-group-addon">标题</span>
				       	<input type="text" name="videoTitle" id="videoTitle" value="${videoFactory.videoTitle!''}" class="form-control" placeholder="标题">
				    </div>
				    <br>
				    <div class="input-group">
				    	<span class="input-group-addon">标签</span>
				       	<input type="text" class="form-control" id="tag" name="tag" value="${videoFactory.tag!''}" placeholder="标签">
				    </div>
				    <br>
				    <section class="panel" style="height:150px;">
	                  	<div class="panel-body" align="left">
	                      	<span>封面</span>
	                      	<ul class="grid cs-style-3" id="pictureul">
	                      		<#if videoFactory.frontCoverUrl?exists && videoFactory.frontCoverUrl !=''>
	                      			<li><img src="${basePath}/${videoFactory.frontCoverUrl}" width="140px" height="80px" alt="封面"></li>
	                      		</#if>
	                      	</ul>
	                 	</div>
	                  	<div class="panel-body">
	                  	  	<button id="picture_upload"  class="btn btn-shadow btn-info" type="button"><i class="icon-cloud-upload"></i>添加附件</button>
	                  	</div>
	             	</section>
					<section class="panel" style="height:400px;">
						<div class="panel-body" style="float:left;width:40%" align="left">
	                      	<span>视频</span>
	                      	<ul class="grid cs-style-3" id="videoul">
	                      		<#if videoFactory.videoUrl?exists && videoFactory.videoUrl !=''>
	                      			<li>
		                      			<video id="video" name="video" class="video-js vjs-default-skin" controls preload="auto" width="430" height="350" poster="${basePath}/${videoFactory.frontCoverUrl}" data-setup="{}">
										    <source src="${basePath}/${videoFactory.videoUrl}" type='video/mp4' />
										    <source src="${basePath}/${videoFactory.videoUrl}" type='video/webm' />
										    <source src="${basePath}/${videoFactory.videoUrl}" type='video/ogg' />
									  	</video>
	                      			</li>
	                      		</#if>
	                      	</ul>
	                 	</div>
	                  	<div class="panel-body">
	                  	  	<button id="video_upload"  class="btn btn-shadow btn-info" type="button"><i class="icon-cloud-upload"></i>添加附件</button>
	                  	</div>
		             </section>
					 <section class="panel">
					 	<div class="panel-body" align="left">
					 		<span>简介</span>
							<textarea rows="5" class="form-control" name="introduction" id="introduction" maxlength="300">${videoFactory.introduction!''}</textarea>
						</div>
					</section>
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
        'uploader'    		: 	'${basePath}/admin/video/save-video.json;jsessionid=${JSESSIONID}?sid=${JSESSIONID}',
        'fileObjName'		: 	'file',
        'fileTypeExts' 		: 	'*.mp4; *.swf; *.flv; *.avi',
        'method'			:	'post',
        'onQueueComplete' 	: 	function(file, data, response) {
        		  
        },
        'onUploadSuccess'	:	function(file,data,response){
        	var data = eval('('+data+')')
            if(data.success) {
    			bootbox.alert("上传成功", function() {
    				$("#videoul").find("li").each(function(i, e) {
    					$(e).remove();
    				});
        			var li = "<li><embed src=\"${basePath}/"+data.uploadPath+"\" autostart=false controls=console loop=false width=\"430px\" height=\"350px\"></li>";
					$("#videoul").append(li);
					$("#videoUrl").val(data.uploadPath);
				});   
			}
        },
        'onError'          :   function(file) {
        	bootbox.alert("上传失败");
        }   
	});
	
	//上传图片
	$('#picture_upload').uploadify({
		'buttonText'  		: 	'请选择图片',
        'swf'         		: 	'${basePath}/system/assets/uploadify/uploadify.swf',
        'uploader'    		: 	'${basePath}/admin/video/save-picture.json;jsessinid=${JSESSIONID}?sid=${JSESSIONID}',
        'fileObjName'		: 	'file',
        'fileTypeExts' 		: 	'*.jpg; *.png; *.gif',
        'method'			:	'post',
        'onQueueComplete' 	: 	function(file, data, response) {
    		
        },
        'onUploadSuccess'	:	function(file,data,response){
        	var data = eval('('+data+')')
            if(data.success) {
    			bootbox.alert("上传成功", function() {
    				$("#pictureul").find("li").each(function(i, e) {
    					$(e).remove();
    				});
        			var li = "<li><img src=\"${basePath}/"+data.uploadPath+"\" width=\"140px\" height=\"80px\" alt=\"封面\"></li>"
					$("#pictureul").append(li);
					$("#frontCoverUrl").val(data.uploadPath);
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
