<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>自助装机</title>
</head>
<body>
<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div style="line-height:100px;float:left;">
        <img style="float:left;margin-top:0px;" src="${pageContext.request.contextPath}/images/bklogo.png"/>
        <h3 style="float:right;margin-left:10px;line-height:100px;font-size: 22px;">自助装机</h3>
    </div>
    <!-- /.navbar-header -->
    <ul class="nav navbar-nav navbar-right" >
        <li class="dropdown">
            <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img  style="margin-top:33px;" src="${pageContext.request.contextPath}/images/logout.png" alt=""/></a>
            <ul class="dropdown-menu">
<%--                <li class="m_2"><a href="${pageContext.request.contextPath }/users/update"><i class="fa fa-wrench"></i> 个人资料</a></li>--%>
                <li class="m_2"><a href="javascript:toUpdate()"><i class="fa fa-shield"></i> 修改密码</a></li>
                <li class="m_2"><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-lock"></i> 退出</a></li>
            </ul>
        </li>
    </ul>

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
<%--                <li>--%>
<%--                    <a href="index.html"><i class="fa fa-dashboard fa-fw nav_icon"></i>首页</a>--%>
<%--                </li>--%>

    <li>
        <a href="${pageContext.request.contextPath }/manage/jsp/index.jsp"><i class="fa fa-bars nav_icon"></i>首页</a>
    </li>

    <li>
        <a href="${pageContext.request.contextPath }/update"><i class="fa fa-user nav_icon"></i> 个人信息</a>
    </li>

    <c:if test="${userSession.role==0}">
    <li>
        <a href="${pageContext.request.contextPath }/address/list"><i class="fa fa-minus-circle nav_icon"></i>地址管理</a>
    </li>
    </c:if>

    <c:if test="${userSession.role==1}">
        <li>
            <a href="${pageContext.request.contextPath }/users/list"><i class="fa fa-users nav_icon"></i>用户管理</a>
            <a href="${pageContext.request.contextPath }/orders/list"><i class="fa fa-table nav_icon"></i>订单管理</a>
            <a href="${pageContext.request.contextPath }/goods/list?change=0"><i class="fa fa-book nav_icon"></i>商品管理</a>
            <a href="${pageContext.request.contextPath }/plan/list"><i class="fa fa-envelope nav_icon"></i>装机方案管理</a>
            <a href="${pageContext.request.contextPath }/type/list"><i class="fa fa-minus-circle nav_icon"></i>类别管理</a>
            <a href="${pageContext.request.contextPath }/manage/jsp/sum.jsp"><i class="fa fa-globe nav_icon"></i>统计管理</a>
        </li>
    </c:if>

            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>

<script>
    function toUpdate(){
        $("#updatePassModal").modal("show");
    }
</script>
<link href="${pageContext.request.contextPath }/manage/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath }/manage/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/manage/js/custom.js"></script>

</body>
</html>