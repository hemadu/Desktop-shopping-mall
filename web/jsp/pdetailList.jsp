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
<h3 class="last-updated" >订单信息</h3>
<%@include file="/jsp/lunbo.jsp"%>
	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">

			<!--- Test-list ---->
			<div class="test-list" style="padding-top: 20px;">

				<form action="${pageContext.request.contextPath }/pdetail/blist" method="post" name="queryForm">
					<input type="hidden" name="pageIndex" value="1"/>
					<div class="container">


					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <th>商品名称</th>
						  <th>类别</th>
						  <th>单价</th>
						  <th>图片</th>
						  <th>数量</th>
						  <th>操作</th>
					  </tr>
						<c:forEach var="pdetail" items="${list}" varStatus="status">
							<tr >
								<td>${pdetail.goods.name}</td>
								<td>${pdetail.goods.type.name}</td>
								<td>${pdetail.goods.price}</td>
								<td style="line-height: 50px;" ><img src="${pageContext.request.contextPath}/images/${pdetail.goods.pic}"  style="max-height:48px;"></td>
								<td>${pdetail.quantity}</td>
								<td>
									<a style="text-decoration: none;color: white;" class="updateNo" href="javascript:add(${pdetail.id})"><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
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

<script>

	function add(obj){
		$.ajax({
			type:"GET",
			//href="${pageContext.request.contextPath}/carts/add?pdid=${pdetail.id}"
			url:"${pageContext.request.contextPath }/carts/add?pdid="+obj ,
			dataType:"json",
			success:function(data){
				if(data.addResult == "true"){
					alert("操作成功");
				}else if(data.addResult == "false"){
					alert("对不起，存在同类商品");
				}else if(data.addResult == "login"){
					alert("请登陆");
				}
				location.reload();
			},
			error:function(data){
				alert("对不起，出错了");
			}
		});
	}

</script>
</body>
</html>
