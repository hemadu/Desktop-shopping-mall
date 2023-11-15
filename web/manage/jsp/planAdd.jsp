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
					<li><a >方案管理</a></li>
					<!--               <li class="active">Data</li>-->
				</ol>
				<div class="tab-content">
					<div class="tab-pane active" id="horizontal-form">
						<form id="userForm" class="form-horizontal" name="userForm" method="post" action="${pageContext.request.contextPath }/plan/add">
							<input type="hidden" class="form-control1" name="price" value="0" >

							<div class="form-group">
								<label  class="col-sm-2 control-label">名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="name" >
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">类型</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="type" >
								</div>
							</div>
<%--							<label id="picker" class="col-sm-2 control-label">选择头像</label>--%>

							<div class="form-group" style="margin-left: 500px;margin-top: 50px;" >
								<button type="submit" class="btn btn-primary" style="margin-right:40px">确认</button>
								<button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
							<%--								<button type="reset" class="btn btn-default">返回</button>--%>
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
   <link href="${pageContext.request.contextPath }/manage/css/custom.css" rel="stylesheet">

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath }/manage/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/manage/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/webuploader/webuploader.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webuploader/webuploader.css"/>

</body>
</html>
