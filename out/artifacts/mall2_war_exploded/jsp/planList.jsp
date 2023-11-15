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
<h3 class="last-updated">装机方案</h3>
<%@include file="/jsp/lunbo.jsp"%>
	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">


			<!--- Test-list ---->
			<div class="test-list" style="padding-top: 20px;">

				<form action="${pageContext.request.contextPath }/plan/blist" method="post" name="queryForm">
					<input type="hidden" name="pageIndex" value="1"/>
					<div class="container">

						<tbody><tr>
						<td>
							<select name="name" style="height: 35px;width:110px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;/* font-size: 0.85em; */color: #999;font-weight: bold;">
								<option value="" style="color: #999;font-weight: bold;">--请选择--</option>
									<option value="经济实惠型" style="color: #999;font-weight: bold;"
											<c:if test="${name=='经济实惠型'}">
												selected
											</c:if>
									>经济实惠型</option>
									<option value="学习家用型" style="color: #999;font-weight: bold;"
											<c:if test="${name=='学习家用型'}">
												selected
											</c:if>>学习家用型</option>
									<option value="网吧游戏型"  style="color: #999;font-weight: bold;"
											<c:if test="${name=='网吧游戏型'}">
												selected
											</c:if>>网吧游戏型</option>
								<option value="商务办公型"  style="color: #999;font-weight: bold;"
										<c:if test="${name=='商务办公型'}">
											selected
										</c:if>>商务办公型</option>
								<option value="豪华发烧型"  style="color: #999;font-weight: bold;"
										<c:if test="${name=='豪华发烧型'}">
											selected
										</c:if>>豪华发烧型</option>
							</select>
						</td>
						<td ><span>
                                    <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                             </span>
						</td>
						</tr></tbody>
					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <th>名称</th>
						  <th>类别</th>
						  <th>价格</th>
						  <th>操作</th>
					  </tr>
						<c:forEach var="plan" items="${list}" varStatus="status">
<%--							<tr style="cursor: pointer;" onclick="location='test-desc.html'">--%>
							<tr>
								<td>${plan.name}</td>
								<td>${plan.type}</td>
								<td>${plan.price}</td>
								<td style="width: 200px;">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/pdetail/blist?pid=${plan.id}" ><button   style="padding:2px 6px;background-color: #8F44AD;border-color: #8F44AD;"  type="button" class="btn btn-sm btn-info">查看详情</button></a>
									<a style="text-decoration: none;color: white;" class="updateNo" href="javascript:add(${plan.id})" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加所有</button></a>
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
			//href="${pageContext.request.contextPath}/carts/add?pid=${plan.id}"
			url:"${pageContext.request.contextPath }/carts/add?pid="+obj ,
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
