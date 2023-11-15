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

	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">
			<h3 class="last-updated" style="margin-bottom: 10px;">购物车</h3>
			<!--- Test-list ---->
			<div class="test-list" style="padding-top: 20px;">

				<form action="${pageContext.request.contextPath }/carts/list" method="post" name="queryForm">
					<input type="hidden" name="pageIndex" value="${pageIndex}"/>
					<div class="container">

					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <th>类别</th>
						  <th>名称</th>
						  <th>价格</th>
						  <th>数量</th>
						  <th>图片</th>
						  <th>操作</th>
					  </tr>
						<c:forEach var="carts" items="${list}" varStatus="status">
<%--							<tr style="cursor: pointer;" onclick="location='test-desc.html'">--%>
							<tr>
								<td>${carts.goods.type.name}</td>
								<td>${carts.goods.name}</td>
								<td>${carts.goods.price}</td>
								<td>
<%--									<input type="hidden" name="cid" id="cid" value="${carts.id}"/>--%>
									<input  class="btn btn6"  style="width:40px;text-align:center;"  onclick="jia(${carts.id},${carts.quantity})" value="+" type="button">
									<input style="width:40px;text-align:center;"  onclick="" readonly value="${carts.quantity}" id="quantity">
									<input  class="btn btn6"  style="width:40px;text-align:center;"  onclick="jian(${carts.id},${carts.quantity})" value="-" type="button">
								</td>
								<td>${carts.goods.pic}</td>
								<td>
									<button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector"><a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${carts.id})" ><i class="fa fa-trash-o" aria-hidden="true"></i></a></button>
								</td>
							</tr>
						</c:forEach>
					</table>
						<input  class="btn btn6"  style="width: 155px;text-align:center;margin-left: 985px;" id="price"  onclick="jiesuan()" readonly value="结算 总价:${price}元"  type="button" >
						<c:import url="rollpage.jsp"></c:import>
				</div>
				</form>
			</div>

			<!--- /Test-list ---->
		</section>
		<!-- //Test-list-section -->
		<!-- book an appointment -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script type="text/javascript">

			function jia(id,quantity){
				// var id=$("#cid").val();
				// var quantity=$("#quantity").val();
				$.getJSON("${pageContext.request.contextPath}/carts/addquantity",{"id":id,"quantity":quantity},function(data){
					if(data.Result == "true"){
						// alert("操作成功");
					}else if(data.Result == "false"){
						alert("操作失败");
					}else{
						alert("运行出错");
					}
					location.href="${pageContext.request.contextPath}/carts/list?pageIndex="+${pageIndex};
				});
			}
	// }
	function jian(id,quantity){
		    <%--location.href="${pageContext.request.contextPath}/carts?action=delquantity&id="+id+"&quantity="+quantity;--%>
			$.getJSON("${pageContext.request.contextPath}/carts/delquantity",{"id":id,"quantity":quantity},function(data){

				if(data.Result == "true"){
					// alert("操作成功");
				}else if(data.Result == "false"){
					alert("操作失败");
				}else{
					alert("运行出错");
				}
				// $("#quantity").val(data.quantity);
				// $("#price").val("结算 总价:"+data.price+"元");
				location.href="${pageContext.request.contextPath}/carts/list?pageIndex="+${pageIndex};

		});

	}

			function del(obj){
				if(confirm("是否删除 ")){
					$.ajax({
						type:"GET",
						url:"${pageContext.request.contextPath }/carts/del/"+obj ,
						// data:{method:"deluser",uid:obj.attr("userid")},
						dataType:"json",
						success:function(data){
							if(data.delResult == "true"){//删除成功：移除删除行
								alert("删除成功");
							}else if(data.delResult == "false"){//删除失败
								alert("对不起，删除失败");
							}else if(data.delResult == "notexist"){
								alert("对不起，该项不存在");
							}
						},
						error:function(data){
							alert("对不起，删除失败");
						}
					});
				}
				location.reload();
			}

	function jiesuan(){
		if(confirm("是否结算 ")){
			location.href="${pageContext.request.contextPath}/orders/add";
		}
	}

</script>
	
</script>

</body>
</html>
