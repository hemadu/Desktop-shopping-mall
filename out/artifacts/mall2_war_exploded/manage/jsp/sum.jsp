<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/manage/jsp/script.jsp"%>
	<meta charset="utf-8">
	<title>ECharts</title>
	<!-- 引入 echarts.js -->
	<script src="${pageContext.request.contextPath}/manage/js/echarts.min.js"></script>
</head>
<body>
<div id="wrapper">
	<!-- Navigation -->
	<%@include file="/manage/jsp/top.jsp"%>
	<div id="page-wrapper">
		<div class="graphs">
			<div class="xs">
				<ol class="breadcrumb" style="font-size: 1.3em;line-height: 1.5px;padding: 8px 5px;">
					<li><a>统计</a></li>
					<!--               <li class="active">Data</li>-->
				</ol>

				<div class="search-wrap" style="margin-left: 5px">
					<div class="search-content">
<%--						enctype="multipart/form-data"--%>
						<form method="post"  id="formSubmit">
							<input type="hidden" name="pageIndex" value="1"/>
							<div class="input-group">

							</div><!-- Input Group -->
						</form>
					</div>
				</div>

				<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
				<div id="main" style="width: 600px;height:400px;"></div>

			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<!-- Nav CSS -->

<!--外层的div-->
<%@include file="/manage/jsp/bottom.jsp"%>
<link href="${pageContext.request.contextPath}/manage/css/custom.css" rel="stylesheet">

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/manage/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/webuploader/webuploader.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webuploader/webuploader.css"/>
<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	// 指定图表的配置项和数据
	// ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '7月', '9月', '10月', '11月', '12月'];
	// [220, 182, 191, 234, 290, 330, 310, 123, 442, 321, 90, 149, 210, 122, 133, 334, 198, 123, 125, 220];
	 var dataAxis =[];
	 var data = [];
	 var yMax = 500;
	 var dataShadow = [];

	 for (var i = 0; i < data.length; i++) {
	 	dataShadow.push(yMax);
	 }

	option = {
		title: {
			text: '年各月销售量',

		},
		xAxis: {
			data: dataAxis,
			axisLabel: {
				inside: true,
				textStyle: {
					color: '#fff'
				}
			},
			axisTick: {
				show: false
			},
			axisLine: {
				show: false
			},
			z: 10
		},
		yAxis: {
			axisLine: {
				show: false
			},
			axisTick: {
				show: false
			},
			axisLabel: {
				textStyle: {
					color: '#999'
				}
			}
		},
		dataZoom: [
			{
				type: 'inside'
			}
		],
		series: [
			{
				type: 'bar',
				showBackground: true,
				itemStyle: {
					color: new echarts.graphic.LinearGradient(
							0, 0, 0, 1,
							[
								{offset: 0, color: '#83bff6'},
								{offset: 0.5, color: '#188df0'},
								{offset: 1, color: '#188df0'}
							]
					)
				},
				emphasis: {
					itemStyle: {
						color: new echarts.graphic.LinearGradient(
								0, 0, 0, 1,
								[
									{offset: 0, color: '#2378f7'},
									{offset: 0.7, color: '#2378f7'},
									{offset: 1, color: '#83bff6'}
								]
						)
					}
				},
				data: data
			}
		]
	};

	// Enable data zoom when user click bar.
	var zoomSize = 6;
	myChart.on('click', function (params) {
		console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
		myChart.dispatchAction({
			type: 'dataZoom',
			startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
			endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
		});
	});

	$.getJSON("${pageContext.request.contextPath }/orders/getSum",{},function(data1){
		for(var i=0;i<data1.length;i++){
			dataAxis.push(data1[i].noName);
			data.push(data1[i].num);
			//option.series.data.push(data[i].num);
			//option.xAxis.data.push(data[i].noName);
			// option.yAxis.data.push(data[i].noName);
			// option.series[0].data.push(data[i].num1);
			// option.series[1].data.push(data[i].num2);
		}
		myChart.setOption(option);
	});

</script>
</body>
</html>
