<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/manage/jsp/script.jsp"%></head>
<body id="login">
  <div class="login-logo">
 </div>
  <h2 class="form-heading" style="font-size: 35px;">装机大师后台登录</h2>
  <div class="app-cam">
	  <form class="loginForm" action="${pageContext.request.contextPath}/login" name="actionForm" id="actionForm"  method="post" >
		  <input name="username" id="username"  placeholder="请输入用户名" type="text" class="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
		<input  name="password" id="password"   placeholder="请输入密码" type="password" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">

		  <div class="submit"><input type="submit"  value="登录"></div>

		<ul class="new" style="    margin: 0em 0 0 0;">
<%--			new_left--%>
			<li class="new_right"><p><a href="${pageContext.request.contextPath }/">返回</a></p></li>
<%--			<li class="new_right"><p class="sign">没有账户 ?<a href="${pageContext.request.contextPath }/manage/jsp/register.jsp"> 注册</a></p></li>--%>
	<div class="clearfix"></div>
		</ul>


	</form>
  </div>
  <div class="cp" style="text-align: center;width:80%;margin: 50px auto">
	  <div style="display: inline-block"><img src="${pageContext.request.contextPath }/images/b1.jpg" style="width: 200px;height:160px;margin:10px"/> </div>
	  <div style="display: inline-block"><img src="${pageContext.request.contextPath }/images/b2.jpg" style="width: 200px;height:160px;margin:10px"/> </div>
	  <div style="display: inline-block"><img src="${pageContext.request.contextPath }/images/b3.jpg" style="width: 200px;height:160px;margin:10px"/> </div>
	  <div style="display: inline-block"><img src="${pageContext.request.contextPath }/images/b4.jpg" style="width: 200px;height:160px;margin:10px"/> </div>
	  <div style="display: inline-block"><img src="${pageContext.request.contextPath }/images/b5.jpg" style="width: 200px;height:160px;margin:10px"/> </div>
  </div>
</body>
<script>

</script>
</html>
