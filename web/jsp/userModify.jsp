<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/jsp/top.jsp"%>

		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		</script>
		<!-- //for smooth scrolling -->
</head>
<body>
<%@include file="/jsp/nav.jsp"%>
<h3 class="last-updated" style="margin-bottom: 45px;">个人信息</h3>
<!-- //header -->
		<!-- Book-a-test-section -->
		<section class="book-a-test">
			<!--- Book-a-test ---->
			<div class="test-booking" style="padding-top: 0px;">
				<div class="container">
					<div class="text-booking-form">
						<div class="col-md-6 text-booking-form-left" style="width: 80%;">
							<form id="userForm" class="form-horizontal" name="userForm" method="post" action="${pageContext.request.contextPath }/bupdateexe">
								<input type="hidden"  name="id" value="${userSession.id}"/>

								<label>姓名 <span>*</span></label>
									<input type="text" name="name"  value="${userSession.name}" class="phone" placeholder="">
									<div class="clearfix"></div>
								<label>地址 <span>*</span></label>
								<input type="text" name="address"  value="${userSession.address}" class="phone" placeholder="">
								<div class="clearfix"></div>
								<label>电话 <span>*</span></label>
								<input type="text" name="phone"  value="${userSession.phone}"  class="phone" placeholder="">
								<div class="clearfix"></div>
								<label>用户名 <span>*</span></label>
								<input type="text" name="username" value="${userSession.username}" class="phone" placeholder=""readonly="readonly">
								<div class="clearfix"></div>


									<div class="book-submit">
										<input type="submit" value="保存" style="margin-left: 250px;">
									</div>
							</form>
						</div>

						<div class="clearfix"></div>
					</div>

				</div>
			</div>
			<!--- /Book-a-test ---->
		</section>
		<!-- //Book-a-test-section -->

		<!-- footer -->

		<!-- //footer -->
		<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear'
					 		};
							*/

							$().UItoTop({ easingType: 'easeOutQuart' });

						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<script type="text/javascript" src="${pageContext.request.contextPath }/webuploader/webuploader.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webuploader/webuploader.css"/>

</body>
</html>