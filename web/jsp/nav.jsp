<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<nav class="navbar nav_bottom" role="navigation" style="padding: 20px 0 20px;height: 60px;margin-top: 0px;
">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header nav_2">
            <img style="margin-top:-10px;" src="${pageContext.request.contextPath}/images/logo.jpg"/>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
            <ul class="nav navbar-nav nav_1" style="float: right;width: 77%;">
                <li><a href="${pageContext.request.contextPath}/goods/blist">商品搜索</a></li>
                <li><a href="${pageContext.request.contextPath }/plan/blist">装机方案</a></li>
                <li><a

                        <c:if test="${userSession==null}">
                            href="${pageContext.request.contextPath }/jsp/login.jsp"
                        </c:if>
                        <c:if test="${userSession!=null}">
                            href="${pageContext.request.contextPath }/carts/list"
                        </c:if>
                        >自助装机</a></li>

                <li><a
                    <c:if test="${userSession==null}">
                        href="${pageContext.request.contextPath }/jsp/login.jsp"
                    </c:if>
                    <c:if test="${userSession!=null}">
                        href="${pageContext.request.contextPath }/orders/blist"
                    </c:if>
                >订单信息</a></li>

                <c:if test="${userSession!=null}">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">欢迎您：${userSession.name}</a>
                    <ul style="background-color: #367795;" class="dropdown-menu"><li class="m_2"><a href="${pageContext.request.contextPath}/manage/jsp/index.jsp"><i class="fa fa-shield"></i>个人信息管理</a></li>
                    <li class="m_2"><a href="${pageContext.request.contextPath}/blogout"><i class="fa fa-lock"></i> 退出</a></li>
                    </ul>
                </li>

</c:if>
<c:if test="${userSession==null}">
    <li>
        <a href="${pageContext.request.contextPath }/jsp/login.jsp">登录</a>
    </li>
</c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<script>
    function toUpdate(){
        $("#updatePassModal").modal("show");
    }
</script>
<!-- Bootstrap Core CSS -->


