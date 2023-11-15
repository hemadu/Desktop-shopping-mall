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
<h3 class="last-updated">订单信息</h3>
<%@include file="/jsp/lunbo.jsp"%>
	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">

			<!--- Test-list ---->
			<div class="test-list" style="padding-top: 20px;">

				<form action="${pageContext.request.contextPath }/odetail/blist" method="post" name="queryForm">
					<input type="hidden" name="pageIndex" value="1"/>
					<input type="hidden" name="oid" value="${oid}"/>
					<div class="container">


					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <th>商品名称</th>
						  <th>类别</th>
						  <th>单价</th>
						  <th>图片</th>
						  <th>数量</th>
					  </tr>
						<c:forEach var="odetail" items="${list}" varStatus="status">
							<tr >
								<td>${odetail.goods.name}</td>
								<td>${odetail.goods.type.name}</td>
								<td>${odetail.goods.price}</td>
								<td style="line-height: 50px;" ><img src="${pageContext.request.contextPath}/images/${odetail.goods.pic}"  style="max-height:48px;"></td>
								<td>${odetail.quantity}</td>
							</tr>
						</c:forEach>
					</table>
						<c:import url="rollpage.jsp"></c:import>
				</div>
				</form>
			</div>

			<!--- /Test-list ---->
		</section>
		<!-- //Test-list-section -->
		<!-- book an appointment -->

</body>
</html>
