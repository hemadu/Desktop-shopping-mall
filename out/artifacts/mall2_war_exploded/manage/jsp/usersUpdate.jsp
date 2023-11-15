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
					<li><a >用户信息</a></li>
					<!--               <li class="active">Data</li>-->
				</ol>
				<div class="tab-content">
					<div class="tab-pane active" id="horizontal-form">
						<form id="userForm" class="form-horizontal" name="userForm" method="post" action="${pageContext.request.contextPath }/users/updateexe">
							<input type="hidden" class="form-control1" name="id"  value="${users.id}">

							<div class="form-group">
								<label  class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="name"  value="${users.name}">
								</div>
							</div>

							<div class="form-group">
								<label for="disabledinput" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-8">
									<input readonly="readonly" type="text" class="form-control1" id="disabledinput" name="username" value="${users.username}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">身份</label>
								<div class="col-sm-8">
									<div class="checkbox-inline"><label><input type="radio"  name="role"  value="0"
																			   <c:if test="${users.role==0}">checked
									</c:if>
									>会员
									</label></div>
									<div class="checkbox-inline"><label><input type="radio"  name="role"  value="1"
																			   <c:if test="${users.role==1}">checked
									</c:if>
									> 管理员</label></div>
								</div>
							</div>

<%--							<label id="picker" class="col-sm-2 control-label">选择头像</label>--%>

							<div class="form-group" style="margin-left: 500px;margin-top: 50px;" >
								<button type="submit" class="btn btn-primary" style="margin-right:40px">确定</button>
								<button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
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
