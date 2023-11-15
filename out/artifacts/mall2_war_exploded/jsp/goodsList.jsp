<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>

	<%@include file="/jsp/top.jsp"%>
	<!-- 首先引入jQuery和unslider -->
		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		</script>
		<!-- //for smooth scrolling -->
		  <!-- for easy-responsive-tabs -->	  
		<link rel="stylesheet" type="text/css" href="../css/easy-responsive-tabs.css " />
		<script src="../js/easyResponsiveTabs.js"></script>
		<script type="text/javascript">


    $(document).ready(function() {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
	<!-- //for easy-responsive-tabs -->
</head>
<body>
	<!-- header -->
	<%@include file="/jsp/nav.jsp"%>
	<h3 class="last-updated">商品列表</h3>
	<%@include file="/jsp/lunbo.jsp"%>


	<!-- //header -->
		<!-- Careers-section -->
		<section class="career-page">

			<!--- Careers ---->
			<div class="careers" style="padding-top: 0px;">
				<div class="container">

					<div class="job-lists">  
					   <div class="col-md-9 single_right">
					   <div class="lab-instruments">
						<div id="parentHorizontalTab">
							<div class="resp-tabs-container hor_1">
								<div>
									<div class="tab_grid" style="margin-bottom: 10px;">
										<div class="jobs-item with-thumb ">
											<c:forEach var="goods" items="${list}" varStatus="status">
											<div class="jobs_right col-xs-4 col-md-4" style="height:320px;background: rgba(247, 247, 247, 0.43);border: 1px solid rgba(0, 0, 0, 0.02);">
												<div class="date" style="background: #FFFFFF;"><img src="${pageContext.request.contextPath}/images/${goods.pic}"  style="max-height: 150px;"></div>
												<div class="date_desc" style="display: block">
													<h6 class="title" style="margin-bottom: 15px;overflow: hidden;white-space: nowrap; text-overflow: ellipsis;">${goods.name}
														<span class="title" style="display:block;font-size: 15px;color: #f33" >${goods.price}元</span>
													</h6>
												</div>
												<span class="title" style="font-size: 20px;">${goods.type.name}</span>
												<span class="title" >库存：${goods.quantity}</span>
												<hr/>
												<div style="height:50px;overflow: hidden;overflow: hidden;white-space: nowrap; text-overflow: ellipsis;text-overflow: ellipsis;">${goods.content}</div>
												<a style="color: white;    font-weight: 600;" class="updateNo">
													<button style="float: right;" class="btn btn-default" onclick="add(${goods.id})">添加</button>
													<button type="button" style="float: right;background-color: #00bcd4;margin-right:10px" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/goods/view?id=${goods.id}'">查看</button>
												</a>
											</div>
													<%--<div class="clearfix"> </div>--%>
<%--											<p class="description"> <a>商品浏览</a></p>--%>

												</c:forEach>

											<div class="clearfix"> </div>
										</div>
									</div>
								</div>
							</div>

							<c:import url="rollpage.jsp"></c:import>

						</div>
					</div>
				   </div>
				   <div class="col-md-3">
						  <div class="widget_search" style="margin-top: 35px;">
							  <form action="${pageContext.request.contextPath }/goods/blist" method="post" name="queryForm">
								  <input type="hidden" name="pageIndex" value="1"/>

								  <h5 class="widget-title">查找</h5>
							<div class="widget-content">
								<span>类别</span>
								<select id="tid" name="tid" class="form-control jb_1">
								</select>
								<span>商品名称</span>
								<input type="text" name="name" value="${name}" class="form-control jb_2" placeholder="请输入商品名称">
								<input type="submit" class="btn btn-default" value="查找">
							</div>
							  </form>
						  </div>

					  	 <h5 class="widget-title" style="margin-top: 20px;">热门套餐</h5>
					   <ul class="list-group">
						   <c:forEach items="${plist}" var="p" varStatus="st">
						   <li class="list-group-item">
							   <a href="${pageContext.request.contextPath}/pdetail/blist?pid=${p.id}">
							   <img src="${pageContext.request.contextPath}/images/z0${st.count}.jpg" style="max-width: 200px"/>
							   </a>
							   <p style="text-align: center;padding: 10px;font-size:13px;font-family: 微软雅黑">${p.name}-<span style="color:#F1C40F">${p.price}</span>元</p>
						   </li>
						   </c:forEach>
					   </ul>
					   </div>
				  <div class="clearfix"> </div>
				 </div>
			</div>
			</div>
			<!--Horizontal Tab-->
			<!--- /Careers ---->
		</section>
		<!-- //Careers-section -->
		<!-- book an appointment -->


	<script>

		//加载类别
		$.getJSON("${pageContext.request.contextPath }/type/jsonlist",function(data){
			$("#tid").html("<option value=''>类别</option>");
			$(data).each(function(index,d){
				if('${requestScope.tid}'==d.id){
					$("#tid").append("<option selected value='"+d.id+"'>"+d.name+" </option>");
				}else{
					$("#tid").append("<option value='"+d.id+"'>"+d.name+" </option>");
				}
				});
			//form.render('select'); //刷新select选择框渲染
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
		</body>

</html>