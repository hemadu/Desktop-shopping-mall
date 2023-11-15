<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/manage/jsp/script.jsp"%>
</head>
<body>
<div id="wrapper">
	<!-- Navigation -->
	<%@include file="/manage/jsp/top.jsp"%>
	<div id="page-wrapper">
		<div class="graphs">
			<div class="xs">
				<ol class="breadcrumb" style="font-size: 1.3em;line-height: 1.5px;padding: 8px 5px;">
					<li><a >商品管理</a></li>
					<!--               <li class="active">Data</li>-->
				</ol>
				<div class="tab-content">
					<div class="tab-pane active" id="horizontal-form">
						<form id="userForm" class="form-horizontal" name="userForm" method="post" action="${pageContext.request.contextPath }/goods/add">
							<div class="form-group">
								<label class="col-sm-2 control-label">类型</label>
								<div class="col-sm-8">
									<select id="tid" name="tid" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
									</select>
								</div>
							</div>

							<div class="form-group">
								<label  class="col-sm-2 control-label">名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="name"  >
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">单价</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="price">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">库存</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="quantity"  >
								</div>
							</div>

							<div class="form-group">
								<label  class="col-sm-2 control-label">描述</label>
								<div class="col-sm-8"  id="editor">

								</div>
								<input type="hidden" id="content" name="content"/>
							</div>
<%--							<div class="form-group">--%>
<%--								<label for="disabledinput" class="col-sm-2 control-label">ID</label>--%>
<%--								<div class="col-sm-8">--%>
<%--									<input readonly="readonly" type="text" class="form-control1" name="id" value="${goods.id}">--%>
<%--								</div>--%>
<%--							</div>--%>

							<div class="btns" style="margin-left: 125px;">
								<label id="picker">选择图片</label>
								<img src="${pageContext.request.contextPath}/images" id="show" style="max-width:40px;margin-left: 30px;margin-bottom: 10px;"/>
							</div>
							<input  type="hidden" class="common-text required" id="img"  name="pic" value="">

							<div class="form-group" style="margin-left: 500px;margin-top: 50px;" >
								<button type="submit" class="btn btn-primary" style="margin-right:40px">确认</button>
								<button type="button" onclick="history.go(-1)" class="btn btn-default">返回</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<!-- Nav CSS -->

<!--外层的div-->
<%@include file="/manage/jsp/bottom.jsp"%>
<link href="${pageContext.request.contextPath}/manage/css/custom.css" rel="stylesheet">

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/manage/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/webuploader/webuploader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/wangEditor.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webuploader/webuploader.css"/>

<script>

	//加载类别
	$.getJSON("${pageContext.request.contextPath }/type/jsonlist",function(data){
		$("#tid").html("<option value=''>类别</option>");
		$(data).each(function(index,d){
			if('${requestScope.tid}'==d.id){
				$("#tid").append("<option selected value='"+d.id+"'>"+d.name+" </option>");
			}else{
				$("#tid").append("<option value='"+d.id+"'>"+d.name+" </option>");
			}
		});
		//form.render('select'); //刷新select选择框渲染
	});

	var uploader = WebUploader.create({
		// swf文件路径
		swf : '${pageContext.request.contextPath }/webuploader/Uploader.swf',//高版本浏览器可以不要
		// 文件接收服务端。
		server : '${pageContext.request.contextPath }/upfile',
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick : '#picker',
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize : false
	});
	//当选择文件之后，就开始上传
	uploader.on('fileQueued', function(file) {
		// 选中文件时要做的事情，比如在页面中显示选中的文件并添加到文件列表，获取文件的大小，文件类型等
		uploader.upload();//可以选择之后就上传
	});
	//上传成功后
	uploader.on("uploadSuccess", function(file, response) {
		alert("上传成功!");
		$("#show").attr("src","${pageContext.request.contextPath }/images/"+response.filename).show();
		$("#img").val(response.filename);//获取服务响应的文件名
	});

	//富文本框
	var E = window.wangEditor;
	var editor = new E('#editor');
	editor.customConfig.uploadFileName = 'file';
	editor.customConfig.uploadImgServer = '${pageContext.request.contextPath }/upload';

	//当内容改变时修改content
	editor.customConfig.onchange = function (html) {
		$("#content").val(html);
	}
	$("#content").val('${goods.content}');
	editor.create();
	//给富文本框赋值
	editor.txt.html('${goods.content}');
</script>
</body>
</html>
