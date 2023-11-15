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
<h3 class="last-updated">购物车</h3>
<%@include file="/jsp/lunbo.jsp"%>
	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">

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
						  <th>图片</th>
						  <th>操作</th>
					  </tr>
						<tr>
								<td>CPU*</td>
								<td>${cpu.goods.name}</td>
								<td>${cpu.goods.price}</td>
							<td>
							<c:if test="${cpu.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${cpu.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
								<c:if test="${cpu.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=1" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${cpu.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${cpu.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>
							</td>
							</tr>

						<tr>
							<td>主板*</td>
							<td>${zb.goods.name}</td>
							<td>${zb.goods.price}</td>

							<td>
							<c:if test="${zb.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${zb.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
								<c:if test="${zb.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=2" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${zb.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${zb.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>内存*</td>
							<td>${nc.goods.name}</td>
							<td>${nc.goods.price}</td>

							<td>
							<c:if test="${nc.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${nc.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${nc.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=3" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${nc.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${nc.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>硬盘</td>
							<td>${yp.goods.name}</td>
							<td>${yp.goods.price}</td>

							<td>
							<c:if test="${yp.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${yp.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${yp.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=4" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${yp.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${yp.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>固态硬盘</td>
							<td>${gtyp.goods.name}</td>
							<td>${gtyp.goods.price}</td>

							<td>
							<c:if test="${gtyp.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${gtyp.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${gtyp.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=5" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${gtyp.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${gtyp.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>显卡</td>
							<td>${xk.goods.name}</td>
							<td>${xk.goods.price}</td>

							<td>
							<c:if test="${xk.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${xk.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${xk.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=6" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${xk.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${xk.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>显示器</td>
							<td>${xsq.goods.name}</td>
							<td>${xsq.goods.price}</td>

							<td>
							<c:if test="${xsq.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${xsq.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${xsq.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=7" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${xsq.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${xsq.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>机箱</td>
							<td>${jx.goods.name}</td>
							<td>${jx.goods.price}</td>

							<td>
							<c:if test="${jx.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${jx.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${jx.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=8" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${jx.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${jx.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>电源</td>
							<td>${dy.goods.name}</td>
							<td>${dy.goods.price}</td>

							<td>
							<c:if test="${dy.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${dy.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${dy.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=9" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${dy.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${dy.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>散热器</td>
							<td>${srq.goods.name}</td>
							<td>${srq.goods.price}</td>

							<td>
							<c:if test="${srq.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${srq.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${srq.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=10" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${srq.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${srq.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>鼠标</td>
							<td>${sb.goods.name}</td>
							<td>${sb.goods.price}</td>

							<td>
							<c:if test="${sb.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${sb.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${sb.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=11" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${sb.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${sb.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>键盘</td>
							<td>${jp.goods.name}</td>
							<td>${jp.goods.price}</td>

							<td>
							<c:if test="${jp.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${jp.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${jp.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=12" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${jp.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${jp.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>键鼠套装</td>
							<td>${jstz.goods.name}</td>
							<td>${jstz.goods.price}</td>

							<td>
							<c:if test="${jstz.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${jstz.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${jstz.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=13" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${jstz.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${jstz.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>音箱</td>
							<td>${yx.goods.name}</td>
							<td>${yx.goods.price}</td>

							<td>
							<c:if test="${yx.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${yx.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${yx.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=14" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${yx.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${yx.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>光驱</td>
							<td>${gq.goods.name}</td>
							<td>${gq.goods.price}</td>

							<td>
							<c:if test="${gq.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${gq.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${gq.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=15" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${gq.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${gq.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>声卡</td>
							<td>${sk.goods.name}</td>
							<td>${sk.goods.price}</td>

							<td>
							<c:if test="${sk.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${sk.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${sk.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=16" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${sk.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${sk.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

						<tr>
							<td>网卡</td>
							<td>${wk.goods.name}</td>
							<td>${wk.goods.price}</td>

							<td>
							<c:if test="${wk.goods.pic!=null}">
								<img src="${pageContext.request.contextPath}/images/${wk.goods.pic}"  style="max-height:48px;">
							</c:if>
							</td>
							<td style="width: 200px;">
									<c:if test="${wk.goods==null}">
									<a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/goods/blist?tid=17" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">添加</button></a>
								</c:if>
								<c:if test="${wk.goods!=null}">
								<a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${wk.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector">删除</button></a>
								</c:if>	
							</td>
						</tr>

					</table>
						<input  class="btn btn6"  style="width: 155px;text-align:center;margin-left: 985px;" id="price"  onclick="jiesuan()" readonly value="结算 总价:${price}元"  type="button" >

				</div>
				</form>
			</div>

			<!--- /Test-list ---->
		</section>
		<!-- //Test-list-section -->
		<!-- book an appointment -->

<script type="text/javascript">

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
							location.reload();
						},
						error:function(data){
							alert("对不起，删除失败");
						}
					});
				}
			}

	function jiesuan(){
		if(confirm("是否结算 ")){
			location.href="${pageContext.request.contextPath}/orders/add";
		}
	}

</script>


</body>
</html>
