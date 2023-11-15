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
		function add(obj){
			$.ajax({
				type:"GET",
				//"${pageContext.request.contextPath}/carts/add?id=${goods.id}"
				url:"${pageContext.request.contextPath }/carts/add?id="+obj ,
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
		<!-- //for smooth scrolling -->
</head>
<body>
<%@include file="/jsp/nav.jsp"%>
<h3 class="last-updated">商品详情</h3>
<%@include file="/jsp/lunbo.jsp"%>
	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">
			<!--- Test-list ---->
			<div class="test-list" style="padding-top: 20px;">


					<div class="container">


					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <td>商品名称</td>
						  <td>${goods.name}</td>
					  </tr>
						<tr>
							<td>商品类型</td>
							<td>${goods.type.name}</td>
						</tr>
						<tr>
						  <td>单价</td>
						  <td>${goods.price}元</td>
						</tr>
						<tr>
						  <td>图片</td>
						  <td><img src="${pageContext.request.contextPath}/images/${goods.pic}"  style="max-height: 450px;"></td>
						</tr>
						<tr>
						  <td>库存</td>
							<td>${goods.quantity}</td>
						</tr>

						<tr>
							<td>描述</td>
							<td>${goods.content}</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button class="btn btn-default" type="button" onclick="add(${goods.id})">添加</button>
								<button  type="button" style="background-color: #F1C40F;margin-right:10px" class="btn btn-default" onclick="history.go(-1)">返回</button>

							</td>

						</tr>
					</table>

				</div>

			</div>
		</section>
</body>
</html>
