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
		function update(id,status){
			if(confirm("是否执行该操作?")){
				location.href="${pageContext.request.contextPath}/orders/bupdate?id="+id+"&status="+status;
			}
		}
		function dodelete(id){
			if(confirm("是否执行该操作?")){
				location.href="${pageContext.request.contextPath}/orders/bupdate?id="+id+"&isdel=1";
			}
		}
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

				<form action="${pageContext.request.contextPath }/orders/blist" method="post" name="queryForm">
					<input type="hidden" name="pageIndex" value="1"/>
					<div class="container">


					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <th>总计</th>
						  <th>订单编号</th>
						  <th>数量</th>
						  <th>类型</th>
						  <th>状态</th>
						  <th>操作</th>
					  </tr>
						<c:forEach var="orders" items="${list}" varStatus="status">
							<tr >
								<td>${orders.price}</td>
								<td>${orders.no}</td>
								<td>${orders.quantity}</td>
								<td>${orders.type}</td>
								<td>${orders.status}</td>
								<td >
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/odetail/blist?oid=${orders.id}" ><button   style="padding:2px 6px;background-color: #8F44AD;border-color: #8F44AD;"  type="button" class="btn btn-sm btn-info">查看详情</button></a>
									<c:if test="${orders.status!='申请退货' and orders.status!='已退货'}">
										<a style="text-decoration: none;color: white;" class="updateNo" href="javascript:update('${orders.id}','申请退货')" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">申请退货</button></a>
									</c:if>
									<c:if test="${orders.status=='已发货'}">
										<a style="text-decoration: none;color: white;" class="updateNo" href="javascript:update('${orders.id}','已签收')" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-success">签收</button></a>
									</c:if>
									<c:if test="${orders.status=='未发货' or orders.status=='已完成'}">
										<a style="text-decoration: none;color: white;" class="updateNo" href="javascript:dodelete('${orders.id}')" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-danger">删除</button></a>
									</c:if>
									<%--未发货，已发货，申请退货，已退货，已签收--%>

								</td>
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
